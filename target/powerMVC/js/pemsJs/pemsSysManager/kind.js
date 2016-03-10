var pemsKind = {
	local:{
		kind_datagrid:null,
		kind_form:null,
		kind_dialog:null,
		url:{
			saveUrl:'${ctx}/pems/kind!save.action',
			deleteUrl:'${ctx}/pems/kind!delete.action',
			datagridUrl:'${ctx}/pems/kind!getKind.action'
		}
	},
	init:function(){
		pemsKind.loadDataGrid();
	},
	loadDataGrid:function(){
		kind_datagrid = $('#test').datagrid({
				iconCls: 'icon-save',
                width: 700,
                height: 350,
                fitColumns: true,
                nowrap: true,
                autoRowHeight: false,
                striped: true,
                collapsible: false,
                url: pemsKind.local.url.datagridUrl,
                sortName: 'code',
                sortOrder: 'asc',
                remoteSort: false,
                idField: 'code',
                toolbar: '#addxl',
                rownumbers: true,
				columns: [[
				            { title: 'No.', field: 'code', width: 80, sortable: true, hidden: true },
				                        { field: 'kindName', title: '序列名称', width: 120 },
				                        { field: 'sort', title: '顺序', width: 120, align: 'right' },
				                        { field: 'status', title: '是否参加考核', width: 100, editor: { type: 'checkbox', options: { on: '是', off: '否'} }, align: 'center' },
				                        { field: 'id', title: '操作', width: 70, align: 'center',
				                            formatter: function (value, rowData, rowIndex) { 
				                        		var str = '';
				                                str += '<a href="javascript:pemsKind.showDialog('+value+')" style="color:blue">编辑</a>&nbsp;&nbsp;';
				                                str += '<a href="javascript:pemsKind.removeFun('+value+')" style="color:blue">删除</a>';
				                                return str;
				                        	} 
				                        }
				        ]]
            });
	},
	bindEvent:function(){
		$('#addKind').bind('click',function(){
			pemsKind.showDialog();
		});
	},
	removeFun:function(id){
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.post(pemsKind.local.url.deleteUrl, {
					id : id
				}, function() {
					kind_datagrid.datagrid('reload');//重新加载列表数据
				}, 'json');
			}
		});
	},
	formInit:function(){
		kind_form = $('#kind_form').form({
				url: pemsKind.local.url.saveUrl,
				onSubmit: function(param){  
			        return $(this).form('validate');
			    },
				success: function(data){
					var json = eval('('+ data+')'); //将后台传递的json字符串转换为javascript json对象 
					if (json.code ==1){
						kind_dialog.dialog('destroy');//销毁对话框 
						kind_datagrid.datagrid('reload');//重新加载列表数据
						showMsg(json.msg);//操作结果提示
					}else if(json.code == 2){
						$.messager.alert('提示信息！', json.msg, 'warning',function(){
							if(json.obj){
								$('#kind_form input[name="'+json.obj+'"]').focus();
							}
						});
					}else {
						showAlertMsg(json.msg,'error');
					}
				}
			});
	},
	showDialog:function(id){
		kind_dialog = $('<div/>').dialog({
                title: "新增序列",
                width: 300,
                height: 200,
                modal: true,
                maximizable: false,
                href: '${ctx}/pems/kind-input.action',
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: function () {
                        kind_form.submit();
                    }
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        kind_dialog.dialog('destroy');
                    }
                }],
                onClose: function () {
                    $(this).dialog('destroy');
                },
                onLoad: function () {
                    pemsKind.formInit();
                    if (id) {
                        $.post('${ctx}/pems/kind!getById.action', {
                            id: id
                        }, function (result) {
                            if (result.id != undefined) {
                                $('form').form('load', {
                                    'id': result.id,
                                    'kindName': result.kindName,
                                    'sort': result.sort
                                });
                            }
                            parent.$.messager.progress('close');
                        }, 'json');
                    }
                }
            }).dialog('open');
	}
}

$(function () {
	pemsKind.init();   
});