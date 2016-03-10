<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<% 
String lake_id=request.getParameter("lake_id"); 
String lake_name=request.getParameter("lake_name"); 
%>

	<style type="text/css">
	
	html{height:100%}    
    body{height:100%;margin:0px;padding:0px} 
    #allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";} 
	</style>
	 <%@ include file="/common/meta.jsp"%>
	 <%@ include file="/common/map.jsp"%>
	<!-- <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8GsPHIUvGnNoWCP2TGoGMfwq"></script> -->
	<title>地图展示</title>

	<div id="allmap"></div>
	<input id="lake_name" value='<%=lake_name%>'/>
	<input id="lake_id" value='<%=lake_id%>'/>

<script type="text/javascript">
	//湖泊信息
	var name ="";
	var lakeName="";
	var Longitude=undefined;
	var Latitude=undefined;
	var lake_name=$('#lake_name').val();
	var lake_id=$('#lake_id').val();
	if(lake_id==undefined || lake_id=='' || lake_id==null){
		lake_id="268";
	}
	$.post("lake!getLakeById.action",{
		'lakeForm.lake_id':(lake_id!=null)?lake_id:"268"
	},function(data){
		var x = eval(data);
		 Longitude=parseFloat(data[0].longitude);
		 Latitude=parseFloat(data[0].latitude);
		 lakeName = data[0].lakename;
		 name ="<table><tr><td>长度："+data[0].lakeLength+"km</td><td>宽度："+data[0].lakeWidth+"km</td>";
		 name = name + "<td>面积："+data[0].lakearea+"km2</td></tr><tr><td>容积："+data[0].volume+"m3</td>";
		 name = name + "<td>岸线："+data[0].shoreline+"km</td><td>类型："+data[0].lakeTypeName+"</td></tr>";
		 name = name + "<tr><td colspan='3'>流域："+data[0].basinRange+"</td></tr></table>";
		 
		  
		 /* 
		 // 百度地图API功能
		  var map = new BMap.Map("allmap");
		  //鄱阳湖中心位置（经度，纬度）116.291582，28.88347
		  var point = new BMap.Point(Longitude,Latitude);
		  //Map.centerAndZoom()方法对地图进行初始化。未进行初始化的地图将不能进行任何操作
		  map.centerAndZoom(point, 10);//中心点坐标和地图级别
		  map.addControl(new BMap.NavigationControl());    //增加一个地图平移缩放控件
		  map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
		  map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
 			var marker = new BMap.Marker(point);// 创建标注
 			map.addOverlay(marker);             // 将标注添加到地图中
 			marker.disableDragging();           // 不可拖拽
// 			var opts = {
// 					  position : point,    // 指定文本标注所在的地理位置
// 					  offset   : new BMap.Size(15, -30)    //设置文本偏移量
// 					}
// 			var label = new BMap.Label(name, opts);  // 创建文本标注对象
// 				label.setStyle({
// 					 color : "red",
// 					 fontSize : "12px",
// 					 height : "120px",
// 					 lineHeight : "20px",
// 					 fontFamily:"微软雅黑"
// 				 });
			var opts = {
	  			width : 300,     // 信息窗口宽度
	  			//height: 200,     // 信息窗口高度
	  			title : lakeName , // 信息窗口标题
	  			enableMessage:true,//设置允许信息窗发送短息
			}
			var infoWindow = new BMap.InfoWindow(name, opts);  // 创建信息窗口对象              
			map.openInfoWindow(infoWindow,point); //开启信息窗口
			
			//鼠标移上去显示文字
			marker.addEventListener("mouseover",function(){
// 				map.addOverlay(label);  
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
			//鼠标移出来不显示文字
			//marker.addEventListener("mouseout",function(){
			//	map.removeOverlay(label);  
			//});
			//鼠标点击标注，放大		 
			marker.addEventListener("click",function(){
				//map.centerAndZoom(point, 15);  
				window.parent.loadAction('${ctx}/lake-detail.action?lakeId='+lake_id);
				//window.open(loadAction('${ctx}/lake-detail.action?lakeId='+lake_id,'_blank');
			}); */
		//openstreetmap地图	
		 var map = L.map('allmap').setView([Latitude, Longitude], 8);
		//地图右下角链接
		mapLink ='<a href="http://openstreetmap.org">OpenStreetMap</a>';
		L.tileLayer(
			'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',//从openstreetmap的tile servera获取tile
			 {
			   attribution: 'Map data &copy; ' + mapLink,
			   maxZoom: 10
			}).addTo(map);
		var marker = L.marker([Latitude, Longitude]).addTo(map);
		//默认显示弹出框信息
		marker.bindPopup(name).openPopup();
		//鼠标移到marker标记上，触发事件显示弹出框
		marker.addEventListener('mouseover',function(){
			marker.openPopup();
		});
		//鼠标点击marker标记，触发事件，跳转另一个页面
		marker.addEventListener('click',function(){
			window.parent.loadAction('${ctx}/lake-detail.action?lakeId='+lake_id);
		});
	},"json");
	/* if(lake_name=="Poyang"){
		name="鄱阳湖";
		 Longitude=116.291582;
		 Latitude=28.88347;
	}else if(lake_name=="Dongting"){
		name="洞庭湖";
		Longitude=113.02153;
		 Latitude=29.126329;
	}else if(lake_name=="Taihu"){
		name="太 湖";
		 Longitude=116.312308;
		 Latitude=30.461496;
	}else{
		name="鄱阳湖";
		 Longitude=116.291582;
		 Latitude=28.88347;
	} */
	
  // 百度地图API功能
  /* var map = new BMap.Map("allmap");
  //鄱阳湖中心位置（经度，纬度）116.291582，28.88347
  var point = new BMap.Point(Longitude,Latitude);
  //Map.centerAndZoom()方法对地图进行初始化。未进行初始化的地图将不能进行任何操作
  map.centerAndZoom(point, 10);//中心点坐标和地图级别
  map.addControl(new BMap.NavigationControl());    //增加一个地图平移缩放控件
  map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
  map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	var marker = new BMap.Marker(point);// 创建标注
	map.addOverlay(marker);             // 将标注添加到地图中
	marker.disableDragging();           // 不可拖拽
	var opts = {
			  position : point,    // 指定文本标注所在的地理位置
			  offset   : new BMap.Size(15, -30)    //设置文本偏移量
			}
	var label = new BMap.Label(name, opts);  // 创建文本标注对象
		label.setStyle({
			 color : "red",
			 fontSize : "12px",
			 height : "20px",
			 lineHeight : "20px",
			 fontFamily:"微软雅黑"
		 });
	//鼠标移上去显示文字
	marker.addEventListener("mouseover",function(){
		map.addOverlay(label);  
	});
	//鼠标移出来不显示文字
	marker.addEventListener("mouseout",function(){
		map.removeOverlay(label);  
	});
	//鼠标点击标注，放大		 
	marker.addEventListener("click",function(){
		//map.centerAndZoom(point, 15);  
		window.open('lake-detail.action?lakeId='+lake_id,'_blank');
	}); */
	
	
</script>