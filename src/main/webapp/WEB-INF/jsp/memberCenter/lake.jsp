<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>


<script type="text/javascript">

// $.getJSON("${ctx}/lake!list.action", function(data){
// 	  $.each(data, function(i,item){
// 		  var tr=$("<tr/>");
// 		  tr.appendTo('#lakeList');
// 		  tr.append("<td>"+item.lakename+"</td>")
// 		  .append("<td>"+item.lakearea+"</td>")
// 		  .append("<td>"+item.latitude+"</td>")
// 		  .append("<td>"+item.longitude+"</td>")
// 		  .append("<td>"+item.volume+"</td>")
// 		  .append("<td>"+item.lakeLength+"</td>")
// 		  .append("<td>"+item.lakeWidth+"</td>")
// 		  .append("<td><a href='#' onclick=queryDataset("+item.id+")>数据集</a>|<a href='#' onclick=openDialog("+item.id+")>修改</a>|<a href='#' onclick='del("+item.id+")'>删除</a></td>");
// 	  });
// 	});



function openDialog(id){
	dialog('湖泊基本信息','${ctx}/lake!input.action?lakeForm.lakeId='+id,function(){
		
		 $('#lakeForm').ajaxSubmit({
			    url: '${ctx}/lake!save.action',
			    dataType:'json',
			    success: function(data) {
			    	alert(data.content);
			    	if(data.code=='I000000'){
			    		closeDialog();
				    	loadPage('memberCenter/lake');
			    	}
			    	
			    }
			  });
		 
// 		 $('#lakeForm').submit();
	});
}


function del(id){
	$.post("${ctx}/lake!delete.action",{'lakeForm.lakeId':id},function(data){
		alert(data.content);
    	loadPage('memberCenter/lake');
	  },'json');
}

function queryDataset(id){
	  
	  $("#main").load("${ctx}/dataset.action?datasetForm.dataset.lakeId="+id);
	  
	  
}

</script>



<div class="bgDiv">
	<div class="contCenter">
		<div class="locBlock">
			<a href="#" onclick="loadPage('home/homepage')">首页</a><em>&gt;</em><a
				href="#" onclick="loadPage('memberCenter/member-index')">会员中心</a><em>&gt;</em><span>湖泊管理</span>
		</div>
		<div class="vip-container clearfix">
			<div class="leftColumn">
				<div class="headTitColumn">会员中心</div>
				<div class="columnLink">
					<a href="#"
						onclick="loadAction('${ctx}/web/member-input!information.action')">机构信息</a>
					<a href="#" class="on" onclick="loadPage('memberCenter/lake')">湖泊管理
					</a>
				</div>
			</div>
			<div class="vip-content">
				<div class="addDiv">
					<a class="hupo-add" href="#" onclick="openDialog()">+新增</a>
				</div>
				<table class="hupo-list" width="100%" id="lakeList">
					<tr>
						<th width="12%">名称</th>
						<th width="12%">面积</th>
						<th width="12%">纬度</th>
						<th width="12%">经度</th>
						<th width="12%">容积</th>
						<th width="10%">长度</th>
						<th width="10%">宽度</th>
						<th width="20%">操作</th>
					</tr>
					<c:forEach var="lake" items="${list}">
					<tr>
						<td>${lake.lakename}</td>
						<td>${lake.lakearea}</td>
						<td>${lake.latitude}</td>
						<td>${lake.longitude}</td>
						<td>${lake.volume}</td>
						<td>${lake.lakeLength}</td>
						<td>${lake.lakeWidth}</td>
						<td><a href='#' onclick='queryDataset(${lake.id})'>数据集</a>|<a
							href='#' onclick='openDialog(${lake.id})'>修改</a>|<a href='#'
							onclick='del(${lake.id})'>删除</a></td>
							</tr>
					</c:forEach>
					
				</table>
<!-- 								<div class="pageChange"> -->
<!-- 									<table> -->
<!-- 										<tr> -->
<!-- 											<td><a href="" class="grayA">上一页</a> <a href="" -->
<!-- 												class="numAOn">1</a> <a href="" class="numA">2</a> <span -->
<!-- 												class="dd">...</span> <a href="" class="numA">3</a> <a href="" -->
<!-- 												class="textA">下一页</a> <span class="dny">共2页</span> <span>第</span> -->
<!-- 												<input type="text" class="dnyInp" /> <span>页</span> <input -->
<!-- 												type="button" value="GO" /></td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->
<p:page pageSize="${ pageSize}" totalCount="${totalCount }"/>
			</div>
		</div>
	</div>
</div>




