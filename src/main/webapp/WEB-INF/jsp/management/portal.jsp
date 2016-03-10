<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" charset="utf-8">
$(function() {
	$("#time").text("欢迎您登录！");
});
</script>
<!-- 欢迎页面 -->
<div class="easyui-panel" fit="true" 
	style="width: 100%; height:100%; overflow: hidden;">
	<textarea id="time"
		style="width: 100%; height: 415pt; overflow: hidden; font-size: 15pt; font-weight: 700"
		readonly="true"></textarea>
</div>

