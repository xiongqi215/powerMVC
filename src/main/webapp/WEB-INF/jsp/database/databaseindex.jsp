<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ include file="/common/taglibs.jsp"%>

    <script type="text/javascript">
    $(function(){
    	var country=null;
    	var lakeinfo = null;
    	$.post("lake!countryList.action",function(data){
//     		
                $.each(data, function(i,item){
                	if(item.nameCn=='中国'){
                	$("<option/>").val(item.id).text(item.nameCn).attr("selected",true).appendTo($("#country"));
                	}else{
                		$("<option/>").val(item.id).text(item.nameCn).appendTo($("#country"));
                	}
                });

          
    	});
    	$.post("lake!lakeList.action",function(data){
    		
            $.each(data, function(i,item){
            	$("<option/>").val(item.id).text(item.lakename).appendTo($("#lakeinfo"));
            });
    	});
    	//loadFrame('${ctx}/lake-map.action?lake_id=268');
    });
    
    	function dspMap(lake){
    		if(lake==undefined || lake==''){
    			document.getElementById("lake_map").src="${ctx}/lake-map.action?lake_id=\"268\"&lake_name=\"鄱阳湖\"";
    		}
    		else{
    			document.getElementById("lake_map").src="${ctx}/lake-map.action?lake_id="+lake.value+"&lake_name="+lake.name;
    		}
    		
    		
    	}
    
    </script>


<!-- cont -->
<div class="bgDiv"> 
	<div class="contCenter"> 
		<div class="locBlock"> 
			<a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('database/database')" >数据库</a><em>&gt;</em><span>全球湖泊基本数据库</span>
		</div>
	
		<div class="borderBlock clearfix">
			<ul class="searchUl">
				<li>
					<i>国家 ：</i>
					<span>
						<select id="country">
							
						</select>
					</span>
				</li>
				<li>
					<i>湖泊：</i>
					<span>
						<select id="lakeinfo" onchange="javascript:dspMap(this)">
						</select>
					</span>
				</li>				
			</ul>
		</div>
		<div class="mapBlock"> 
			<iframe id="lake_map" src="${ctx}/lake-map.action?lake_id=268" width="100%" height="700" frameborder="0" scrolling="no" style="margin:0px;">
			
			</iframe>
			
		</div>
	</div>
</div>

