<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<%
	String objId = request.getParameter("objId");
	String operateType = request.getParameter("operateType");
	if (objId == null || objId.equals("undefined")) {
		objId = "";
	}
%>
<script type="text/javascript">
$(function(){
	//$.initFormCss();
	initFunComboTree();
});
//表单提交
var submitForm = function(url, $dialog, $datagrid, $pjq) {
	var params = {};
	params.isDelete = "0"; //新增或修改时，是否删除字段为"0"
	params.operateType = $('#operateType').val();
	var name = sy.trim($('#name').val());
	params.name = name;
	var description = $('#description').val();
	params.description = description;
	var objId;
	if ($('#objId').val() != "") {
		objId = $('#objId').val();
		params.id = objId;
	}
	//选中的菜单
	var funIdArray = $('#menu').combotree('getValues');
	params.funIds = funIdArray.join(",");
	var code; //消息码
	var content; //消息
	var type; //执行状态
	//提交
	  $.ajax({
		url:url,
		type:'post',
		data:params,
		async : false,
		dataType:'json',
		success:function(result){
			code = result.code;
			content = result.content;
			type = result.type;
		}
	
	});
	if(type == '1'){
		sy.showMsg($pjq,content);
		$dialog.dialog('destroy');
		$datagrid.datagrid('load');
	}else{
		sy.showMsg($pjq,content);
	}      
	
};
//菜单下拉框
function initFunComboTree(){
	$('#menu').combotree({
		url: '${ctx}/role/funInfoTree.do?roleId='+$('#objId').val(),
		multiple:true,
		panelHeight:'auto'
		
		
	});
}

</script>
<div>
	<form id="role_form" class='fm' method="post" novalidate>
		<input type="hidden" id="objId" name="id" value="<%=objId%>"></input>
		<!-- 用户版本控制字段 version -->
		<input type="hidden" id="version" name="version"></input>
		<input id="operateType" name="operateType" value="<%=operateType%>" style="display: none;" />
		<table>
			<tbody>
				<tr>
					<td>
						<label>
							角色名称:
						</label>
					</td>
					<td>
						<input id="name" name="name" value="${role.name}" type="text" class="easyui-validatebox"
							style="height: 22px; width: 200px" missingMessage="请输入角色名称，小于16个字符"
							data-options="required:true" validType="maxLength[16]"></input>
						<span style="color: red">*</span>

					</td>
				</tr>
				<tr>
					<td>
						<label>菜单：</label>
						
					</td>
					<td>
						<input id="menu" name="menu" type="text" class="easyui-combotree" data-options="required:true"/>
						<span style="color: red">*</span>
					</td>
				
				</tr>
				<tr>
					<td>
						<label>
							描述:
						</label>
					</td>
					<td>
						<textarea id="description" name="description"  value="${role.description}" class="easyui-validatebox"
							style="height: 88px; width: 300px" maxlength="100"
							data-options="invalidMessage:'500字以内.',validType:['maxLength[500]']">${role.description}</textarea>

					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>