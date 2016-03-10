<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- 导航栏 -->
<script type="text/javascript">
/*
 * 导航
 * url 请求URL
 * param 参数
 * Obj 被点击的对象
 */
function navTo(url,obj,param){
	
	  $("#mainNav li a").removeClass("currentLi"); 
	   $(obj).addClass("currentLi");
	   loadAction(url);
}

</script>
<div class="topNavWap"> 
		<div class="container"> 
			<div class="navbar-header"> 
				<button class="navbar-toggle" role="button" data-toggle="collapse" href="#topNav" aria-expanded="false" aria-controls="topNav">
					<span class="sr-only">头部导航显示影藏</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="" class="logo"><img src="images/logo.png"  /></a>
			</div>
			<div class="navbar-collapse collapse" id="topNav">
				<ul class="nav navbar-nav" id="mainNav">
					<li><a class="currentLi" href="#" onclick="navTo('home.do', this)" ><span></span>Home</a></li>
					<li><a href="#" onclick="navTo('page/news/newsindex.do', this)" ><span></span>News</a></li>
					<li><a href="#" onclick="navTo('page/database/database.do',this)" ><span></span>Database</a></li>
					<li><a href="#" onclick="navTo('page/knowledgebase/knowledge_search.do', this)" ><span></span>Knowledge base</a></li>
					<li class=""><a href="#" target="_blank"><span></span>search</a></li>
					<li class="hidden-sm"><a href="#" target="_blank"><span></span>Notice announcement</a></li>
					<li class="hidden-sm hidden-md"><a href="#" onclick="navTo('page/aboutplatform/aboutplatform.do', this)" ><span></span>About platform</a></li>
					<li class="hidden-sm hidden-md"><a href="#" onclick="navTo('page/contactus/contactus.do', this)" >Contact us<span></span></a></li>
					<li class="hidden-lg hidden-xs dropdown">
						<a href="javascript:void(0)"  class="dropdown-toggle" data-toggle="dropdown" ><span></span>More</a>
						<ul class="dropdown-menu" role="menu"> 
							<li><a href="">Notice announcement</a></li>
							<li><a href="">About platform</a></li>
							<li><a href="">Contact us</a></li>
						</ul>
					</li>
				</ul> 
			</div>		
		</div>
	</div>
</div>