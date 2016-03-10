<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>世界生命湖泊应用科技信息平台</title>
<%--      <%@ include file="/common/commonIndex.jsp"%>  --%>
<%-- 	<%@ include file="../home/webIndex.jsp"%> --%>
    
    <script type="text/javascript">
    	function nextPage(pageNum,type){
    		var lakeId=${lakeDetailForm.lake.id};
    		//alert(lakeId+", "+pageNum+", "+type);
    		//var tr = $("#moisture");
    		//tr.empty();
    		var trt;
    		if(type == 1){
    			trt = $("#moisture");
    		}
    		if(type == 2){
    			trt = $("#soil");
    		}
    		if(type == 3){
    			trt = $("#air");
    		}
    		if(type == 4){
    			trt = $("#biology");
    		}
    		if(type == 5){
    			trt = $("#water");
    		}
    		if(type == 6){
    			trt = $("#quality");
    		}
    		trt.empty();
    		//tr.append("woqunidayede");
    		//trr.append('<div id="aa" class="imgWapHpxq clearfix"></div> <div id="bb" class="pageChange"></div> ');
    		
    		$.getJSON("${ctx}/lake-detail!init.action", {lakeId:lakeId, pageNum:pageNum, type:type}, function(data){
    			var tr = '<div id="aa" class="imgWapHpxq clearfix">';
    			//debugger;
    			$.each(data.result, function(i,item){
     				tr = tr + '<ul class="imglistUl"> ';
     				tr = tr + '<li class="imgLi"> ';
     				tr = tr + '<a href="#" onclick="loadAction(\'${ctx}/lake-database-detail.action?dataId=\'+ '+item.id+' )"> ';
    				tr = tr + '<img src="${ctx}/file-view!view.action?filePath='+item.picAdd+'" /> ';
    				tr = tr + '<span></span><em>'+item.title+'</em> ';
    				tr = tr + '</a></li> ';
    				tr = tr + '<li class="textLi"> ';
    				tr = tr + '<a href="#" onclick="loadAction(\'${ctx}/lake-database-detail.action?dataId=\'+ '+item.id+' )"> ';
    				tr = tr + item.dataDesc;
    				tr = tr + '</a></li> ';
    				tr = tr + '</ul> ';			
    			});
    			
    			tr = tr + '</div>';
    			trt.append(tr);
    			tr = '<div class="pageChange">';
    			if(data.pageNo > 2){
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo-1)+','+type+' );" class="textA">上一页</a> ';
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo-2)+','+type+' );" class="numA">'+(data.pageNo-2)+'</a> ';
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo-1)+','+type+' );" class="numA">'+(data.pageNo-1)+'</a> ';
    			}else if(data.pageNo == 2){
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo-1)+','+type+' );" class="textA">上一页</a> ';
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo-1)+','+type+' );" class="numA">'+(data.pageNo-1)+'</a> ';
    			}else{
    				tr = tr + '<a class="grayA">上一页</a> ';
    			}
    			tr = tr + '<a class="numAOn">'+data.pageNo+'</a> ';
    			if(data.totalPageNum > data.pageNo + 1){
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo+1)+','+type+' );" class="numA">'+(data.pageNo+1)+'</a> ';
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo+2)+','+type+' );" class="numA">'+(data.pageNo+2)+'</a> ';
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo+1)+','+type+' );" class="textA">下一页</a> ';
    			}else if(data.totalPageNum == data.pageNo + 1){
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo+1)+','+type+' );" class="numA">'+(data.pageNo+1)+'</a> ';
    				tr = tr + '<a href="javascript:nextPage('+(data.pageNo+1)+','+type+' );" class="textA">下一页</a> ';
    			}else{
    				tr = tr + '<a class="grayA">下一页</a> ';
    			}
    			trt.append(tr);
    		});
    		
    	}
    </script>
    
</head>
<body>

<!-- cont -->
<div class="bgDiv">
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><a href="#" onclick="loadPage('database/databaseindex')" >全球湖泊基本数据库</a><em>&gt;</em><span>${lakeDetailForm.lake.lakename}</span>
		</div>		
		<div class="whiteBlock padding10 clearfix"> 
			<div class="lPicPhxqy"> 
<!-- 				<img src="images/phxqy01.jpg"  /> -->
				<img src="${ctx}/file-view!view.action?filePath=${lakeDetailForm.lake.picAdd}" />
				<span></span><em>${lakeDetailForm.lake.lakename}</em>
			</div>
			<div class="rUlPhxqy"> 
				<table class="phxqTable">
					<tr><th>湖泊类型：</th><td>${lakeDetailForm.lake.lakeTypeName}</td></tr>
					<tr><th>经&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>${lakeDetailForm.lake.longitude}</td></tr>
					<tr><th>纬&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>${lakeDetailForm.lake.latitude}</td></tr>
					<tr><th>湖泊岸线：</th><td>${lakeDetailForm.lake.shoreline}</td></tr>
					<tr><th>湖泊面积：</th><td>${lakeDetailForm.lake.lakearea} km<span class="supHeight"><sup>2</sup></span></td></tr>
					<tr><th>容&nbsp;&nbsp;&nbsp;&nbsp;积：</th><td>${lakeDetailForm.lake.volume} m<span class="supHeight"><sup>3</sup></span></td></tr>
					<tr><th>长&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>133${lakeDetailForm.lake.lakeLength} km</td></tr>
					<tr><th>宽&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>${lakeDetailForm.lake.lakeWidth} km</td></tr>
					<tr><th>流域范围：</th><td>${lakeDetailForm.lake.basinRange}</td></tr>
				</table>
			</div>
		</div>
		<div class="marginTop30 whiteBlock"> 
			<div class="blueBTit"><span>湖泊监测数据</span></div>
			<div class="paddingTop20"> 
				<ul class="navPhxqy">
					<li class="on">水分因子</li>
					<li>土壤因子</li>
					<li>大气因子</li>
					<li>生物因子</li>
					<li>水体因子</li>
					<li>水质检测</li>
				</ul>
				<div id="moisture" class="changeHpxqy">
					<div class="imgWapHpxq clearfix"> 
					<c:forEach items="${lakeDetailForm.moistureList}" var="res" varStatus="status">
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
<!-- 									<img src="images/hpxqy04.jpg" /> -->
									<img src="${ctx}/file-view!view.action?filePath=${res.picAdd}" />
									<span></span><em>${res.title}</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
									${res.dataDesc}...
<!-- 									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资.. -->
								</a>
							</li>
						</ul>	
					</c:forEach>
					</div>
					<div class="pageChange"> 
						<c:set var="salary" scope="session" value="${lakeDetailForm.moistureNum}"/>
						<a class="grayA">上一页</a>
						<a class="numAOn">1</a>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','1');" class="numA">2</a>
						</c:if>
						<c:if test="${salary > 2}">
							<a href="javascript:nextPage('3','1');" class="numA">3</a>
						</c:if>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','1');" class="textA">下一页</a>
						</c:if>
						<c:if test="${salary == 1}">
							<a class="grayA">上一页</a>
						</c:if>
					</div>			
				</div>
				<div id="soil" class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<c:forEach items="${lakeDetailForm.soilList}" var="res" varStatus="status">
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
<!-- 									<img src="images/hpxqy04.jpg" /> -->
									<img src="${ctx}/file-view!view.action?filePath=${res.picAdd}" />
									<span></span><em>${res.title}</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
									${res.dataDesc}...
								</a>
							</li>
						</ul>	
						</c:forEach>					
					</div>
					<div class="pageChange"> 
						<c:set var="salary" scope="session" value="${lakeDetailForm.soilNum}"/>
						<a class="grayA">上一页</a>
						<a class="numAOn">1</a>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','2');" class="numA">2</a>
						</c:if>
						<c:if test="${salary > 2}">
							<a href="javascript:nextPage('3','2');" class="numA">3</a>
						</c:if>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','2');" class="textA">下一页</a>
						</c:if>
						<c:if test="${salary == 1}">
							<a class="grayA">上一页</a>
						</c:if>
					</div>				
				</div>
				<div id="air" class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<c:forEach items="${lakeDetailForm.airList}" var="res" varStatus="status">
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
<!-- 									<img src="images/hpxqy04.jpg" /> -->
									<img src="${ctx}/file-view!view.action?filePath=${res.picAdd}" />
									<span></span><em>${res.title}</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
									${res.dataDesc}...
								</a>
							</li>
						</ul>	
						</c:forEach>			
					</div>
					<div class="pageChange"> 
						<c:set var="salary" scope="session" value="${lakeDetailForm.airNum}"/>
						<a class="grayA">上一页</a>
						<a class="numAOn">1</a>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','3');" class="numA">2</a>
						</c:if>
						<c:if test="${salary > 2}">
							<a href="javascript:nextPage('3','3');" class="numA">3</a>
						</c:if>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','3');" class="textA">下一页</a>
						</c:if>
						<c:if test="${salary == 1}">
							<a class="grayA">上一页</a>
						</c:if>
					</div>				
				</div>
				<div id="biology" class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<c:forEach items="${lakeDetailForm.biologyList}" var="res" varStatus="status">
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
<!-- 									<img src="images/hpxqy04.jpg" /> -->
									<img src="${ctx}/file-view!view.action?filePath=${res.picAdd}" />
									<span></span><em>${res.title}</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
									${res.dataDesc}...
								</a>
							</li>
						</ul>	
						</c:forEach>			
					</div>
					<div class="pageChange"> 
						<c:set var="salary" scope="session" value="${lakeDetailForm.biologyNum}"/>
						<a class="grayA">上一页</a>
						<a class="numAOn">1</a>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','4');" class="numA">2</a>
						</c:if>
						<c:if test="${salary > 2}">
							<a href="javascript:nextPage('3','4');" class="numA">3</a>
						</c:if>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','4');" class="textA">下一页</a>
						</c:if>
						<c:if test="${salary == 1}">
							<a class="grayA">上一页</a>
						</c:if>
					</div>				
				</div>
				<div id="water" class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<c:forEach items="${lakeDetailForm.waterList}" var="res" varStatus="status">
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
<!-- 									<img src="images/hpxqy04.jpg" /> -->
									<img src="${ctx}/file-view!view.action?filePath=${res.picAdd}" />
									<span></span><em>${res.title}</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
									${res.dataDesc}...
								</a>
							</li>
						</ul>	
						</c:forEach>						
					</div>
					<div class="pageChange"> 
						<c:set var="salary" scope="session" value="${lakeDetailForm.waterNum}"/>
						<a class="grayA">上一页</a>
						<a class="numAOn">1</a>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','5');" class="numA">2</a>
						</c:if>
						<c:if test="${salary > 2}">
							<a href="javascript:nextPage('3','5');" class="numA">3</a>
						</c:if>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','5');" class="textA">下一页</a>
						</c:if>
						<c:if test="${salary == 1}">
							<a class="grayA">上一页</a>
						</c:if>
					</div>				
				</div>
				<div id="quality" class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<c:forEach items="${lakeDetailForm.qualityList}" var="res" varStatus="status">
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
<!-- 									<img src="images/hpxqy04.jpg" /> -->
									<img src="${ctx}/file-view!view.action?filePath=${res.picAdd}" />
									<span></span><em>${res.title}</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})">
									${res.dataDesc}...
								</a>
							</li>
						</ul>	
						</c:forEach>			
					</div>
					<div class="pageChange"> 
						<c:set var="salary" scope="session" value="${lakeDetailForm.qualityNum}"/>
						<a class="grayA">上一页</a>
						<a class="numAOn">1</a>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','6');" class="numA">2</a>
						</c:if>
						<c:if test="${salary > 2}">
							<a href="javascript:nextPage('3','6');" class="numA">3</a>
						</c:if>
						<c:if test="${salary > 1}">
							<a href="javascript:nextPage('2','6');" class="textA">下一页</a>
						</c:if>
						<c:if test="${salary == 1}">
							<a class="grayA">上一页</a>
						</c:if>
					</div>				
				</div>
			</div>
		</div>
	</div>
</div>


 <!-- footer
<div class="link">
    <div class="link-wrap">
        <span>友情链接：</span><a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息据据库</a>|<a href="#">研究组织数据库</a>|
    </div>
</div>
<div class="footer">
    版权所有
</div> --> 
<script type="text/javascript"> 
	//湖泊监测数据  切换
	$('.navPhxqy li').bind('mouseover',function(){
		var num = $(this).index();
		var disObj = $('.changeHpxqy') ;
		$(this).addClass('on').siblings('li').removeClass('on');
		
		$(disObj).eq(num).removeClass('hide').siblings('.changeHpxqy').addClass('hide');
	});
</script>

</body>
</html>