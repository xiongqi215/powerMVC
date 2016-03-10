<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	var lakemonitor={
			bindEvent:function(){
				$('#hpdb').bind('click',function(){
					loadPage('database/databaseindex');
				});
				$('#orgdb').bind('click',function(){
					loadAction('${ctx}/lake-org-database.action')
				});
				$('#stdb').bind('click',function(){
					loadAction('${ctx}/lake-monitor-database.action?databaseType=1');
				});
				$('#szdb').bind('click',function(){
					loadAction('${ctx}/lake-monitor-database.action?databaseType=2');
				});
				$('#docdb').bind('click',function(){
					loadPage('knowledgebase/knowledge_search');
				});
				var t = '${databaseType}';
				if(t == 1){
					$("#stdb").addClass("on");
				}else{
					$("#szdb").addClass("on");
				}
			}
	}
	$(function(){
		lakemonitor.bindEvent();
	});
</script>
<!-- cont -->
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><a href="#" onclick="loadPage('database/databaseindex')" >全球湖泊基本数据库</a><em>&gt;</em><span>湖泊监测数据库</span>
		</div>
		<div class="clearfix"> 
			<div class="leftColumn"> 
				<div class="headTitColumn">数据库</div>
				<div class="columnLink"> 
					<a id="hpdb" href="#">全球湖泊基础数据库</a>
					<a id="orgdb" href="#">全球湖泊研究机构数据库 </a>
					<a id="stdb" href="#">湖泊生态监测数据库 </a>
					<a id="szdb" href="#">湖泊水质监测数据库 </a>
					<a id="docdb" href="#">湖泊科学应用成果数据库</a>
				</div>
			</div>
			<div class="rightColumn whiteBlock"> 
				<div class="padding20-25"> 
					<div id="datasetList" class="clearfix imglistColumn">
						<c:forEach items="${lakeMonitorDatabaseForm.moistureList}" var="res" varStatus="status">
						<ul class="imglistUl">
						  <li class="imgLi">
						    <a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId=${res.id}')" >
						      <img src="${ctx}/images/hpxqy03.jpg" />
						      <span></span><em>${res.title}</em>              
						    </a>
						  </li>
						  <li class="textLi"> 
						    <a href="#" onclick="loadAction('${ctx}/lake-database-detail.action?dataId=${res.id}')">
						      ${res.dataDesc}...
						    </a>
						  </li>
						</ul>	
					</c:forEach>
					</div>
					<!-- <div class="pageChange"> 
						<table><tr><td> 
							<a href="" class="grayA">上一页</a>
							<a href="" class="numAOn">1</a>
							<a href="" class="numA">2</a>
							<span class="dd">...</span>
							<a href="" class="numA">3</a>
							<a href="" class="textA">下一页</a>
							<span class="dny">共2页</span>
							<span>第</span>
							<input type="text" class="dnyInp" />
							<span>页</span>
							<input type="button" value="GO" />								
						</td></tr></table>
					</div> -->					
				</div>
			</div>
		</div>
	</div>
</div>

