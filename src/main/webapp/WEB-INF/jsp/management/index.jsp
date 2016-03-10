<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>世界生命湖泊科学应用与数据共享平台</title>
<%@ include file="/common/meta.jsp"%>
</head>
<%-- 主窗口 --%>
<body id="indexLayout" class="easyui-layout" style="height: 100%;width: 100%;overflow-y: hidden;">
	<noscript>
		<div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">
			<img src="${ctx}/img/noscript.gif" alt='请开启脚本支持!' />
		</div>
	</noscript>
	<%-- 顶部  --%>
	<div data-options="region:'north',border:false,split:false,href:'${ctx }/page/management/north.do'"
		style="height: 120px;overflow: hidden;">
	</div>

	<!-- west菜单栏 -->
	<div class="westZ" data-options="region:'west',title:'导航菜单',split:false,href:'${ctx }/page/management/west.do'"
		style="width: 160px;overflow: hidden;">
	</div>

	<!-- center主面板 -->
	<div class="eastZ" data-options="region:'center',split:false,href:'${ctx }/page/management/center.do'" style="overflow: hidden;">
	</div>
	
	<!-- south底部 -->
	<div data-options="region:'south',border:false,split:false,href:'${ctx }/page/management/south.do'"
		style="height: 20px;overflow: hidden;">
	</div>
</body>
</html>