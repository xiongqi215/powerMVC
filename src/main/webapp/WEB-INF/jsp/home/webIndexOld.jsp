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
   var username="";
/*导航加载页面事件*/
//     $(function(){
//     	var user="${loginUser}";
    	
//     	if(user!=null||user!=undefined){
//     		$('#hideUserName').val(user.name);
//     		loginAfter();
//     	}
    	
    	
    	
//     })
    function loadPage(page,param){
    	$.ajaxSetup({cache:false});
    	if(param==null){
    		$("#main").load("page/"+page);
    	}else{
    	$("#main").load("page/"+page,param);
    	}
    }
    
    
    function loadAction(action,param){
    	$.ajaxSetup({cache:false});

  	if(param==null){
		$("#main").load(action);
	}else{
	$("#main").load(action,param);
	}
    }
    
    function showOrHide(){
    	var t = '${loginUser.userName}';
    	if(t == ""){
    		$("#mem1").hide();
        	$("#mem2").hide();
    	}else{
    		$("#mem1").show();
        	$("#mem2").show();
    	}
    }
    
    $( function(){
    	loadAction('home.do');
    	showOrHide();
    });
    
    //登录
    function btnLoginClick(){
    	var userVal=$("#userName").val();
    	var passwordVal=$("#password").val();
    	if(userVal == ""){
            alert('请输入用户名！');
            return false;
        }else if(passwordVal == ""){
            alert('请输入密码！');
            return false;
        }
    	var  formData = $("#loginForm").serializeArray(); 
    	$.ajax({
			data:formData,
	        type:"post",
	        url:"${ctx}/portal/login.do",
	        dataType:'json',						       
	        success:function(json){
	        	if(json.type!=undefined&&json.type!=1){
	        		alert(json.content);
	        	}
	        	else {
	        		$('#hideUserName').val(json.name);
	        		loginAfter();
		        	
		        } 
// 		       if(json.messageType=='2'){//表示后台用户,跳转到后台
// 		        	  $("#loginForm").submit();
// 		        }else if(json=='0'){//游客
// 		        	alert('用户名或密码错误');
// 		        }else if(json=='2'){//前台用户
// 		        	loginWebUser(formData);
// 		        	$("#mem1").show();
// 		        	$("#mem2").show();
// 		        } 
			} 
		}); 
    }
    function loginWebUser(){
    	var  formData = $("#loginForm").serializeArray(); 
    	 $.ajax({
    		data:formData,
	        type:"post",
	        url:"${ctx}/login.do",
	        dataType:'json',						       
	        success:function(json){
	        	username=json.login;
	        	$('#hideUserName').val(json.userName);
	        	loginAfter();
			} 
		});  
    }
    
    function loginAfter(){
    	var userVal = $('#hideUserName').val();
       
        
            $('.loginA').text(userVal);
            $('.loginA').css({color:'#f37d26',fontWeight:'bold'});
            $('.index-login').hide();
            $('.out').show();
            $("#mem1").show();
        	$("#mem2").show();
        
    
    }
   function logout(){
	    $.ajax({
	        type:"post",
	        url:"login!logoutWeb.action",
	        dataType:'json',						       
	        success:function(json){
	        	if(json=='1'){
	        	  logoutAfter();
	        	  loadPage('home/homepage');
	        	}
			} 
		});   
	   
   }
   function logoutAfter(){
        $('.user-info').hide();
        $('.loginA').text('登录');
        $('.loginA').css({color:'#39abf3',fontWeight:'normal'});
        $("#mem1").hide();
    	$("#mem2").hide();
   }
   
   function chat(){
	   window.open('${ctx}/onlinechat/logined.html?user='+username,'_blank');
   }
   
   function skip(action,t){
	   $("#home").removeClass("active"); 
	   $("#news").removeClass("active"); 
	   $("#data").removeClass("active"); 
	   $("#sear").removeClass("active"); 
	   $("#abou").removeClass("active"); 
	   $("#cont").removeClass("active");
	   t = '#'+t;
	   $(t).addClass("active");
	   loadAction(action);
   }
    </script>
</head>
<body>
<div class="header">
<div class="top">
        <div class="top-container">
            <span class="top-welcome">欢迎访问世界生命湖泊科学应用与信息共享平台!</span>
            <div class="top-info">
            <ul>
                		<li>您好！</li>
            		<li>
                <div class="top-login">
                	
		                    <a class="loginA" href="#">
		                    	<c:choose>
		                    		<c:when test="${loginUser!=null }">
		                    			${loginUser.userName}
		                    		</c:when>
		                    		<c:otherwise>
		                    			登录
		                    		</c:otherwise>
		                    	</c:choose>
		                    
		                    </a>

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
            </div></li>
			                 <li>| <a href="portal.do?langType=zh">中文</a></li>
			                  <li>| <a href="portal.do?langType=en">English</a></li>
				</ul>
			</div>
        </div>
    </div>
    <div class="head">
        <img class="indexLogo" src="images/indexLogo.jpg"  />
        <div class="search">
            <input type="text" onfocus="if(value == '搜索新闻关键字'){value=''}" onblur="if(value == ''){value='搜索新闻关键字'}" value="搜索新闻关键字" class="ser-text" />
            <input type="button" value="" class="ser-btn" />
        </div>
    </div>
    <div class="nav">
        <div class="nav-bar">
            <ul>
                <li><a id="home" class="active" href="#" onclick="skip('/home.do','home')"><fmt:message key="nav.home" />  </a></li>
                <li><a id="news" href="#" onclick="skip('page/news/newsindex.do','news')"><fmt:message key="nav.news" /></a></li>
                <li id="mem1" style="display:none"><a id="data" href="#" onclick="skip('page/database/database.do','data')"><fmt:message key="nav.database" /> </a></li>
                <li id="mem2" style="display:none"><a id="sear" href="#" onclick="skip('page/knowledgebase/knowledge_search.do','sear')"><fmt:message key="nav.search" /></a></li>
                <li><a id="abou" href="#" onclick="skip('page/aboutplatform/aboutplatform.do','abou')"><fmt:message key="nav.about" /></a></li>
                <li><a id="cont" href="#" onclick="skip('page/contactus/contactus.do','cont')"><fmt:message key="nav.contact" /></a></li>
            </ul>
        </div>
    </div>
</div>

<div id="main">


</div>

<div class="link">
    <div class="link-wrap">
        <span>友情链接：</span>
        <a href="http://lake.geodata.cn/Portal/?isCookieChecked=true">中国湖泊—流域数据中心</a>|
        <a href="http://www.escience.net.cn/index.action">中国科技资源网</a>|
        <a href="http://data.earthquake.cn/index.html">国家地震科学数据共享中心</a>|
        <a href="http://www.cvh.org.cn/">国家标本资源共享平台</a>|
        <a href="http://cellresource.cn/">国家试验细胞资源共享平台</a>|
        <a href="http://www.geodata.cn/Portal/?isCookieChecked=true">地球系统科学数据共享平台</a>|
        <a href="http://zzzy.fishinfo.cn/">国家水产种质资源平台</a>|
        <a href="http://www.ncrm.org.cn/">国家标准物质资源共享平台</a>|
        <a href="http://www.cdcm.net/">国家微生物资源平台</a>|
        <a href="http://www.cfsdc.org/">国家林业科学数据平台</a>|
        <a href="http://www.nstl.gov.cn/">国家科技图书文献中心</a>|
        <a href="http://www.agridata.cn/">国家农业科学数据共享中心</a>|
        <a href="http://www.cssn.net.cn/">国家标准文献共享服务平台</a>|
        <a href="http://www.nfgrp.cn/">国家林木种质资源平台</a>|
        <a href="http://www.cdstm.cn/">中国数字科技馆</a>|
        <a href="http://www.bjshrimp.cn/">北京离子探针中心</a>|
        <a href="http://www.ceas.org.cn/">中国应急分析测试平台</a>|
        <a href="http://www.npsic.cn/ExplorerEntry/index.aspx?act=index">国家大型科学仪器中心</a>|
        <a href="http://www.cnern.org/index.action">国家生态系统观测研究网络</a>|
        <a href="http://www.nms.org.cn/Home/Default.aspx">国家计量基标准资源共享平台</a>|
        <a href="http://www.ecorr.org/">国家材料环境腐蚀野外科学观测研究平台</a>
    </div>
</div>
<div class="footer">
    版权所有
</div>


<div class="open hide" id="dialog">
    <div class="openbg"></div>
    <div class="openWrap">
        <div class="openHead">
            <span class="openLeft"></span>
            <span class="openRight"></span>
            <div class="openMiddle">
                <span class="openTitle"></span>
                <a href="#" class="close" onclick="closeDialog()"><img src="${ ctx}/images/close.png" /></a>
            </div>
            
        </div>
        <div class="openMain">
            <div id="dialogForm">
            
            
            </div>
            <div class="openBtn">
                <a href="#" class="openOn" id="submit">保存</a><a href="#" class="openOff" onclick="closeDialog()">关闭</a>
            </div>
            
        </div>
    </div>
    </div>
    
</body>
</html>