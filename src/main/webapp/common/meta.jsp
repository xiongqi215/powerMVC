<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta name="author" content="strongit" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
<meta charset="UTF-8">
<link rel="shortcut icon" href="${ctx}/img/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/global.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/web.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/default.css" />

<link rel="stylesheet" type="text/css" href="${ctx}/css/form_style.css" />

<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery/easyui-1.3.3/portal/portal.css">
<script type="text/javascript" charset="utf-8">
var ctx = "${ctx}";
</script>
<%-- <script type="text/javascript" src="${ctx}/js/jquery/easyui-1.4/jquery-1.11.1.min.js"></script> --%>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-1.9.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-migrate-1.2.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.cookie.js" charset="utf-8"></script>
<%
	String easyuiThemeName = "default";
	Cookie cookies[] = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("easyuiThemeName")) {
				easyuiThemeName = cookie.getValue();
				break;
			}
		}
	}
%>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx}/js/jquery/easyui-1.4/themes/<%=easyuiThemeName%>/easyui.css" />

<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx}/js/jquery/easyui-1.3.3/themes/<%=easyuiThemeName%>/my97.css" />

<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery/easyui-1.4/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/change_easyui_z.css" />

<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

<script type="text/javascript" src="${ctx}/js/jquery/easyui-1.4/jquery.easyui.min.js" charset="utf-8"></script>

<script type="text/javascript" src="${ctx}/js/jquery/easyui-1.3.3/jquery.my97.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/jquery/easyui-1.3.3/portal/jquery.portal.js" charset="utf-8"></script>

<script type="text/javascript" src="${ctx}/js/jquery/easyui-1.4/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<script type="text/javascript" src="${ctx}/js/xheditor-1.2.1/xheditor-1.2.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/xheditor-1.2.1/xheditor_lang/zh-cn.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/banner.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/index.js" charset="utf-8"></script>

<script type="text/javascript" src="${ctx}/js/validatebox-extend.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/validatebox-ajax.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/pemsJs/syExtEasyUI.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/pemsJs/syExtJavascript.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/js/pemsJs/syExtJquery.js" charset="utf-8"></script>  
<script type="text/javascript" src="${ctx}/js/highcharts/highcharts.js" charset="utf-8"></script>      