<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- cont -->
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><span>关于平台</span>
		</div>
	</div>
	<div class="gyptCont"> 
		<img src="${ctx}/images/gyptImg02.jpg"  />
	</div>
</div>
<script type="text/javascript"> 
$(function(){
	$('.zskssInp').bind('focus',function(){
		var val = $(this).val();
		if( $(this).val() == '请输入搜索关键字' ){
			$(this).val('');
		}
	});
	$('.zskssInp').bind('blur',function(){
		var val = $(this).val();
		if( $(this).val() == '' ){
			$(this).val('请输入搜索关键字');
		}
	});	
});
</script>