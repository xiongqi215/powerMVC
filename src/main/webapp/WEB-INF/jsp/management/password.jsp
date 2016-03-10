<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/doctype.jsp"%>
<html>
<head>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">

	//表单提交
	var submitForm = function($dialog, $pjq) {
		/* 组装参数 */
		
		//提交
		if($("#login_password_form").form("validate")){
			
			var  formData = $("#login_password_form").serializeArray(); 
		$.ajax({
			url : "password-change!loginUserPwdChange.action",
			type : 'post',
			data : formData,
			async : false,
			dataType : 'json',
			success : function(result) {
				//非成功消息
				if(result.messageType!='0'){
					sy.showAlertMsg($pjq, result.content,'error');
				}else{
					sy.showMsg($pjq, result.content);
					//关闭窗口
					$dialog.dialog('destroy'); 
					//刷新表格
					$datagrid.datagrid('load'); 
				}
				
			}

		});
		}
	};

	
</script>
</head>
<div>
	<form id="login_password_form" method="post" novalidate>
<%-- 		<input type="hidden" id="login_password_form_id" name="id" value="${loginUser.id}"></input> --%>
		<div>
			<label>原密码:</label> <input type="password" id="password"
				name="pwdChangeForm.Oldpassword" class="easyui-validatebox" required="true"
				missingMessage="请输入原密码." /><span style="color: red">*</span>
		</div>
		<div>
			<label>新密码:</label> <input type="password" id="newPassword"
				name="pwdChangeForm.newPassword" class="easyui-validatebox" required="true"
				missingMessage="请输入新密码." validType="safepass" /><span
				style="color: red">*</span>
		</div>
		<div>
			<label>确认新密码:</label> <input type="password" name="pwdChangeForm.newPassword2"
				id="newPassword2" required="true" class="easyui-validatebox"
				missingMessage="请再次输入确认新密码." validType="equalTo['#newPassword']"
				invalidMessage="两次输入密码 不一致." /><span style="color: red">*</span>
		</div>
	</form>
</div>