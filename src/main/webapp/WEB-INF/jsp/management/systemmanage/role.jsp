<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">
	var pageForm;
	var searchForm;
	var pageDatagrid;
	var pageDialog;
	var rolePage = {
			local: { 
				pageDatagrid: null,
				pageForm: null,
				searchForm:null,
				pageDialog: null,
				constant:{
					addOperate:'add',
					editOperate:'edit',
					delOperate:'del',
					addTitle:'新增角色信息',
					editTitle:'修改角色信息',
					add:'新增',
					edit:'编辑',
					del:'删除',
					batchDelTipMsg:'请至少选择一条记录'
				},
	            url: {
	            	datagridUrl:'${ctx}/role/ObjList.do',//列表请求
	            	saveUrl: '${ctx}/role/SaveObj.do',//保存
	                delUrl: '${ctx}/role/DeleteObj.do',//逻辑删除
	                batchDelUrl:'${ctx}/role/BatchDeleteObj.do',//批量逻辑删除
	                redirectUrl:'${ctx}/role/ObjInput.do'//跳转到新增或编辑页面
	            }
	        },
		init : function() {
			pageForm = $('#pageForm').form();
			searchForm = $('#searchForm').form();
			rolePage.initDataGrid();
		},
		bindEvent:function(){
			//新增对象
			$('#addObj').bind('click',function(){
				var constant = rolePage.local.constant;
        		rolePage.showDialog(undefined,constant.addOperate,constant.addTitle);
			});
			//编辑对象
			$('#editObj').bind('click',function(){
				rolePage.editObj();
			});
			//批量删除对象
			$('#delObj').bind('click',function(){
				rolePage.batchDelObj(rolePage.local.constant.batchDelTipMsg);
			});
			//以下为右键菜单
			//新增对象
			$('#RAddObj').bind('click',function(){
				var constant = rolePage.local.constant;
        		rolePage.showDialog(undefined,constant.addOperate,constant.addTitle);
			});
			//编辑对象
			$('#REditObj').bind('click',function(){
				rolePage.editObj();
			});
			//删除对象
			$('#RDelObj').bind('click',function(){
				rolePage.delObj();
			});
			
			//搜索
			$('#btnSearch').bind('click',function(){
				rolePage.search();
			});
		},
		initDataGrid : function() {
			//数据列表
			pageDatagrid = $('#pageDatagrid').datagrid({
				url : rolePage.local.url.datagridUrl,
				pagination : true,//底部分页
				rownumbers : true,//显示行数
				fitColumns : true,//自适应列宽
				striped : true,//显示条纹
				pageSize : 10,//每页记录数	    
				sortName : 'id',//默认排序字段
				sortOrder : 'asc',//默认排序方式 'desc' 'asc'
				idField : 'id',
				columns : [ [ {
					field : 'ck',
					checkbox : true
				}, {
					field : 'name',
					title : '角色名称',
					width : 55
				}, {
					field : 'funCNameStr',
					title : '功能菜单',
					width : 120,
					formatter : function(value, rowData, rowIndex) {
						var br = '<br/>';
						var temp = value;
						var content;
						if(value){
							if (value.length >= 105) {
								temp = value.substring(0, 105)
										+ "...";
							}
							content = "<a title='" + value
									+ "' class='note'>" + temp
									+ "</a>";
							return content;
						}
						else{
							return value;
						}
						
					}
				}, {
					field : 'description',
					title : '描述',
					width : 50,
					formatter : function(value, rowData, rowIndex) {
						var br = '<br/>';
						var temp = value;
						var content;
						if(value){
							if (value.length >= 105) {
								temp = value.substring(0, 105)
										+ "...";
							}
							content = "<a title='" + value
									+ "' class='note'>" + temp
									+ "</a>";
							return content;
						}
						else{
							return value;
						}
						
					}
				}, {
					field : 'id',
					title : '操作',
					width : 20,
					align : 'center',
					formatter : function(value, rowData,rowIndex) {
						var str = '';
						var constant = rolePage.local.constant;
		        		str += '<a href="javascript:rolePage.showDialog(' + value + ',\''+constant.editOperate+'\',\''+constant.editTitle+'\')" style="color:blue">'+constant.edit+'</a>&nbsp;&nbsp;&nbsp;';
						str += '<a href="javascript:rolePage.delObj(' + value + ')" style="color:blue">'+constant.del+'</a>';
						return str;
					}
				} ] ],
				onLoadSuccess : function() {
					$(this).datagrid('clearSelections');//取消所有的已选择项
					$(this).datagrid('unselectAll');//取消全选按钮为全选状态
				},
				onRowContextMenu : function(e, rowIndex, rowData) {
					e.preventDefault();
					$(this).datagrid('unselectAll');
					$(this).datagrid('selectRow', rowIndex);
					$('#pageDatagrid_menu').menu('show', {
						left : e.pageX,
						top : e.pageY
					});
				}
			});
		},
		showDialog: function (id,type,title) {//type:add-新增,edit-编辑
			pageDialog = top.parent.sy.modalDialog({
                title: title,
                width: 450,
                height: 330,
                modal: true,
                maximizable: true,
                url: rolePage.local.url.redirectUrl+'?objId='+id+'&operateType='+type,
                buttons: [{
                    text: '确定',
                    //iconCls: 'icon-ok',
                    handler: function () {
                        pageDialog.find('iframe').get(0).contentWindow.submitForm(rolePage.local.url.saveUrl,pageDialog,pageDatagrid,parent.$);
                    }
                }, {
                    text: '取消',
                    //iconCls: 'icon-cancel',
                    handler: function () {
                        pageDialog.dialog('destroy');
                    }
                }],
                onClose: function () {
                    pageDialog.dialog('destroy');
                }             
            }).dialog('open');          
        },
        editObj:function(){ //菜单编辑对象
        	//选中的所有行
        	var rows = pageDatagrid.datagrid('getSelections');
        	//选中的行（第一条）
        	var row = pageDatagrid.datagrid('getSelected');
        	if (row) {
        		if (rows.length > 1) {
        			showMsg('您选择了多个操作对象，默认操作第一条选中记录！');  
        		}
        		var constant = rolePage.local.constant;
        		rolePage.showDialog(row.id,constant.editOperate,constant.editTitle);
        	} else {
        		showMsg('请选择要操作的对象！');  
        	}
        },
        batchDelObj:function(tipMsg){ //批量删除对象
    		var obj = pageDatagrid.datagrid('getSelections');
    		var objLength = pageDatagrid.datagrid('getSelections').length;
    		if(objLength == 0){
    			showMsg(tipMsg);//操作结果提示
    		}
    		else{
    			//将被选中的记录的ID使用逗号连接起来
    			var objIdStr = "";
    			for(var i = 0 ;i<=objLength-1;i++){
    				if(i==objLength-1){
    					objIdStr = objIdStr + obj[i].id;
    				}
    				else{
    					objIdStr = objIdStr + obj[i].id + ",";
    				}
    			}
    			var params = {};
    			params.objIdStr = objIdStr;
    			$.ajax({
    				url:rolePage.local.url.batchDelUrl,
    				type : 'post',
    				dataType:'json',
    				data :params,
    				success:function(result){
    					showMsg(result.content);//操作结果提示
    					pageDatagrid.datagrid('reload'); //重新加载列表数据
    				}
    			});
    		}
    	},
		delObj:function(id){//单个删除对象
			parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
				if (r) {
					$.post(rolePage.local.url.delUrl, {
						objId : id
					}, function() {
						pageDatagrid.datagrid('reload'); //重新加载列表数据
						}, 'json');
				}
			});
		},
		search:function(){//搜索
			//pageDatagrid.datagrid('load', $.serializeObject(searchForm));
			var roleName = $('#roleName').val();	
			var params={};
			params.roleName = roleName;
			pageDatagrid.datagrid('load', params);
		}
	};

	$(function() {
		rolePage.init();
		rolePage.bindEvent();
	});
</script>
<!-- 列表右键 -->
<div id="pageDatagrid_menu" class="easyui-menu"
	style="width: 120px; display: none;">
	<div id="RAddObj" data-options="iconCls:'icon-add'">新增</div>
	<div id="REditObj" data-options="iconCls:'icon-edit'">编辑</div>
	<div id="RDelObj" data-options="iconCls:'icon-remove'">删除</div>
</div>

<!-- 工具栏 操作按钮 -->
<div id="pageDatagrid-toolbar">
	<div style="margin-left: 10px; float: left;">
		<form id="searchForm" style="padding: 0px;">
			<label> 角色名称: </label> <input id="roleName" type="text" name="filter_LIKES_name"
				placeholder="请输入角色名称..." maxLength="25" style="width: 160px"
				style="vertical-align: middle"></input> <a id="btnSearch" class="easyui-linkbutton"
				style="vertical-align: middle" iconCls="icon-search" plain="true">查
				询</a>
		</form>
	</div>
	<div align="right">
		<a id="addObj" href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a> 
		<span class="toolbar-btn-separator"></span> 
		<a id="editObj" href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a> 
		<span class="toolbar-btn-separator"></span> 
		<a id="delObj" href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>
<table id="pageDatagrid" toolbar="#pageDatagrid-toolbar" fit="true">
</table>

