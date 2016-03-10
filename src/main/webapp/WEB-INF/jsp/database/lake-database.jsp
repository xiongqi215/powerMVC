<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/doctype.jsp"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>世界生命湖泊应用科技信息平台--地图展示页</title>
    <%@ include file="/common/commonIndex.jsp"%>
    <script type="text/javascript">
    	function dspMap(lake){
    		if(lake==undefined || lake==''){
    			lake.value = 'Poyang';
    		}
    		document.getElementById("lake_map").src="${ctx}/lake-map.action?lake_name="+lake.value;
    		
    	}
    
    
    </script>
</head>
<body>

<!-- cont -->
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><span>全球湖泊基本数据库</span>
		</div>
		<div class="borderBlock clearfix">
			<ul class="searchUl">
				<li>
					<i>国家：</i>
					<span>
						<select>
							<option value="">中国</option>
							<option value="">中国</option>
							<option value="">中国</option>
						</select>
					</span>
				</li>
				<li>
					<i>湖泊：</i>
					<span>
						<select onchange="javascript:dspMap(this)">
							<option value="Poyang">鄱阳湖</option>
							<option value="Dongting">洞庭湖</option>
							<option value="Taihu">太 湖</option>
						</select>
					</span>
				</li>				
			</ul>
		</div>
		<div class="mapBlock"> 
			<iframe id="lake_map" src="${ctx}/lake-map.action?lake_name=Poyang" width="100%" height="700" frameborder="0" scrolling="no" style="margin:0px;">
			
			</iframe>
			
		</div>
	</div>
</div>

<!-- foot -->
<div class="link">
    <div class="link-wrap">
        <span>友情链接：</span><a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息数据库</a>|<a href="#">研究组织数据库</a>|<a href="#">基本信息据据库</a>|<a href="#">研究组织数据库</a>|
    </div>
</div>

<div class="footer">
    版权所有
</div>
</body>
</html>