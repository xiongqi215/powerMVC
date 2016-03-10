<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function showKnowledge(docType){
	  loadAction("${ctx}/knowledge!search.action",{"knowledgeForm.docType":docType}); 
}

</script>
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><span>全球湖泊研究机构数据库</span>
		</div>
		<div class="sjrkPage"> 
			<img src="${ctx}/images/sjrkImg.jpg" usemap="#sjrky"  />
			<map name="sjrky">
				<area shape="circle" coords="374,136,87.5" onclick="loadPage('database/databaseindex')" href="#" alt="全球湖泊基础数据库" />
				<area shape="circle" coords="578,88,77.5" href="#" onclick="showKnowledge('3')" alt="湖泊生态旅游资源库" />
				<area shape="circle" coords="760,177,82" href="#" onclick="loadAction('${ctx}/lake-monitor-database.action?databaseType=2')" alt="水质监测数据库" />
				<area shape="circle" coords="785,370,90" href="#" onclick="showKnowledge('2')" alt="湖泊保护政策法规信息库" />
				<area shape="circle" coords="615,537,106" href="#" onclick="showKnowledge('1')" alt="湖泊科学应用成果数据库" />
				<area shape="circle" coords="365,506,99.5" href="#" onclick="loadAction('${ctx}/lake-monitor-database.action?databaseType=1')" alt="湖泊生态监测数据库" />
				<area shape="circle" coords="245,320,95" onclick="loadAction('${ctx}/lake-org-database.action')" href="#" alt="全球湖泊研究机构数据库" />
			</map>			
		</div>
	</div>
</div>

