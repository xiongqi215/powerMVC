<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>世界生命湖泊应用科技信息平台</title>
<%--     <%@ include file="/common/commonIndex.jsp"%> --%>
    
     <script type="text/javascript">
//      	function download(){
//      		var filepath = '${lakeDatabaseDetailForm.dataset.attachAdd}';
//      		var filename = '${lakeDatabaseDetailForm.dataset.attachTitle}';
//      		//alert(filepath+", "+filename);
//      		$.ajax({
//     			url:'${ctx}/fileDownload',
//     			type:'post',
// //     			data:{"filepath":filepath, 
// //     				"filename":filename},
//     			data:{"filepath":"Z:\redX.png", 
//         			"filename":"red.png"},
//     			async : false,
//     			success:function(result){
    				
//     			}
    		
//     		});
//      	}
     </script>
     
</head>
<body>

<!-- cont -->
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><a href="#" onclick="loadPage('database/databaseindex')" >全球湖泊基本数据库</a><em>&gt;</em><a href="#" onclick="loadAction('${ctx}/lake-detail.action?lakeId='+${lakeDatabaseDetailForm.dataset.lakeId})" >${lakeDatabaseDetailForm.dataset.lakeName}</a><em>&gt;</em><span>${lakeDatabaseDetailForm.dataset.keytypeName}</span>
		</div>
		<div class="whiteBlock zsksjWap"> 
			<h1 class="zsksjTit">${lakeDatabaseDetailForm.dataset.title}</h1>
			
			<div class="paddingTop60">
				<div class="blueSTit">
					<span>基本信息</span>
				</div>
				<ul class="zsksjInfo paddingTop30">
					<li>数据时间：${lakeDatabaseDetailForm.dataset.dataTime}</li>
					<li>空间位置：${lakeDatabaseDetailForm.dataset.countryName}</li>
					<li>数据分发单位：${lakeDatabaseDetailForm.dataset.memberName}</li>
					<li>分发单位地址：${lakeDatabaseDetailForm.dataset.memberAddress}</li>
					<li>最新更新时间：${lakeDatabaseDetailForm.dataset.lastModify}</li>
				</ul>
			</div>
			<div class="paddingTop30">
				<div class="blueSTit">
					<span>数据简介</span>
				</div>
				<div class="zsksjInfo paddingTop30"> 
					${lakeDatabaseDetailForm.dataset.dataDesc}
						<!-- 该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊
					代码本等相关资料，剔除已确定消失的湖泊，整理出湖泊志中各湖泊80年代的水质详细描述，对ph、透明度、阳离子、阴离子、湖泊性质等水化学
					各指标进行人工摘录并按照统一格式整理，得到各湖泊的水化学指标统计信息。包含了1个excel数据，10以上湖泊水化学数据.xlsx，较系统的记录
					了各湖泊80s的水质状况。 -->
				</div>
			</div>			
			<div class="paddingTop30">
				<div class="blueSTit">
					<span>指标数据</span>
				</div>
				<ul class="zsksjInfo paddingTop30">
					<c:forEach items="${lakeDatabaseDetailForm.detailList}" var="res" varStatus="status">
						<li>${res.cnName}(${res.enName})：${res.num} ${res.symbol}</li>
					</c:forEach>
					<%-- <li>土壤含水量：${lakeDatabaseDetailForm.detailList.number} ${lakeDatabaseDetailForm.detailList.symbol}</li>
					<li>地下水位：</li>
					<li>地表水水质：</li>
					<li>地下水水质：</li>
					<li>雨水水质：</li>
					<li>生态系统蒸散量：</li>
					<li>水面蒸发量：</li> --%>
				</ul>
			</div>	
			<div class="paddingTop30">
				<div class="blueSTit">
					<span>数据附件</span>
				</div>
				<div class="paddingTop20">	
<%-- 					<c:set var="salary1" scope="session" value="${lakeDatabaseDetailForm.dataset.attachAdd}"/>  --%>
<%--  					<c:set var="salary2" scope="session" value="${lakeDatabaseDetailForm.dataset.attachTitle}"/>  --%>
					<c:if test="${not empty lakeDatabaseDetailForm.dataset.attachTitle}">
  						<a href="${ctx}/fileDownload?filepath=${lakeDatabaseDetailForm.dataset.attachAdd}&filename=${lakeDatabaseDetailForm.dataset.attachTitle}" class="grayBorderA">${lakeDatabaseDetailForm.dataset.attachTitle} </a> 
<%--  						<a href="javascript:download();" class="grayBorderA">${lakeDatabaseDetailForm.dataset.attachTitle} </a>  --%>
 					</c:if> 
					<!-- <a href="" class="grayBorderA">数据文档_中国10km2以上湖泊80s水化学数据集.doc </a>
					<a href="" class="grayBorderA">数据文档_中国10km2以上湖泊80s水化学数据集.doc </a>
					<a href="" class="grayBorderA">数据文档_中国10km2以上湖泊80s水化学数据集.doc </a>
					<a href="" class="grayBorderA">数据文档_中国10km2以上湖泊80s水化学数据集.doc </a> -->
				</div>
			</div>
			
		</div>
	</div>
</div>

<!--footer-->
<!-- <div class="link">
    <div class="link-wrap">
        <span>友情链接：</span><a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息据据库</a>|<a href="#">研究组织数据库</a>|
    </div>
</div>
<div class="footer">
    版权所有
</div> -->
</body>
</html>