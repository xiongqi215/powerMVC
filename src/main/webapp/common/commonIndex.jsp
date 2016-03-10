<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>世界生命湖泊应用科技信息平台</title>
    <%@ include file="/common/portal_meta.jsp"%>
</head>
<body>
<div class="header">
    <div class="top">
        <div class="top-container">
            <span class="top-welcome">欢迎世界生命湖泊应用科技信息平台!</span>
            <div class="top-info">您好！
                <div class="top-login">
                    <a class="loginA" href="#">登录</a>
                    <a class="out hide" href="file-redirect.action?toPage=memberCenter/member-index">会员中心</a>
                    <a class="out hide" href="#">退出</a>
                    <div class="index-login hide" id="login">
                        <span class="loginSpan">▲</span>
                        <div class="login-user">
                            <span>用户名：</span><input type="text" id="user" class="login-text" />
                        </div>
                        <div class="login-user">
                            <span>密&nbsp;&nbsp;码：</span><input type="text" id="password" class="login-text" />
                        </div>
                        <input type="button" class="login-btn" value="登录"/>
                    </div>
            </div><a class="hide" href="#">退出</a> | <a href="#">English</a></div>
        </div>
    </div>
    <div class="head">
        <img class="indexLogo" src="images/indexLogo.jpg" width="575" height="60" />
        <div class="search">
            <input type="text" onfocus="if(value == '搜索新闻关键字'){value=''}" onblur="if(value == ''){value='搜索新闻关键字'}" value="搜索新闻关键字" class="ser-text" />
            <input type="button" value="" class="ser-btn" />
        </div>
    </div>
    <div class="nav">
        <div class="nav-bar">
            <ul>
                <li><a class="active" href="file-redirect.action?toPage=home/webIndex">首页</a></li>
                <li><a href="file-redirect.action?toPage=news/newsindex">新闻动态</a></li>
                <li><a href="file-redirect.action?toPage=database/database">数据库</a></li>
                <li><a href="file-redirect.action?toPage=knowledgebase/knowledgeindex">知识库</a></li>
                <li><a href="file-redirect.action?toPage=aboutplatform/aboutplatform">关于平台</a></li>
                <li><a href="file-redirect.action?toPage=contactus/contactus">联系我们</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>