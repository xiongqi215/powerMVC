<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
    <script type="text/javascript">
    
    $(function(){
    	var lef = $(".icoList").width()/1000;
    	$(".icoList").css("margin-top","-"+lef+"px").show();
    	
    	var timer;
    	
    	$(".icoList li a").click(function(){
    		var index = $(".icoList li a").index($(this));
    		changeImg(index);
    	}).eq(0).click();
    	
    	function changeImg(index)
    	{
    		$(".icoList li a").removeClass("cur").eq(index).addClass("cur");
    		$(".indexBanner .banner").fadeOut(600).eq(index).fadeIn(400);
    	}
    	
    	$(".indexBanner .banner , indexBanner .icoList").hover(function(){
    		clearInterval(timer);	
    	},function(){
    		timer = setInterval(function(){
    		if (!$(".indexBanner .banner").is(":animated"))
    		{
    			var index = $(".icoList li a").index($(".icoList li a.cur"));
    			if (index < $(".icoList li").length-1)
    				index++;
    			else
    				index=0;
    			changeImg(index);		
    		}
    		
    	},4000);
    	});
    	
    	timer = setInterval(function(){
    		if (!$(".indexBanner .banner").is(":animated"))
    		{
    			var index = $(".icoList li a").index($(".icoList li a.cur"));
    			if (index < $(".icoList li").length-1)
    				index++;
    			else
    				index=0;
    			changeImg(index);		
    		}
    		
    	},4000);
    });



    $(function(){
    	
    	$(".listBody ul li a").click(function(){
    		var $obj = $(".showBody");
    		if ($obj.css("display")=="none")
    		{
    			$obj.slideDown();
    			$(".listBody ul li a .indexIco").attr("src","../images/channel/ico.gif");
    			$(".hideBody").fadeIn();	
    		}
    		else
    		{
    			$(".hideBody").hide();	
    			$(".listBody ul li a .indexIco").attr("src","../images/channel/ico1.gif");
    			$obj.slideUp();
    				
    		}	
    	});
    	
    	$(".hideBody").click(function(){
    		$(this).hide();	
    		$(".showBody").slideUp();
    	});
    		
    });




    $(function(){
    	
    	$(".listBody ul li a").click(function(){
    		var $obj = $(".showBody");
    		if ($obj.css("display")=="none")
    		{
    			$obj.slideDown();
    			$(".listBody ul li a .indexIco").attr("src","../images/channel/ico.gif");
    			$(".hideBody").fadeIn();	
    		}
    		else
    		{
    			$(".hideBody").hide();	
    			$(".listBody ul li a .indexIco").attr("src","../images/channel/ico1.gif");
    			$obj.slideUp();
    				
    		}	
    	});
    	
    	$(".hideBody").click(function(){
    		$(this).hide();	
    		$(".showBody").slideUp();
    	});
    		
    });

    
    var homepage={
            elements:{
              div:{
                "lakeLatestDataset":"#lakeLatestDataset",
                "lakeHotDataset" : "#lakeHotDataset",
                "lakeRecommendDataset":"#lakeRecommendDataset",
                "lakeRecommendDatasetUl":"#lakeRecommendDatasetUl"
              }
            },
            params:{},
            init:function(){
              homepage.initLatestDataset();
              homepage.initHotDataset();
              homepage.initRecomendDataset();
            },
            initLatestDataset:function(){
              $.getJSON("${ctx}/dataset/loadLatestDataset.do", function(data){
                  $.each(data, function(i,item){
                      var div=$("<div id='item"+i+"' class='data-first'>");
                      div.appendTo(homepage.elements.div["lakeLatestDataset"]);
                      var childDiv = $("<div class='dataFirst-pic'>");
                      childDiv.appendTo(div);
                     // onclick="loadAction('${ctx}/lake-database-detail.action?dataId='+${res.id})"
                    	  //file-redirect.action?toPage=database/lakedetail&lakeId="+item.lakeId+"
                      var childAlink = $("<a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' > ");
                      childAlink.appendTo(childDiv);
                      childAlink.append("<img src='${ctx}/stream.do?filePath="+item.lakeDatasetPic+"' width='316' height='170' alt=''/>")
                      .append("<div class='news-pic-bg'></div>")
                      .append("<div class='news-pic-text'>"+item.lakeDatasetTitle+"</div></a></div>");
                      div.append("<p><a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' >"+item.lakeDatasetDesc+"</a></p>");
                  });
                 
              });
            },
            initHotDataset:function(){
              $.getJSON("${ctx}/web/homepage!loadHotDataset.action", function(data){
              $.each(data, function(i,item){
                  var li=$("<li>");
                  li.appendTo(homepage.elements.div["lakeHotDataset"]);
                  li.append("<a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' ><img src='${ctx}/file-view!view.action?filePath="+item.lakeDatasetPic+"' width='200' height='110' alt=''/></a>")
                  .append("<a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' ><h3>"+item.lakeDatasetTitle+"</h3></a>")
                  .append("<p><a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' >"+item.lakeDatasetDesc+"</a></p>");
                });
             
            });
            },
            initRecomendDataset:function(){
              $.getJSON("${ctx}/web/homepage!loadRecommendDataset.action", function(data){
              $.each(data, function(i,item){
                if(i==0){
                    var div=$("<div id='item"+i+"' class='dataFirst-pic'>");
                    var p = $("<p><a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' >"+item.lakeDatasetDesc+"</a></p>");
                      div.appendTo(homepage.elements.div["lakeRecommendDataset"]);
                      p.appendTo(homepage.elements.div["lakeRecommendDataset"]);
                      var childAlink = $("<a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' >");
                      childAlink.appendTo(div);
                      childAlink.append("<img src='${ctx}/file-view!view.action?filePath="+item.lakeDatasetPic+"' width='316' height='170' alt=''/>")
                      .append("<div class='news-pic-bg'></div>")
                      .append("<div class='news-pic-text'>"+item.lakeDatasetTitle+"</div></a></div>");
                }
                else{
                  var li=$("<li>");
                    li.appendTo(homepage.elements.div["lakeRecommendDatasetUl"]);
                    li.append("<a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' ><img src='${ctx}/file-view!view.action?filePath="+item.lakeDatasetPic+"' width='200' height='110' alt=''/></a>")
                    .append("<a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' ><h3>"+item.lakeDatasetTitle+"</h3></a>")
                    .append("<p><a href='#' onclick='loadAction(\"${ctx}/lake-database-detail.action?dataId="+item.lakeId+"\")' >"+item.lakeDatasetDesc+"</a></p>");
                }
                });
             
            });
            }
            
        };
    	$(function(){
    		homepage.init();
    		 $('.data-nav li').each(function(i){
    		        $(this).hover(function(){
    		            $(this).addClass('active').siblings().removeClass('active');//选中样式
    		            $('.data-wrap:eq('+i+')').show().siblings('.data-wrap').hide();
    		            $('.more:eq('+i+')').show().siblings('.more').hide();
    		        })
    		});
    	});
    </script>

<div class="banner-wrap">

    <div class="indexBanner">
        <div class="banner-title">
            <ul class="icoList">
                <li><a href="javascript:void 0;"></a></li>
                <li><a href="javascript:void 0;"></a></li>
            </ul>
        </div>
        <a href="#" class="banner" style="background-image:url(${ctx}/images/banner1.jpg);"></a>
        <a href="#" class="banner" style="background-image:url(${ctx}/images/banner2.jpg);"></a>
    </div>
</div>
<div class="news">
    <div class="news-container">
        <div class="news-pic">
            <a href="#">
                <img src="images/p_1.jpg" width="446" height="290" alt="" onclick="loadPage('news/newsdetail')"/>
                <div class="news-pic-bg"></div>
                <div class="news-pic-text">世界最大湖泊面临来自人类和环境的双重挑战</div>
            </a>
        </div>
        <div class="news-title">
            <div class="news-title-top">
                <span><fmt:message key="nav.news" /></span>
                <a class="more" href="#" onclick="loadPage('news/newsindex')">+<fmt:message key="moreinfo"/></a>
            </div>
            <div class="news-title-list">
                <ul>
                    <li>
                        <a onclick="loadPage('news/newsdetail')" href="#"><h3>世界最大湖泊面临来自人类和环境的双重挑战</h3></a>
                        <p>2015-10-29</p>
                        <p><a onclick="loadPage('news/newsdetail')" href="#">2015年6月3日，在“世界环境保护日”来临之际，蓝圈组织（Circle of Blue）发布了一项新的研究报告《世界最大湖泊因人为和环境威胁承受巨大压力》....</a></p>
                    </li>
                    <li>
                        <a onclick="loadPage('news/newsdetail1')" href="#"><h3>Scientific Reports：中国水资源面临多重挑战</h3></a>
                        <p>2015-10-29</p>
                        <p class="news-p"><a onclick="loadPage('news/newsdetail1')" href="#">2015年7月9日出版的Scientific Reports中连续发表2篇文章，分析了中国部分地区的农业和水电建设对中国水资源的挑战。一篇题为《中国北方农业生产加剧土壤湿度下降》.....</a></p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="data">
    <div class="data-top">
        <ul class="data-nav">
            <li class="active">最新数据 </li>
            <li>热门数据</li>
            <li>推荐数据</li>
        </ul>
        <span class="data-more">
            <a class="more" href="#">+<fmt:message key="moreinfo"/></a>
            <a class="more hide" href="#">+<fmt:message key="moreinfo"/></a>
            <a class="more hide" href="#">+<fmt:message key="moreinfo"/></a>
        </span>
    </div>
    <!--最新数据-->
    <div id="lakeLatestDataset" class="data-wrap newData"> 
    </div>
    <!--热门数据-->
    <div class="data-wrap hotData hide">
        <div class="data-list">
            <ul id="lakeHotDataset">
                
            </ul>
        </div>
    </div>
    <!--推荐数据-->
    <div class="data-wrap tuijian hide">
        <div id="lakeRecommendDataset" class="data-first">    
        </div>
        <div class="data-list">
            <ul id="lakeRecommendDatasetUl">
                
            </ul>
        </div>
    </div>
</div>

