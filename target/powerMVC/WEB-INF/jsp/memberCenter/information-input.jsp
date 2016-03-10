<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>



<script type="text/javascript">

$(function() {
	loadCountry("${memberInputForm.countryId}");
	loadType("${memberInputForm.type}");
});

//加载国家列表
function loadCountry(id){
	$.getJSON("${ctx}/lake!countryList.action", function(data){
		  $.each(data, function(i,item){
			  if(item.id==Number(id)){
				  $("<option/>").val(item.id).text(item.nameCn).attr("selected",true).appendTo($("#countryList"));
			  }else{
				  $("<option/>").val(item.id).text(item.nameCn).appendTo($("#countryList"));
			  }
		  });
	});
}

//加载机构类型
function loadType(id){
	$.getJSON("${ctx}/json/tree_data2.json", function(data){
		  $.each(data, function(i,item){
			  if(item.id==Number(id)){
				  $("<option/>").val(item.id).text(item.text).attr("selected",true).appendTo($("#type"));
			  }else{
				  $("<option/>").val(item.id).text(item.text).appendTo($("#type"));
			  }
		  });
	});
}


//Jquery禁用只读文本框获得焦点时的退格键
$(document).keydown(
		function(e) {
			var doPrevent = true;
			if (e.keyCode == 8) {
				var d = e.srcElement || e.target;
				if (d.tagName.toUpperCase() == 'INPUT'
						|| d.tagName.toUpperCase() == 'TEXTAREA') {
					doPrevent = d.readOnly || d.disabled;
				} else {
					doPrevent = false;
				}
			} else {
				doPrevent = false;
			}
			if (doPrevent) {
				e.preventDefault();
			}
		});
		
function save(){
	$('#memberInputForm').ajaxSubmit({
	    url: '${ctx}/member-input!saveMember.action',
	    dataType:'json',
	    success: function(data) {
	    	alert(data.content);
	    	loadPage('memberCenter/member-index');
	    	//loadPage('memberCenter/lake');
	    }
	  });
}

function revice(){
	$("#pass").show();
	document.getElementById("newPass").value = "";
}

</script>




<div class="bgDiv">
    <div class="contCenter">
        <div class="locBlock">
            <a href="">首页</a><em>&gt;</em><a href="">会员中心</a><em>&gt;</em><span>机构信息</span>
        </div>
        <div class="vip-container clearfix">
            <div class="leftColumn">
                <div class="headTitColumn">会员中心</div>
                <div class="columnLink">
                    <a href="#" class="on" onclick="loadAction('${ctx}/web/member-input!information.action')">机构信息</a>
                    <a href="#" onclick="loadPage('memberCenter/lake')">湖泊管理 </a>
                </div>
            </div>
            <div class="vip-content">
            <form id="memberInputForm" >
                <table class="vip-info">
                
                    <tr>
                        <th width="105">机构名称</th>
                        <td wdith="520"><input type="text" value="${memberInputForm.memberCName}" name="memberCName" class="divInput"></td>
                    </tr>
                    <tr>
                        <th>帐号</th>
                        <td><input type="text" value="${memberInputForm.login}" name="login" class="divInput w205"><a class="changePW"  onclick="revice()" href="#">修改密码</a></td>
                    </tr>
                    <tr id="pass" style="display: none">
                        <th>新密码</th>
                        <td><input id="newPass" type="text" value="${memberInputForm.password}" name="password" class="divInput"></td>
                    </tr>
                    <tr>
                        <th>所属国家</th>
                        <td><select id="countryList" name="countryId" class="proType"></select></td>
                    </tr>
                    <tr>
                        <th>机构类型</th>
                        <td><select class="proType" id="type" name="type" ></select></td>
                    </tr>
                    <tr>
                        <th>联系方式</th>
                        <td><input type="text" value="${memberInputForm.tele}" name="tele" class="divInput"></td>
                    </tr>
                    <tr>
                        <th>联系人</th>
                        <td><input type="text" value="${memberInputForm.contacts}" name="contacts" class="divInput"></td>
                    </tr>
                    <tr>
                        <th>电子邮箱</th>
                        <td><input type="text" value="${memberInputForm.email}" name="email" class="divInput"></td>
                    </tr>
                    <tr>
                        <th>通讯地址</th>
                        <td><input type="text" value="${memberInputForm.address}" name="address" class="divInput"></td>
                    </tr>
                    <tr><input type="text" style="display:none" value="${memberInputForm.memberId}" name="memberId" ></input></tr>
                </table>
               
                <div class="submitWrap">
                    <input type="button" value="保存" onclick="save()" class="btn-submit"/>
                    <input type="button" value="取消" onclick="loadPage('memberCenter/member-index')" class="btn-off"/>
                     
                </div>
                </form>
            </div>
        </div>
    </div>
</div>


