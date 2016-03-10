<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>世界生命湖泊应用科技信息平台</title>
    <%@ include file="/common/commonIndex.jsp"%>
</head>
<body>

<!-- cont -->
<div class="bgDiv">
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="">首页</a><em>&gt;</em><a href="">数据库</a><em>&gt;</em><a href="">全球湖泊基本数据库</a><em>&gt;</em><span>${lakeDetailForm.lake.lakename}</span>
		</div>		
		<div class="whiteBlock padding10 clearfix"> 
			<div class="lPicPhxqy"> 
				<img src="images/phxqy01.jpg"  />
				<span></span><em>${lakeDetailForm.lake.lakename}</em>
			</div>
			<div class="rUlPhxqy"> 
				<table class="phxqTable">
					<tr><th>湖泊类型：</th><td>构造湖</td></tr>
					<tr><th>经&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>东经115°47′至116°45′</td></tr>
					<tr><th>纬&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>北纬28°22′至29°45′</td></tr>
					<tr><th>湖泊岸线：</th><td>1800公里</td></tr>
					<tr><th>湖泊面积：</th><td>3,150k㎡</td></tr>
					<tr><th>体&nbsp;&nbsp;&nbsp;&nbsp;积：</th><td>117亿立方米</td></tr>
					<tr><th>长&nbsp;&nbsp;&nbsp;&nbsp;度：</th><td>133公里</td></tr>
					<tr><th>宽&nbsp;&nbsp;&nbsp;&nbsp;带：</th><td>74公里</td></tr>
					<tr><th>流域范围：</th><td>汇集赣江、修水、鄱江（饶河）、信江、抚河等水经九江市湖口县城注入长江</td></tr>
				</table>
			</div>
		</div>
		<div class="marginTop30 whiteBlock"> 
			<div class="blueBTit"><span>湖泊监测数据</span></div>
			<div class="paddingTop20"> 
				<ul class="navPhxqy">
					<li class="on">水分因子</li>
					<li>土壤因子</li>
					<li>大气因子</li>
					<li>生物因子</li>
					<li>水体因子</li>
					<li>水质检测</li>
				</ul>
				<div class="changeHpxqy">
					<div class="imgWapHpxq clearfix"> 
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy02.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy03.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy04.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>	
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy05.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy06.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy07.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>						
					</div>
					<div class="pageChange"> 
						<a href="" class="grayA">上一页</a>
						<a href="" class="numAOn">1</a>
						<a href="" class="numA">2</a>
						<a href="" class="textA">下一页</a>
					</div>				
				</div>
				<div class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy02.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy03.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy04.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>	
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy05.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy06.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy07.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>						
					</div>
					<div class="pageChange"> 
						<a href="" class="grayA">上一页</a>
						<a href="" class="numAOn">1</a>
						<a href="" class="numA">2</a>
						<a href="" class="textA">下一页</a>
					</div>				
				</div>
				<div class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy02.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy03.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy04.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>	
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy05.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy06.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy07.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>						
					</div>
					<div class="pageChange"> 
						<a href="" class="grayA">上一页</a>
						<a href="" class="numAOn">1</a>
						<a href="" class="numA">2</a>
						<a href="" class="textA">下一页</a>
					</div>				
				</div>
				<div class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy02.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy03.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy04.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>	
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy05.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy06.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy07.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>						
					</div>
					<div class="pageChange"> 
						<a href="" class="grayA">上一页</a>
						<a href="" class="numAOn">1</a>
						<a href="" class="numA">2</a>
						<a href="" class="textA">下一页</a>
					</div>				
				</div>
				<div class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy02.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy03.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy04.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>	
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy05.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy06.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy07.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>						
					</div>
					<div class="pageChange"> 
						<a href="" class="grayA">上一页</a>
						<a href="" class="numAOn">1</a>
						<a href="" class="numA">2</a>
						<a href="" class="textA">下一页</a>
					</div>				
				</div>
				<div class="changeHpxqy hide">
					<div class="imgWapHpxq clearfix"> 
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy02.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy03.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy04.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>	
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy05.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy06.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>
						<ul class="imglistUl">
							<li class="imgLi">
								<a href="">
									<img src="images/hpxqy07.jpg" />
									<span></span><em>2015年水分因子监测数据包</em>							
								</a>
							</li>
							<li class="textLi"> 
								<a href="">
									该数据集是在中国湖泊志（王苏民，窦鸿身主编）中第二篇中国湖泊分论，在各湖区各省市湖泊记录的基础上，并结合近期湖泊调查的资料及湖泊代码本等相关资..
								</a>
							</li>
						</ul>						
					</div>
					<div class="pageChange"> 
						<a href="" class="grayA">上一页</a>
						<a href="" class="numAOn">1</a>
						<a href="" class="numA">2</a>
						<a href="" class="textA">下一页</a>
					</div>				
				</div>
			</div>
		</div>
	</div>
</div>


<!--footer-->
<div class="link">
    <div class="link-wrap">
        <span>友情链接：</span><a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息据据库</a>|<a href="#">研究组织数据库</a>|
    </div>
</div>
<div class="footer">
    版权所有
</div>
<script type="text/javascript"> 
	//湖泊监测数据  切换
	$('.navPhxqy li').bind('mouseover',function(){
		var num = $(this).index();
		var disObj = $('.changeHpxqy') ;
		$(this).addClass('on').siblings('li').removeClass('on');
		
		$(disObj).eq(num).removeClass('hide').siblings('.changeHpxqy').addClass('hide');
	});
</script>

</body>
</html>