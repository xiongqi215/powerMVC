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
                    <a href="#" onclick="loadPage('news/newsindex')">综合新闻</a>
                    <a href="#" onclick="loadPage('news/newsindex1')" class="on">动态资讯</a>
                    <a href="#" onclick="loadPage('news/newsindex2')">科研动态 </a>
                </div>
            </div>
            <div class="vip-content">
                <div class="newsList">
                    <ul>
                        <li><em>(2014-06-27)</em><a onclick="loadPage('news/newsdetail3')" href="#">国家高技术研究发展计划（863）“先进环境监测技术设备”第9课题启动会召开</a></li>
                        <li><em>(2014-03-26)</em><a onclick="loadPage('news/newsdetail4')" href="#">流域重点实验室专家组视察湖泊—流域数据集成与模拟中心</a></li>
                        <li><em>(2013-07-11)</em><a onclick="loadPage('news/newsdetail5')" href="#">国家自然科学基金委主任刘从强一行视察湖泊—流域数据集成与模拟中心</a></li>
                        <li><em>(2013-07-07)</em><a href="#">第13届全国II类水体水色遥感研讨会</a></li>
                        <li><em>(2013-06-25)</em><a href="#">首届“共享杯”大学生科技资源共享与服务创新实践竞赛启动</a></li>
                        <li><em>(2013-06-01)</em><a href="#">湖泊环境遥感团队网站试运行</a></li>
                        <li><em>(2013-01-06)</em><a href="#">湖泊-流域高性能计算环境建设完成</a></li>
                        <li><em>(2013-01-06)</em><a href="#">湖泊—流域科学数据共享交换平台面向全国开放服务</a></li>
                        <li><em>(2012-06-28)</em><a href="#">湖泊—流域科学数据共享平台成功认定为地球系统科学数据共享平台子平台</a></li>
                    </ul>
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