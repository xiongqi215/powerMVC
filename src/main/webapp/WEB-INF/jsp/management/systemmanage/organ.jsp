<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">
var member_datagrid;//菜单列表
var member_tree;//菜单树(左边)
var member_search_form;//菜单搜索表单
var member_dialog;//菜单表单弹出对话框
var member_form;//菜单表单
$(function() {
	var centerWidth = $('body').width();
	$(window).resize(function() {
			reload();
		});
	member_search_form = $('#member_search_form').form();
	var selectedNode = null;//存放被选中的节点对象 临时变量
	//菜单树(左边)
	member_tree = $("#member_tree").tree( {
		url : '${ctx}/json/tree_data1.json',
			onClick : function(node) {
				search();
			}
	});
	
	
	loadtable(centerWidth);
});

function loadtable(centerWidth) {
	//数据列表         
	member_datagrid = $('#member_datagrid').datagrid( {
		url : '${ctx}/organ/list.do',
		pagination : true,//底部分页
		pagePosition : 'bottom',//'top','bottom','both'.
		rownumbers : true,//显示行数
		fit : true,
		singleSelect : true,
		fitColumns : centerWidth > 840 ? true : false,//自适应列宽
		striped : true,//显示条纹
		pageSize : 2,//每页记录数
		SremoteSort : false,//是否通过远程服务器对数据排序
		sortName : 'id',//默认排序字段
		sortOrder : 'asc',//默认排序方式 'desc' 'asc'
		idField : 'id',
		columns : [ [ {
			field : 'ck',
			checkbox : true,
			width : 100
		}, {
			field : 'Id',
			title : '主键',
			hidden : true,
			sortable : true,
			align : 'right',
			width : 80
		}, {
			field : 'name',
			title : '机构名称',
			width : 180
		}, {
			field : 'countryCName',
			title : '国家/地区',
			width : 130
		}, {
			field : 'address',
			title : '联系地址',
			width : 260
		}, {
			field : 'tele',
			title : '联系方式',
			width : 100
		}, {
			field : 'contacts',
			title : '联系人',
			align : 'center',
			width : 130
		}, {
			field : 'email',
			title : '电子邮箱',
			align : 'center',
			width : 160
		}, {
			field : 'mechanism',
			title : '机构简介',
			align : 'center',
			width : 160
		}

		] ],
		onLoadSuccess : function() {
			$(this).datagrid('clearSelections');//取消所有的已选择项
		$(this).datagrid('unselectAll');//取消全选按钮为全选状态
	},
	onRowContextMenu : function(e, rowIndex, rowData) {
		e.preventDefault();
		$(this).datagrid('unselectAll');
		$(this).datagrid('selectRow', rowIndex);
		$('#member_datagrid_member').menu('show', {
			left : e.pageX,
			top : e.pageY
		});
	}
	});
}

//窗体大小变化调整
function reload() {
	var bodyWidth = $('body').width();
	//自适应列宽
	$('#member_datagrid').datagrid("resize");
	if (bodyWidth <= 620) {
		$('#firstDIV').width(550);
		$('#member_datagrid-toolbar').width(520);
		$("#member_datagrid").width(520);
		//$('#firstDIV').css('overflow:','scroll');
	} else {
		$('#firstDIV').width('100%');
		$('#member_datagrid-toolbar').width('100%');
	}
}

function formInit() {
	member_form = $('#member_form').form( {
		url : '${ctx}/web/member-input!save.action',
		onSubmit : function(param) {
		return $(this).form('validate');
	},
	success : function(data) {
		
		
		member_dialog.dialog('destroy');//销毁对话框 
		member_tree.tree('reload'); //重新加载树
		member_datagrid.datagrid('reload');//重新加载列表数据
		showMsg("操作成功！");//操作结果提示
	 
    }
	});
}

//显示弹出窗口 新增：row为空 编辑:row有值 
function showDialog(row) {
	
	//弹出对话窗口
	member_dialog = $('<div/>')
			.dialog( {//基于父对象的对话框(全屏遮罩的效果)
						title : row != null ? '编辑：' + row.memberCName : '添加',
						width : 600,
						height : 350,
						modal : true,
						maximizable : false,
						href : row != null ? '${ctx}/web/member-input.action?rowId=' + row.memberId : '${ctx}/web/member-input.action' ,
						buttons : [ {
							text : '保存',
							iconCls : 'icon-save',
							handler : function() {
								//此两个隐藏数据,仅后台校验用(解决当直接输入部门经理保存校验用 )
							$('#countryId').val(
									$("#countryId").combobox('getText'));
							$('#type').val(
									$("#type").combobox('getText'));
							member_form.submit();
						}
						} ],
						onClose : function() {
							$(this).dialog('destroy');
						},
						onLoad : function() {
							formInit();
							member_form.form('load', row);
							if (row) {
								//加载国家树 
								loadCountryName(row.countryId);
								loadMemberType(row.type);
							} else {
								loadCountryName();
								loadMemberType();
							}
						}
					}).dialog('open');
}

//编辑
function edit() {
	//选中的所有行
	var rows = member_datagrid.datagrid('getSelections');
	//选中的行（第一条）
	var row = member_datagrid.datagrid('getSelected');
	
	if (row) {
		if (rows.length > 1) {
			eu.showMsg("您选择了多个操作对象，默认操作第一条选中记录！");
		}
		
		showDialog(row);
	} else {
		eu.showMsg("请选择要操作的对象！");
	}
}

//删除
function del() {
	var rows = member_datagrid.datagrid('getSelections');
	var row = member_datagrid.datagrid('getSelected');
	if (row) {
		$.messager.confirm('确认提示！', '您确定要删除当前选中的行？', function(r) {
			if (r) {
				var ids;
				ids = row.memberId ;
				$.ajax( {
					type : "post",
					url : "${ctx}/web/member!remove.action",
					data : {
						ids : ids
					},
					dataType : 'text',
					success : function(json) {
						
						member_tree.tree('reload'); //重新加载树
					    member_datagrid.datagrid('load');//重新加载列表数据
					    eu.showMsg(data.msg);//操作结果提示
				
			        },
			        error : function(data) {
			        }
				});
			}
		});
	} else {
		eu.showMsg("请选择要操作的对象！");
	}
}


//加载父级部门树 
function loadCountryTree() {
	$('#memberName').combobox( {
		url : '${ctx}/web/member-input!initFirm.action',
		multiple : false,//是否可多选
		editable : true,//是否可编辑		   
		valueField : 'value',
		required : false,
		matchable : false,
		displayField : 'text',
		onHidePanel : function() {
			//防止自关联
		if ($(this).combobox('getValue') == $('#id').val()) {
			$(this).combobox('setValue', '');
		}
	}
	});
}

//搜索
function search() {
	var memberName = $('#memberName').val();//搜索条件 菜单名称
	var node = member_tree.tree('getSelected');
	var id = '';
	if (node != null) {
		id = node.id; //搜索 id:主键 即是通过左边菜单树点击得到搜索结果
	};
	
	//将整个表单的数据作为查询条件 
	member_datagrid.datagrid('load', {
		memberName : memberName ,
		memberType : id
	});
}

//设置排序默认值
function setSortValue() {
	$.get('${ctx}/base/member!maxSort.action', function(data) {
		if (data.code == 1) {
			$('#memberSort').numberspinner('setValue', data.obj + 1);
		}
	}, 'json');
}
</script>
<div class="easyui-layout" fit="true"
	style="margin: 0px; border: 0px; overflow: hidden; width: 100%; height: 100%;">

	<!-- 左边部分 菜单树形 -->
	<div
		data-options="region:'west',title:'菜单列表',split:false,collapsed:false,border:false"
		style="width: 150px; text-align: left; padding: 5px;">
		<ul id="member_tree"></ul>
	</div>

	<!-- 中间部分 列表 -->
	<div id="firstDIV"
		data-options="region:'center',split:false,border:false"
		style="padding: 0px; height: 100%; width: 100%; overflow-y: hidden;">

		<!-- 列表右键 -->
		<div id="member_datagrid_member" class="easyui-menu"
			style="width: 120px; display: none;">
			<!-- <div onclick="showDialog();" data-options="iconCls:'icon-add'">
				新增
			</div> -->
			<div onclick="edit();" data-options="iconCls:'icon-edit'">
				编辑
			</div>
			<div onclick="del();" data-options="iconCls:'icon-remove'">
				删除
			</div>
		</div>

		<!-- 工具栏 操作按钮 -->
		<div id="member_datagrid-toolbar">
			<div style="margin-left: 5px; float: left;">
				<form id="member_search_form" style="padding: 0px;">
					部门名称：
					<input type="text" id="memberName" name="memberName"
						maxLength="8" placeholder="请输入部门名称." style="width: 160px"></input>
					<a href="javascript:search();" class="easyui-linkbutton"
						style="vertical-align: middle;" iconCls="icon-search" plain="true">查
						询</a>
				</form>
			</div>
			<div align="right">
				<a href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-add" plain="true" onclick="showDialog()">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-edit" plain="true" onclick="edit()">编辑</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
					iconCls="icon-remove" plain="true" onclick="del()">删除</a>
			</div>
		</div>
		<table id="member_datagrid" toolbar="#member_datagrid-toolbar"></table>
	</div>
</div>
