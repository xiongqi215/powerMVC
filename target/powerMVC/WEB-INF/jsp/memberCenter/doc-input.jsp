<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function loadDocType( id){
	$.getJSON("${ctx}/json/docType.json", function(data){
		  $.each(data, function(i,item){
			  
			  if(item.id==Number(id)){
				 
				  $("<option/>").val(item.value).text(item.text).attr("selected",true).appendTo($("#docType"));
			  }else{
				  $("<option/>").val(item.value).text(item.text).appendTo($("#docType"));
			  }
			  
			  
		  });
		});
}

loadDocType("${knowledgeForm.doc.docType}");
$(function(){
	
	var isOpen="${knowledgeForm.doc.isOpen}";
		$('input[name="knowledgeForm.doc.isOpen"]').each(function(){
		   if( $(this).val()==isOpen){
			   $(this).attr("checked",'checked');
		   }
		});
	
	
	var isRecommend="${knowledgeForm.doc.isRecommend}";
		$('input[name="knowledgeForm.doc.isRecommend"]').each(function(){
		   if( $(this).val()==isRecommend){
			   $(this).attr("checked",'checked');
		   }
		});
	
	
})

</script>

<form method="post" enctype="multipart/form-data"  id="docForm">
<input type="hidden" name="knowledgeForm.doc.lakeId" value="${knowledgeForm.lakeId}"/>
<input type="hidden" name="knowledgeForm.doc.id" value="${knowledgeForm.doc.id}"/>
<table class="openTable">
<tr>
    <th>文章类型</th>
    <td><select class="openSelect w230" id="docType" name="knowledgeForm.doc.docType">
    </select>
    </td>
</tr>
<tr>
    <th width="95">标题</th>
    <td width="185"><input type="text" class="openInput w575" name="knowledgeForm.doc.docName"  value="${knowledgeForm.doc.docName}"/></td>
</tr>
<tr>
    <th width="95">作者</th>
    <td width="185"><input type="text" class="openInput w575" name="knowledgeForm.doc.docAuthor"  value="${ knowledgeForm.doc.docAuthor}"/></td>
</tr>

<tr>
    <th>简介</th>
    <td><textarea name="knowledgeForm.doc.docContent"  class="openTextarea w575">${knowledgeForm.doc.docContent}</textarea></td>
</tr>
<tr>
    <th>文章图片</th>
    <td><input type="file" name="knowledgeForm.docPic"  /></td>
</tr>
<tr>
    <th>文件</th>
    <td><input type="file" name="knowledgeForm.docFile"/></td>
</tr>
<tr>
    <th>公布级别</th>
    <td>
        <span><input type="radio" name="knowledgeForm.doc.isOpen" class="开放" id="kf" checked value='1'/><label for="kf">开放</label></span>
        <span><input type="radio" name="knowledgeForm.doc.isOpen"  value='0'/><label for="bkf">不开放</label></span>
    </td>
</tr>
<tr>
    <th>是否推荐</th>
    <td>
        <span><input type="radio" name="knowledgeForm.doc.isRecommend"  id="tj" class="推荐" checked  value='1'/><label for="tj">推荐</label></span>
        <span><input type="radio" name="knowledgeForm.doc.isRecommend"  id="btj" class="不推荐"  value='0'/><label for="btj">不推荐</label></span>
    </td>
</tr>
</table>
</form>