<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>世界生命湖泊科学应用与信息共享平台</title>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript" src="${ctx }/js/jquery/easyui-1.4/plugins/jquery.textbox.js" charset="utf-8"></script>
<link rel="stylesheet" href="${ctx }/css/qshfj_z.css" />
<style type="text/css">
.prompt {
	width: 100%;
/* 	background: #9C0; */
	color: #fff;
	height:1px;
	line-height: 30px;
	text-align: center;
	float: left;
	position: absolute;
	top: 13px;
	left: -95px; 
	font-size: 16px;
    z-index: 10;
}
</style>
<script type="text/javascript">
	
	var loginForm;

	$(function(){
		//登入名输入框获取焦点
		$('#loginName').focus();
		//refreshCheckCode();
		
		//绑定tab建顺序
		$('#loginName').textbox("textbox").attr("tabIndex","1");
		$('#password1').textbox("textbox").attr("tabIndex","2");
		//回车登录
		$('#password1').textbox('textbox').bind('keydown', function(e) {
			var keynum;
			if (window.event) // IE  
			{
				keynum = e.keyCode;
			} else if (e.which) // Netscape/Firefox/Opera  
			{
				keynum = e.which;
			}
			if (e && e.keyCode == 13) { // enter 键
				var v = $(this).val();
				if (v != '')//判断时候为空,当然如果可以进行其他更多判断
				{
					//如果想将光标移到下一个id为password的文本框上
					$("#login_linkbutton").focus();
				} else {
					return false;//这个主要防止按下enter时候，触发了提交按钮
				}
			}
		}).bind('focus',function(e){
			$("#pwdprompt").hide();
			$('#password1').textbox("textbox").attr("placeholder","请输入登入密码...");
			
		}).bind('blur',function(e){
			if($('#password1').textbox("getValue")==null||$('#password1').textbox("getValue")==""){
				$("#pwdprompt").show()
				$('#password1').textbox("textbox").removeAttr("placeholder");
			}
			
		});
		
		$("#pwdprompt").bind('click',function(e){
			$("#pwdprompt").css("display","none");
			$('#password1').textbox("textbox").focus();
		});
	});
	
	
	
	//登录
	function btnLoginClick() { 
		var  formData = $("#loginForm").serializeArray(); 
	$('#login_linkbutton').attr("disabled",true);
			$.ajax({
				data:formData,
		        type:"post",
		        url:"${ctx}/mgmt/login.do",
		        dataType:'json',						       
		        success:function(message){
		        	if(message.type!=1){
		        		//提示错误信息
		    		  		 $.messager.alert('警告', message.content, 'error');
		    		  		 $('#login_linkbutton').attr("disabled",false);
		    		  	 
		        	}else{
		        		window.location.href='${ctx}/mgmt/index.do';
		        	}
		         
		}
	});

	}
	
	

</script>
<body class="loginbgQsh_z" >

	<div class="cQsh_z">
		<div class="crQsh_z">
			<div class="crdivQsh_z">
				<div class="nav1Qsh_z">
					<span class="peop_z"></span> <span class="text_z">用户登录</span>
				</div>
			</div>
			<!-- 个人 -->
			<form action="login!login.action" method="post" id="loginForm" class="loginFormZ">
<!-- 				<input type="hidden" name="loginType" id="loginType" -->
<%-- 					value="<%=request.getAttribute("loginType")%>" /> <input --%>
<!-- 					type="hidden" name="unitId" id="unitId" -->
<%-- 					value="<%=request.getAttribute("unitId")%>" /> --%>
				<div name="grdl">
					<div class="crdivQsh_z marginbtm13_z">
					<!-- 登入名 -->
						<input name="loginName" id="loginName" tabindex='1'
							class="easyui-textbox" style="width: 315px; height: 32px"
							value=""
							data-options="prompt:'请输入用户名...',iconCls:'icon-man',iconWidth:38,missingMessage:'登录账户名为必填项。'">
					</div>
						<!-- 密码-->
					<div class="crdivQsh_z marginbtm15_z">
						<input class="easyui-textbox" name="password" tabindex='2'
							id="password1" style="width: 315px; height: 32px;" type="password"
							data-options="iconCls:'icon-lock',iconWidth:38"/>
						<span class="prompt" id="pwdprompt">请输入登入密码...</span>
					</div>
					<!-- 登入按钮 -->
					<div class="crdivQsh_z">
						<input class="dl_z" type="button" name="loginForm.btnLoginClick"
							id="login_linkbutton" value="  " onclick="javascript:btnLoginClick();" />
					</div>
				</div>
			</form>
			<div class="ms_z">江西省科学院&nbsp;&nbsp;版权所有 All Right Reserved</div>
		</div>
	</div>


</body>
</html>