<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	var lakemonitor={
			bindEvent:function(){
				$('#searchbtn').bind('click',function(){
					loadAction('${ctx}/lake-org-database!search.action',{"lakeOrgDatabaseForm.orgName":$('#orgName').val()});
				});
				
			}
	}
	$(function(){
		lakemonitor.bindEvent();
		
		var t = '${lakeOrgDatabaseForm.orgName}';
		if(t == ''){
			document.getElementById("orgName").value = "请输入机构名称";
		}else{
			document.getElementById("orgName").value = t;
		}
		
	});
	
	function openDialog(){
// 		dialog('机构地图','${ctx}/database/org-map.action',function(){
// 		});
 		window.open ('${ctx}/database/org-map.action');
//		window.showModalDialog('${ctx}/database/org-map.action', "机构地图", "dialogWidth:800px;dialogHeight:500px;status:no;help:no;resizable:yes;scroll:no;");
	}
	
</script>
<!-- cont -->
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><span>全球湖泊研究机构数据库</span>
		</div>
		<div class="clearfix"> 
			<div class="leftColumn"> 
				<div class="headTitColumn">数据库</div>
				<div class="columnLink"> 
					<!-- <a href="" >全球湖泊基础数据库</a>
					<a href="">全球湖泊研究机构数据库 </a>
					<a href="" class="on">湖泊生态监测数据库 </a>
					<a href="">湖泊水质监测数据库 </a>
					<a href="">湖泊科学应用成果数据库</a> -->
					<a id="hpdb" href="#" onclick="loadPage('database/databaseindex')" >全球湖泊基础数据库</a>
					<a id="orgdb" href="#" class="on" onclick="loadAction('${ctx}/lake-org-database.action')" >全球湖泊研究机构数据库 </a>
					<a id="stdb" href="#" onclick="loadAction('${ctx}/lake-monitor-database.action?databaseType=1')" >湖泊生态监测数据库 </a>
					<a id="szdb" href="#" onclick="loadAction('${ctx}/lake-monitor-database.action?databaseType=2')" >湖泊水质监测数据库 </a>
					<a id="docdb" href="#" onclick="loadPage('knowledgebase/knowledge_search')" >湖泊科学应用成果数据库</a>
				</div>
			</div>
			<div class="rightColumn whiteBlock"> 
				<div class="padding20-25"> 
					<div class="clearfix"> 
						<ul class="searchUl">
							<li>
								<i>机构名称：</i>
								<span>
									<input id="orgName" type="text" class="jgmcInp" onfocus="if(value == '请输入机构名称'){value=''}" onblur="if(value == ''){value='请输入机构名称'}" />
								</span>
								<em><a id="searchbtn" href="#" class="searchA">搜索</a></em>
							</li>
						</ul>					
					</div>
	
					<div> 
					<c:forEach items="${lakeOrgDatabaseForm.memberInfoList}" var="res" varStatus="status">
						<div class="sjkliTabel"> 
							<h1>${res.memberFullName}&nbsp;&nbsp;<a href="#" onclick="openDialog()">地图</a></h1>
							<p><span>${res.memberLake}</span></p>
							<table>
								<tr>
									<th>通讯地址：</th>
									<td>${res.address}</td>
								</tr>
								<tr>
									<th>联系人：</th>
									<td>${res.contacts} </td>
								</tr>
								<tr>
									<th>联系方式：</th>
									<td>${res.tele}</td>
								</tr>
								<tr>
									<th>电子邮箱：</th>
									<td>${res.email}</td>
								</tr>								
							</table>
						</div>	
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


