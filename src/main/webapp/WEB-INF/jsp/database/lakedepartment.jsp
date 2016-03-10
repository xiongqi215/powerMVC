<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript">
$(function(){
	$.post("member!getAll.action",function(data){
		
	});
	
	$("#info").html("")
	
});


</script>

<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><span>全球湖泊研究机构数据库</span>
		</div>
		<div class="clearfix"> 
			<div class="leftColumn"> 
				<div class="headTitColumn">数据库</div>
				<div class="columnLink"> 
					<a href="" >全球湖泊基础数据库</a>
					<a href="">全球湖泊研究机构数据库 </a>
					<a href="" class="on">湖泊生态监测数据库 </a>
					<a href="">湖泊水质监测数据库 </a>
					<a href="">湖泊科学应用成果数据库</a>
				</div>
			</div>
			<div class="rightColumn whiteBlock"> 
				<div class="padding20-25"> 
					<div class="clearfix"> 
						<ul class="searchUl">
							<li>
								<i>机构名称：</i>
								<span>
									<input type="text" value="请输入机构名称"  class="jgmcInp" />
								</span>
								<em><a href="" class="searchA">搜索</a></em>
							</li>
						</ul>					
					</div>
	
					<div id="info"> 
						<div class="sjkliTabel"> 
							<h1>美国研究院（美国）</h1>
							<p><span>研究湖泊：苏必利尔湖</span></p>
							<table>
								<tr>
									<th>通讯地址：</th>
									<td>The White House,1600 Pennsylvania Avenue NW,Washington DC 20500</td>
								</tr>
								<tr>
									<th>联系人：</th>
									<td>Hussein Obama <br />Hussein Obama </td>
								</tr>
								<tr>
									<th>联系方式：</th>
									<td>202-456-1414</td>
								</tr>
								<tr>
									<th>电子邮箱：</th>
									<td>xxx@abc.us</td>
								</tr>								
							</table>
						</div>
						<div class="sjkliTabel"> 
							<h1>江西省科学院（中国）</h1>
							<p><span>研究湖泊：鄱阳湖</span></p>
							<table>
								<tr>
									<th>通讯地址：</th>
									<td>江西省南昌市高新大街火炬大道681号</td>
								</tr>
								<tr>
									<th>联系人：</th>
									<td>张三</td>
								</tr>
								<tr>
									<th>联系方式：</th>
									<td>0791-88545555</td>
								</tr>
								<tr>
									<th>电子邮箱：</th>
									<td>xxx@abc.cn</td>
								</tr>								
							</table>
						</div>						
						<div class="sjkliTabel"> 
							<h1>江西省科学院（中国）</h1>
							<p><span>研究湖泊：鄱阳湖</span></p>
							<table>
								<tr>
									<th>通讯地址：</th>
									<td>江西省南昌市高新大街火炬大道681号</td>
								</tr>
								<tr>
									<th>联系人：</th>
									<td>张三</td>
								</tr>
								<tr>
									<th>联系方式：</th>
									<td>0791-88545555</td>
								</tr>
								<tr>
									<th>电子邮箱：</th>
									<td>xxx@abc.cn</td>
								</tr>								
							</table>
						</div>							
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


<script type="text/javascript"> 
$(function(){
	$('.jgmcInp').bind('focus',function(){
		var val = $(this).val();
		if( $(this).val() == '请输入机构名称' ){
			$(this).val('');
		}
	});
	$('.jgmcInp').bind('blur',function(){
		var val = $(this).val();
		if( $(this).val() == '' ){
			$(this).val('请输入机构名称');
		}
	});	
});
</script>