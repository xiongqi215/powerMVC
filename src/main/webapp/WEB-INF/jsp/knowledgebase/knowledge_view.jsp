<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/flexpaper/jquery.js"></script>
<!-- 引入flexpaper插件 -->
<script type="text/javascript" src="${ctx}/js/flexpaper/flexpaper_flash.js"></script>  
<script type="text/javascript" src="${ctx}/js/flexpaper/flexpaper_flash_debug.js"></script>
<style type="text/css" media="screen"> 
			html, body	{ height:100%; }
			body { margin:0; padding:0; overflow:auto; }   
			#flashContent { display:none; }
        </style> 

<title>文档在线预览</title>
</head>
<body> 
        <div style="position:absolute;width:100%;height:100%;">
	        <a id="viewerPlaceHolder" style="width:100%;height:100%;display:block"></a>
	        
	        <script type="text/javascript"> 
				var fp = new FlexPaperViewer(	
						'${ctx}/js/flexpaper/FlexPaperViewer',
						 'viewerPlaceHolder', { config : {
						 SwfFile : '${ctx}/${request.viewPath}',
// 						 默认缩放
						 Scale : 1, 
// 						 缩放风格
						 ZoomTransition : 'easeOut',
						 ZoomTime : 0.5,
						 ZoomInterval : 0.2,
						 FitPageOnLoad : true,
						 FitWidthOnLoad : false,
						 //全屏
						 FullScreenAsMaxWindow : true,
						 ProgressiveLoading : false,
						 //最大缩小倍数
						 MinZoomSize : 0.2,
						 //最大放大倍数
						 MaxZoomSize : 5,
						 SearchMatchAll : false,
						 InitViewMode : 'SinglePage',
// 						 工具栏
						 ViewModeToolsVisible : true,
						 ZoomToolsVisible : true,
						 NavToolsVisible : true,
						 CursorToolsVisible : true,
						 SearchToolsVisible : true,
  						
  						 localeChain: 'en_US'
						 }});
	        </script>            
        </div>
</body>
</html>