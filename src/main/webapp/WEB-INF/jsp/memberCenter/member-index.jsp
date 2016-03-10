<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript">
// 	var rowid='${loginUser.id}';
// 	 $.getJSON("${ctx}/member-input!init.action",{rowId:rowid},function(data){
// 		 //alert("123");
// 		var t = "<tr>";
// 		t = t + "<th width='105'>机构名称</th>";
// 		t = t + "<td wdith='520'>"+data.memberCName+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>帐号</th>";
// 		t = t + "<td wdith='520'>"+data.login+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>所属国家</th>";
// 		t = t + "<td wdith='520'>"+data.country+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>机构类型</th>";
// 		t = t + "<td wdith='520'>"+data.typeName+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>联系方式</th>";
// 		t = t + "<td wdith='520'>"+data.tele+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>联系人</th>";
// 		t = t + "<td wdith='520'>"+data.contacts+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>电子邮箱</th>";
// 		t = t + "<td wdith='520'>"+data.email+"</td>";
// 		t = t + "</tr>";
// 		t = t + "<tr>";
// 		t = t + "<th>通讯地址</th>";
// 		t = t + "<td wdith='520'>"+data.address+"</td>";
// 		t = t + "</tr>";
// 		$("#yh").append(t);
// 	}); 
	
	

</script>

<div class="bgDiv">
    <div class="contCenter">
        <div class="locBlock">
            <a href="#" onclick="loadPage('home/homepage')" >首页</a><em>&gt;</em><span>会员中心</span>
        </div>
        <div class="vip-container clearfix">
            <div class="leftColumn">
                <div class="headTitColumn">会员中心</div>
                <div class="columnLink">
                    <a href="#" onclick="loadAction('memberCenter/init/input.do')">机构信息</a>
                  <a href="#" onclick="loadAction('memberCenter/lakeMgmt.do?organId=${organ.id}')">湖泊管理 </a>
                </div>
            </div>
            <div class="vip-content">
                <table id="yh" class="vip-info">
                  <tr>
                        <th width="105">机构名称</th>
                        <td wdith="520">${organ.name}</td>
                    </tr>
<!--                     <tr> -->
<!--                         <th>帐号</th> -->
<%--                         <td>${organ.login}</td> --%>
<!--                     </tr> -->
                    <tr>
                        <th>所属国家</th>
                        <td>${organ.countryCName}</td>
                    </tr>
                    <tr>
                        <th>机构类型</th>
                        <td>研究所</td>
                    </tr>
                    <tr>
                        <th>联系方式</th>
                        <td>${organ.tele}</td>
                    </tr>
                    <tr>
                        <th>联系人</th>
                        <td>${organ.contacts}</td>
                    </tr>
                    <tr>
                        <th>电子邮箱</th>
                        <td>${organ.email}</td>
                    </tr>
                    <tr>
                        <th>通讯地址</th>
                        <td>${organ.address}</td>
                    </tr> 
                </table>

            </div>
        </div>
    </div>
</div> 











