<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- cont -->
<div class="bgDiv">
    <div class="contCenter">
        <div class="locBlock">
            <a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><a href="#" onclick="loadPage('news/newsindex')" >新闻动态</a><em>&gt;</em><span>综合新闻</span>
        </div>
        <div class="vip-container clearfix">
            <div class="leftColumn">
                <div class="headTitColumn">新闻动态</div>
                <div class="columnLink">
                    <a href="#" onclick="loadPage('news/newsindex')" class="on"><fmt:message key="nav.news.normal"/></a>
                    <a href="#" onclick="loadPage('news/newsindex1')"><fmt:message key="nav.news.dynamic"/></a>
                    <a href="#" onclick="loadPage('news/newsindex2')"><fmt:message key="nav.news.scientific"/> </a>
                </div>
            </div>
            <div class="vip-content">
                <div class="newsList">
                    <ul>
                        <li><em>(2015-10-29)</em><a onclick="loadPage('news/newsdetail')" href="#">世界最大湖泊面临来自人类和环境的双重挑战 </a></li>
                        <li><em>(2015-10-29)</em><a onclick="loadPage('news/newsdetail1')" href="#">Scientific Reports：中国水资源面临多重挑战</a></li>
                        <li><em>(2015-07-22)</em><a onclick="loadPage('news/newsdetail2')" href="#">滇池近期蓝藻暴发引发各界关注</a></li>
                        <li><em>(2015-08-10)</em><a href="#">《湖泊调查技术规程》一书顺利出版</a></li>
                        <li><em>(2015-07-22)</em><a href="#">中科院南京地理与湖泊研究所大学生夏令营参观湖</a></li>
                        <li><em>(2015-07-13)</em><a href="#">《中国湖泊分布地图集》正式出版</a></li>
                        <li><em>(2015-07-03)</em><a href="#">西北大学大学生团参观湖泊—流域数据集成与模拟中心</a></li>
                        <li><em>(2015-05-20)</em><a href="#">第三届“共享杯”大学生科技资源共享服务创新大赛在京启动</a></li>
                        <li><em>(2015-05-17)</em><a href="#">湖泊—流域科学数据分中心2015年公众科学日活动</a></li>
                        <li><em>(2015-05-16)</em><a href="#">《中国湖泊分布地图集》出版工作进展顺利</a></li>
                        <li><em>(2015-05-12)</em><a href="#">第三届共享杯大学生科技资源共享服务创新大赛企业筹备会在京召开</a></li>
                    </ul>
                </div>
               <!--  <div class="pageChange">
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