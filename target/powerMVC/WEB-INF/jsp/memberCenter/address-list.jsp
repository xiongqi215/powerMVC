<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<style>
 .address-list{
 	width:960px;
 	padding:20px;
 	float:right;
 	min-height:500px;
 	border:1px solid #ddd;
 	background: #fff;
 }
</style>

<script type="text/javascript">

$.getJSON("${ctx}/member!getList.action", function(data){
	  $.each(data, function(i,item){
		  var tr=$("<tr/>");
		  tr.appendTo('#lakeList');
		  tr.append("<td>"+item.name+"</td>")
		  .append("<td>"+item.contacts+"</td>")
		  .append("<td>"+item.tele+"</td>")
		  .append("<td>"+item.email+"</td>")
		  .append("<td>"+item.address+"</td>");
	  });
	});

</script>



<div class="bgDiv">
	<div class="contCenter">
		<div class="locBlock">
			<a href="#" onclick="loadPage('home/homepage')">首页</a><em>&gt;</em><span>通讯录</span>
		</div>
		<div class="vip-container clearfix">
			<div class="address-list">
				<table class="hupo-list" width="100%" id="lakeList">
					<tr>
						<th width="20%">机构名称</th>
						<th width="20%">联系人</th>
						<th width="20%">联系方式</th>
						<th width="20%">电子邮箱</th>
						<th width="20%">通讯地址</th>
					</tr>

				</table>
<!-- 				<div class="pageChange"> -->
<!-- 					<table> -->
<!-- 						<tr> -->
<!-- 							<td><a href="" class="grayA">上一页</a> <a href="" -->
<!-- 								class="numAOn">1</a> <a href="" class="numA">2</a> <span -->
<!-- 								class="dd">...</span> <a href="" class="numA">3</a> <a href="" -->
<!-- 								class="textA">下一页</a> <span class="dny">共2页</span> <span>第</span> -->
<!-- 								<input type="text" class="dnyInp" /> <span>页</span> <input -->
<!-- 								type="button" value="GO" /></td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</div>




