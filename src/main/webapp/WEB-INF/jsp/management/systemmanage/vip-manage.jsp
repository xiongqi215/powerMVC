<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">
	var vip_datagrid;
	var vip_form;
	var vip_search_form;
	var vip_dialog;
	var lead = null;

	var vipPage = {
		init : function() {
			vip_form = $('#vip_form').form();
			vip_search_form = $('#vip_search_form').form();
			vipPage.initvipDataGrid();
		},
		initvipDataGrid : function() {
			//数据列表
			vip_datagrid = $('#vip_datagrid').datagrid({
				url : '${ctx}/vip-manage/list.do',
				pagination : true,//底部分页
				rownumbers : true,//显示行数
				fitColumns : true,//自适应列宽
				striped : true,//显示条纹
				pageSize : 20,//每页记录数	    
				sortName : 'id',//默认排序字段
				sortOrder : 'asc',//默认排序方式 'desc' 'asc'
				idField : 'id',
				columns : [ [ {
					field : 'ck',
					checkbox : true
				}, {
					field : 'id',
					title : '主键',
					hidden : true,
					align : 'right',
					width : 80
				}, {
					field : 'userName',
					title : '会员姓名',
					width : 55
				}, {
					field : 'loginName',
					title : '登录名',
					width : 50
				}, {
					field : 'phone',
					title : '固定电话',
					width : 55
				}, {
					field : 'telephone',
					title : '手机号码',
					width : 55
				}, {
					field : 'myorgan',
					title : '所属机构',
					width : 55,
					formatter:function(value,rowData,rowIndex){
						return rowData.organInfo.name;
					}
				}] ],
				onLoadSuccess : function() {
					$(this).datagrid('clearSelections');//取消所有的已选择项
					$(this).datagrid('unselectAll');//取消全选按钮为全选状态
				},
				onRowContextMenu : function(e, rowIndex, rowData) {
					e.preventDefault();
					$(this).datagrid('unselectAll');
					$(this).datagrid('selectRow', rowIndex);
					$('#vip_datagrid_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					});
				}
			});
		},
		formInit : function() {
			vip_form = $('#vip_form')
					.form(
							{
								url : '${ctx}/vip/savevip.do',
								onSubmit : function(param) {
									return $(this).form('validate');
								},
								success : function(data) {
									
								}
							});
		},
		showDialog:function(row, title){
			//弹出对话窗口
			vip_dialog = $('<div/>').dialog( {
				title : title,
				width : 420,
				height : 270,
				modal : true,
				maximizable : false,
				href : '${ctx}/vip/vipInput.do',
				buttons : [ {
					text : '保存',
					iconCls : 'icon-save',
					handler : function() {
						vip_form.submit();
					}
				}, {
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						vip_dialog.dialog('destroy');
					}
				} ],
				onClose : function() {
					$(this).dialog('destroy');
				},
				onLoad : function() {
					vipPage.formInit();
					if (row) {
						vip_form.form('load', row);
					}

				}
			}).dialog('open');
		},
		editvip : function() {
			//选中的所有行
			var rows = vip_datagrid.datagrid('getSelections');
			//选中的行（第一条）
			var row = vip_datagrid.datagrid('getSelected');
			if (row) {
				lead = row.name;
				if (rows.length > 1) {
					showMsg("您选择了多个操作对象，默认操作第一条选中记录！");
				}
				showDialog(row, '编辑角色');
			} else {
				showMsg("请选择要操作的对象！");
			}
		},
		delvip:function(){
			var rows = vip_datagrid.datagrid('getSelections');
			if (rows.length > 0) {
				$.messager.confirm('确认提示！', '您确定要删除选中的所有行？', function(r) {
					if (r) {
						var ids = new Object();
						for ( var i = 0; i < rows.length; i++) {
							ids[i] = rows[i].id;
						}
						$.post('${ctx}/vip/deletevip.do', {
							ids : ids
						}, function(data) {
							if (data.code == 1) {
								vip_datagrid.datagrid('load'); // reload the user data
								showMsg(data.msg);//操作结果提示
							} else if (data.code == 2) {
								$.messager.alert('提示信息！', data.msg, 'warning',
										function() {
										});
							} else {
								showAlertMsg(data.msg, 'error');
							}
						}, 'json');

					}
				});
			} else {
				showMsg("请选择要操作的对象！");
			}
		},
		search:function(){
			vip_datagrid.datagrid('load', $.serializeObject(vip_search_form));
		}
	};

	$(function() {
		vipPage.init();
	});
</script>
<!-- 列表右键 -->
<div id="vip_datagrid_menu" class="easyui-menu"
	style="width: 120px; display: none;">
	<div onclick="vipPage.showDialog(null,'新增会员');"
		data-options="iconCls:'icon-add'">新增</div>
	<div onclick="vipPage.editvip();" data-options="iconCls:'icon-edit'">编辑</div>
	<div onclick="vipPage.delvip();" data-options="iconCls:'icon-remove'">删除</div>
</div>

<!-- 工具栏 操作按钮 -->
<div id="vip_datagrid-toolbar">
	<div style="margin-left: 10px; float: left;">
		<form id="vip_search_form" style="padding: 0px;">
			<label> 会员姓名: </label> 
			<input type="text" name="userName"	placeholder="请输入会员名称..." maxLength="25" style="width: 160px;vertical-align: middle"></input>
			<a href="javascript:vipPage.search();" class="easyui-linkbutton" style="vertical-align: middle" iconCls="icon-search" plain="true">查询</a>
		</form>
	</div>
	<div align="right">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="vipPage.showDialog(null,'新增会员')">新增</a> 
		<span class="toolbar-btn-separator"></span>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"	onclick="vipPage.editvip()">编辑</a> 
		<span class="toolbar-btn-separator"></span> 
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="vipPage.delvip()">删除</a>
	</div>
</div>
<table id="vip_datagrid" toolbar="#vip_datagrid-toolbar" fit="true">
</table>

