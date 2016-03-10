<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">



var north={
		 login_about_dialog:null,
		 login_password_dialog:null,
		 login_password_form:null,
		logout:function(){
			$.messager.confirm('确认提示！', '您确定要退出系统吗？', function(r) {
				if (r) {
					//调用后台，执行注销
					window.location.href = "${ctx}/mgmt/logout.do";
				}
			});
		},
		
		changePwd:function changePassword(){
			//弹出框头部信息
			north.login_password_dialog =  parent.sy.modalDialog({
				title:'修改用户密码',
				width : 550,
				height : 180,
				url : 'password-change.action',  //后台请求路径
				buttons : [{
					text : '保存',
					iconCls : 'icon-save',
					handler : function() {
						north.login_password_dialog.find('iframe').get(0).contentWindow.submitForm(north.login_password_dialog,parent.$);	
					}
				},
				{
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						north.login_password_dialog.dialog('destroy');
					}
				}],
				onClose : function(){
					north.login_password_dialog.dialog('destroy');
				},
				onLoad : function(){
				}
			
		}).dialog('open');
		}
		
}
</script>
<div region="north" border="false" split="false">
	<div class="top_bg">
		<div class="headC_z"> 
			<div class="userH_z">
				<span>当前用户：</span>
				<a title="${loginUser.userName}" class="text_z">${loginUser.userName}</a>
			</div>
			<div class="linkH_z">
				[<a href="javascript:void(0)"  onclick="north.changePwd()">修改密码</a>]&nbsp; 
				[<a href="javascript:void(0)"  onclick="north.logout()">退出系统</a>]
			</div>
		</div>	
	</div>
