<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
    <script type="text/javascript">
    
    </script>



	<!-- 图片滚动开始  data-interval="5000" 设置滚动间隔时间  -->
	<div class="scrollImgWap"> 
		<div id="scrollImg"  class="carousel slide " data-ride="carousel" data-interval="5000">
			<ol class="carousel-indicators">
				<li data-target="#scrollImg" data-slide-to="0" class="active"></li>
				<li data-target="#scrollImg" data-slide-to="1"></li>
				<li data-target="#scrollImg" data-slide-to="2"></li>
			</ol>	
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="images/scrollImg01.jpg" >
					<div class="carousel-caption">
						<div class="container"> 
							<div class="textWap"> 
								<h3>Superior lake</h3>
								<p>
									Alpine lake, fishermen friends to visit the site to see the weir, cage, such as different shrimp and crab fishing gear, enterprise technical management personnel exchanges forum and project implementation. Luoma Lake fishermen ......
								</p>				
							</div>					
						</div>
					</div>
				</div>
				<div class="item">
					<img src="images/scrollImg02.jpg">
					<div class="carousel-caption">
						<div class="container"> 
							<div class="textWap"> 
								<h3>Superior lake</h3>
								<p>
									Alpine lake, fishermen friends to visit the site to see the weir, cage, such as different shrimp and crab fishing gear, enterprise technical management personnel exchanges forum and project implementation. Luoma Lake fishermen ......
								</p>				
							</div>					
						</div>
					</div>
				</div>
				<div class="item">
					<img src="images/scrollImg03.jpg">
					<div class="carousel-caption">
						<div class="container"> 
							<div class="textWap"> 
								<h3>Superior lake</h3>
								<p>
									Alpine lake, fishermen friends to visit the site to see the weir, cage, such as different shrimp and crab fishing gear, enterprise technical management personnel exchanges forum and project implementation. Luoma Lake fishermen ......
								</p>				
							</div>					
						</div>
					</div>
				</div>			
			</div>
			<a class="left carousel-control" href="#scrollImg" role="button" data-slide="prev"></a>
			<a class="right carousel-control" href="#scrollImg" role="button" data-slide="next"></a>		
		</div>	
	</div>
	<!-- 图片滚动 结束-->

	<!-- content -->
	<div class="container">  
		<!-- 图标点击切换 开始 -->
		<div class="iconClickWap mt40"> 
			<!-- pc端  pad -->
			<div class="hidden-xs">
				<div id="iconClickWap" class="carousel slide" data-ride="carousel" data-interval="6000">
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="row"> 
								<div class="col-sm-4"> 
									<img src="images/scrollClick01.jpg"  />
									<h3> 
										<a href="" target="_blank">Lake basic data</a>
									</h3>
									<p> 
										Lake information database is mainly used for statistical global lakes, including the name, size, location (latitude and longitude coordinates), distribution, basin range ....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 
								<div class="col-sm-4"> 
									<img src="images/scrollClick02.jpg"  />
									<h3> 
										<a href="" target="_blank">Global Lake Research Organization Database</a>
									</h3>
									<p> 
										For the statistics of the world is to protect the basic research and application research institutions, including research center (station), monitoring center (point) ....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 	
								<div class="col-sm-4"> 
									<img src="images/scrollClick03.jpg"  />
									<h3> 
										<a href="" target="_blank">Lake protection technology achievement database</a>
									</h3>
									<p> 
										The advanced experience and demonstration project database of lake management, including wetland protection technology and patents, wetland ecological restoration etc....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 						
							</div>
						</div>
						<div class="item">
							<div class="row"> 
								<div class="col-sm-4"> 
									<img src="images/scrollClick01.jpg"  />
									<h3> 
										<a href="" target="_blank">Lake basic data</a>
									</h3>
									<p> 
										Lake information database is mainly used for statistical global lakes, including the name, size, location (latitude and longitude coordinates), distribution, basin range ....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 
								<div class="col-sm-4"> 
									<img src="images/scrollClick02.jpg"  />
									<h3> 
										<a href="" target="_blank">Global Lake Research Organization Database</a>
									</h3>
									<p> 
										For the statistics of the world is to protect the basic research and application research institutions, including research center (station), monitoring center (point) ....
									</p>
									<a href="" class="clickMore">CLICK MORE</a>
								</div> 	
								<div class="col-sm-4"> 
									<img src="images/scrollClick03.jpg"  />
									<h3> 
										<a href="" target="_blank">Lake protection technology achievement database</a>
									</h3>
									<p> 
										The advanced experience and demonstration project database of lake management, including wetland protection technology and patents, wetland ecological restoration etc....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 						
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#iconClickWap" role="button" data-slide="prev">
						<img src="images/leftIconG.jpg"  />
					</a>
					<a class="right carousel-control" href="#iconClickWap" role="button" data-slide="next">
						<img src="images/rightIconG.jpg"  />
					</a>					
				</div>	
			</div>
			<!-- 手机端 -->
			<div class="visible-xs">
				<div id="iconClickWap02" class="carousel slide" data-ride="carousel" data-interval="6000">
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="row"> 
								<div class="col-xs-12"> 
									<img src="images/scrollClick01.jpg"  />
									<h3> 
										<a href="" target="_blank">Lake basic data</a>
									</h3>
									<p> 
										Lake information database is mainly used for statistical global lakes, including the name, size, location (latitude and longitude coordinates), distribution, basin range ....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 
							</div>
						</div>
						<div class="item">
							<div class="row"> 
								<div class="col-xs-12"> 
									<img src="images/scrollClick02.jpg"  />
									<h3> 
										<a href="" target="_blank">Global Lake Research Organization Database</a>
									</h3>
									<p> 
										For the statistics of the world is to protect the basic research and application research institutions, including research center (station), monitoring center (point) ....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 								
							</div>
						</div>
						<div class="item">
							<div class="row"> 
								<div class="col-xs-12"> 
									<img src="images/scrollClick03.jpg"  />
									<h3> 
										<a href="" target="_blank">Lake protection technology achievement database</a>
									</h3>
									<p> 
										The advanced experience and demonstration project database of lake management, including wetland protection technology and patents, wetland ecological restoration etc....
									</p>
									<a href="" class="clickMore" target="_blank">CLICK MORE</a>
								</div> 									
							</div>
						</div>						
					</div>
					<a class="left carousel-control" href="#iconClickWap02" role="button" data-slide="prev">
						<img src="images/leftIconG.jpg"  />
					</a>
					<a class="right carousel-control" href="#iconClickWap02" role="button" data-slide="next">
						<img src="images/rightIconG.jpg"  />
					</a>					
				</div>	
			</div>			
		</div>
		<!-- 图标点击切换 结束 -->
	
		<!-- 通知 开始 -->
		<div class="pinkIndex mt50"> 
			<h3> 
				<a href="">
					Advanced experience and demonstration project database for Lake Management Advanced experience and demonstration project database for Lake Management  
				</a><span>2015-12-12</span>
			</h3>
			<p> 
				For the statistics of the world is to protect the basic research and application research institutions, including research center For the statistics of the world is to protect the basic research and application research institutions, including research center For the ......
			</p>
			<a href="" class="clickMore">NOTICE MORE</a>
		</div>
		<!-- 通知 结束 -->
		<!-- video 开始 -->
		<div class="videoWap mt50"> 
			<div class="videoCont"> 
				<div class="videoBlock">
						<!-- pc -->
					<div class="visible-lg visible-md"> 
						<video width="100%" height="350px" controls="controls">
							<source src="images/movie.ogg" type="video/ogg" />
							Your browser does not support the video tag.
						</video>					
					</div>	
							<!-- pad iphone -->
					<div class="visible-sm visible-xs"> 
						<video width="100%" controls="controls">
							<source src="images/movie.ogg" type="video/ogg" />
							Your browser does not support the video tag.
						</video>					
					</div>
				</div>
				<div class="videoNews">
					<h3>News</h3>
					<ul class="newVList">
						<li> 
							<p><a href="" target="_blank">
									Advanced experience and demonstration project database for Lake Management
							</a></p>
							<div>2015-12-12</div>
						</li>
						<li> 
							<p><a href="" target="_blank">
									Advanced experience and demonstration project database for Lake Management
							</a></p>
							<div>2015-12-12</div>
						</li>						
					</ul>
					<div class="textC"> 
						<a href=""  target="_blank" class="videoMore">NEWS MORE</a>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- video 结束 -->
		
		<!-- tab切换 开始 -->
			<!-- 其中 a 标签的href  aria-controls 和切换内容标签的 的id  应一样  -->
		<div class="mainTab mt50">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#latestData" aria-controls="latestData" role="tab" data-toggle="tab">Latest data</a></li>
				<li role="presentation"><a href="#hotData" aria-controls="hotData" role="tab" data-toggle="tab">Hot data</a></li>
				<li role="presentation"><a href="#rcmdData" aria-controls="rcmdData" role="tab" data-toggle="tab">Recommended data</a></li>
			</ul>
			<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="latestData">
				<!-- 首页数据集列表页面 -->
				<c:forEach var="item" items="${latestDataSet}">

					<div class="col-md-6 mt40 tabImgMain">
						<a href=""><img
							src='${ctx}/stream.do?filePath=${item.lakeDatasetPic}' /></a>
						<div class="info">
							<h3>
								<a href="">${item.lakeDatasetTitle }</a>
							</h3>
							<div class="desc">${item.lakeDatasetDesc}</div>
							<a href="" target="_blank" class="clickMore">CLICK MORE</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="hotData">
					<c:forEach var="item" items="${hotDataSet}">

					<div class="col-md-6 mt40 tabImgMain">
						<a href=""><img
							src='${ctx}/stream.do?filePath=${item.lakeDatasetPic}' /></a>
						<div class="info">
							<h3>
								<a href="">${item.lakeDatasetTitle }</a>
							</h3>
							<div class="desc">${item.lakeDatasetDesc}</div>
							<a href="" target="_blank" class="clickMore">CLICK MORE</a>
						</div>
					</div>
				</c:forEach>
				</div>
				<div role="tabpanel" class="tab-pane" id="rcmdData">
					<c:forEach var="item" items="${rcmDataSet}">

					<div class="col-md-6 mt40 tabImgMain">
						<a href=""><img
							src='${ctx}/stream.do?filePath=${item.lakeDatasetPic}' /></a>
						<div class="info">
							<h3>
								<a href="">${item.lakeDatasetTitle }</a>
							</h3>
							<div class="desc">${item.lakeDatasetDesc}</div>
							<a href="" target="_blank" class="clickMore">CLICK MORE</a>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
		<!-- tab切换 结束 -->
	</div>
