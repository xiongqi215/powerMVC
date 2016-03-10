<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
	<style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{height:100%;width:100%;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8GsPHIUvGnNoWCP2TGoGMfwq"></script>
	<title>机构地图</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point('116.007772','28.699874'),15);
	map.enableScrollWheelZoom(true);
	map.clearOverlays(); 
	var new_point = new BMap.Point('116.007772','28.699874');
	var marker = new BMap.Marker(new_point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	map.panTo(new_point);      
</script>
