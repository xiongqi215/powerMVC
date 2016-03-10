<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function search(){
	  
	  var keyword=$("#keyWord").val();
	  if(keyword=='请输入搜索关键字'){
		  keyword="";
	  }
	  var docType = $('input[name="knowledgeForm.docType"]:checked ').val();
	  $("#main").load("${ctx}/knowledge!search.action",{"knowledgeForm.keyWord":keyword,"knowledgeForm.docType":docType});
}

$(function(){
	
	var docType="${knowledgeForm.docType}";
	$('input[name="knowledgeForm.docType"]').each(function(){
	   if( $(this).val()==docType){
		   $(this).attr("checked",'checked');
	   }
	});
	
	
});
</script>
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="">首页</a><em>&gt;</em><span>搜索引擎</span>
		</div>
	</div>
	<div class="ssjgCont">
		<div class="searchZskss">
			<input type="text" class="zskssInp" id="keyWord"  
			onfocus="if(value == '请输入搜索关键字'){value=''}" onblur="if(value == ''){value='请输入搜索关键字'}" 
			<c:if test="${ empty  knowledgeForm.keyWord}">
			 value="请输入搜索关键字" 
			 </c:if>
			 <c:if test="${ not empty  knowledgeForm.keyWord}">
			 value="${knowledgeForm.keyWord }" 
			 </c:if>
			/>
			 
				<input type="button" value="搜索一下" onclick="search()"/>
				
		 <div >
		  
		</div> 
		</div>
		<div class="ssjgInfo"> 
			<div class="ssjgdataNum">共找到<em>${knowledgeForm.count }</em>条结果
		   <span><input type="radio" name="knowledgeForm.docType"  value='' checked="checked" id='all'/><label for="all">全部</label></span>
		   <span><input type="radio" name="knowledgeForm.docType"  value='1' id='tj'//><label for="tj">科研成果 </label></span>
           <span><input type="radio" name="knowledgeForm.docType"  value='2'id='btj'/><label for="btj">政策法规</label></span>
		   <span><input type="radio" name="knowledgeForm.docType"  value='3'id='bt'/><label for="bt">生态旅游</label></span>
			</div>
			
			<c:forEach items="${knowledgeForm.documentList}" var="item">
			<ul class="ssjgUl">
<!-- 				<li><a href="">河北省消费<span>市</span>场回暖态势明显</a></li> -->
               <li><a href='knowledge!view.action?knowledgeForm.doc.id=${item.id}' target="_blank">${item.docName }</a></li>
				<li> 
					${item.docContent }
				</li>
				<li> 
					发布时间：${item.publishDate }  <a href="${ctx}/fileDownload?filepath=${item.docPath}&filename=${item.fullFileName}">下载</a>
				</li>
			</ul>
			</c:forEach>
<!-- 			<div class="pageChange">  -->
<!-- 				<table><tr><td>  -->
<!-- 					<a href="" class="grayA">上一页</a> -->
<!-- 					<a href="" class="numAOn">1</a> -->
<!-- 					<a href="" class="numA">2</a> -->
<!-- 					<span class="dd">...</span> -->
<!-- 					<a href="" class="numA">3</a> -->
<!-- 					<a href="" class="textA">下一页</a> -->
<!-- 					<span class="dny">共2页</span> -->
<!-- 					<span>第</span> -->
<!-- 					<input type="text" class="dnyInp" /> -->
<!-- 					<span>页</span> -->
<!-- 					<input type="button" value="GO" />								 -->
<!-- 				</td></tr></table> -->
<!-- 			</div>			 -->
		</div>
	</div>	
</div>