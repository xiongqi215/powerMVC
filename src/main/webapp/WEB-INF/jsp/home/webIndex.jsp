<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8" />
	<meta name="viewport"content="width=device-width, initial-scale=1" />
	<meta http-equiv="x-ua-compatible"content="ie=edge" />
    <title>世界生命湖泊应用科技信息平台</title>
    <%@ include file="/common/portal_meta.jsp"%>
    <script type="text/javascript">
    $( function(){
    	loadAction('home.do');
    });
    

    </script>
</head>
<body>
<div class="header">
<div class="top">
	<div class="welcomeWap"> 
		<div class="container"> 
			<div class="textW">World Living Lakes Platform!</div>
			<div class="fr"> 
				<div class="btntopWap"> 
					<a href="">
					<c:choose>
		                <c:when test="${loginUser!=null }">
		                    ${loginUser.userName}
		                </c:when>
		                <c:otherwise>
		                    Sign in
		                </c:otherwise>
		            </c:choose>
					</a>
					<a href="portal.do?langType=zh">Chinese</a>
					<a href="portal.do?langType=en">English</a>
					<form method="post" id="loginForm">
			                    <div class="index-login panelHide hide">
			                        <span class="loginSpan">▲</span>
			                        <div class="login-user">
			                            <span><fmt:message key="login.username"/>:</span><input type="text" name="userName" id="userName" class="login-text" />
			                            <input type="hidden" id="hideUserName"/>
			                        </div>
			                        <div class="login-user">
			                            <span><fmt:message key="login.password"/>:</span><input name="password" type="password" id="password" class="login-text" />
			                        </div>
			                        <input type="button" class="login-btn" value="登录" onclick="btnLoginClick();"/>
			                        <span style="color: red;" id="errorMsg"></span>
			                    </div>
			        </form>
					<!--登录后会员下拉菜单-->
                    <div class="user-info panelHide hide">
                        <span class="loginSpan">▲</span>
                        <a href="#" onclick="loadAction('memberCenter.do')">会员中心</a>
                        <a href="#" onclick="loadPage('memberCenter/address-list')">通讯录</a>
                        <a href="#" onclick="chat()" >在线交流</a>
                        <a class="out" href="#" onclick="javascript:logout();">退出</a>
                    </div>
				</div>					
				<div class="searchWap"> 
					<input type="text" placeholder="Station search" />
					<input type="button"  />
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 加入导航栏 -->
	<%@ include file="navigation.jsp"%>

<div id="main">


</div>

	<%@ include file="footer.jsp"%>
	
</body>
</html>