<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
   
//    function search(){
// 	   var keyword=$("#keyWord").val();
// 	   $("#result").html("");
// 	   var document_list=$("<ul>");
// 	   $.get("${ctx}/knowledge!search.action", { keyword: keyword},
// 			   function(data){
// 		   $.each(data, function(idx, item) {
// 			   document_list.append(
// 					'<li><a href="${ctx}/sys/document-view.action" target="_blank">《' + item.title + '》</a><i>  作者：' + item.author
// 							+ '</i>');
// 		   });
// 		});
// 		$("#result").append(document_list)
		
// 		$("#result").append(
// 				"<p>本次搜索共找到<span class='import'>" + count
// 						+ "</span> 篇文章</p>");
// 	}

   
      function search(){
    	 
    	  var keyword=$("#keyWord").val();
    	  var docType = $('input[name="knowledgeForm.docType"]:checked ').val();
    	  if(keyword=="请输入搜索关键字"){
    		  keyword="";
    	  }
    	  
    	  loadAction("${ctx}/knowledge!search.action",{"knowledgeForm.keyWord":keyword,"knowledgeForm.docType":docType}); 
    	  
      }

</script>
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><span>知识库</span>
		</div>
	</div>
	<div class="zskssCont">
		<div class="searchZskss">
			<input type="text" class="zskssInp" value="请输入搜索关键字" onfocus="if(value == '请输入搜索关键字'){value=''}" onblur="if(value == ''){value='请输入搜索关键字'}"  id="keyWord" name="knowledgeForm.keyWord" />
			<input type="button" value="搜索一下" onclick="search()" />
			<div >
		  <span><input type="radio" name="knowledgeForm.docType"  value='' checked="checked" id='all'/><label for="all">全部</label></span>
		   <span><input type="radio" name="knowledgeForm.docType"  value='1' id='tj'//><label for="tj">科研成果 </label></span>
           <span><input type="radio" name="knowledgeForm.docType"  value='2'id='btj'/><label for="btj">政策法规</label></span>
		   <span><input type="radio" name="knowledgeForm.docType"  value='3'id='bt'/><label for="bt">生态旅游</label></span>
		</div>
		</div>
		
	</div>	
	<div class="result"></div>
</div>