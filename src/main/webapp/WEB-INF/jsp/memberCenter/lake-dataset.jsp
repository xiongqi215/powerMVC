<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	// 1-水分因子 ,2-土壤因子 ,3-大气因子 ,4-生物因子 ,5-水体因子 ,6-水质检测
	var index_type = 1;
    var typeArray=new Array('水分因子' ,'土壤因子 ','大气因子' ,'生物因子','水体因子','水质检测');
    var docTypeArray=new Array('科研成果', '政策法规', '生态旅游');
		
	
	function openDialog(type,id){
		var lakeid = $("#lakeid").val();
		var url;
		var title;
		if(id==undefined || id==null){
			title='新增';
		}else{
			title='修改';
		}
		
		if(type=='newDoc'){//新增修改文档
			title=title+"文档";
			url='${ctx}/knowledge!input.action?knowledgeForm.doc.id='+ id+"&knowledgeForm.lakeId="+lakeid;
			dialog(title,url,function(){
				 $('#docForm').ajaxSubmit({
					    url: '${ctx}/knowledge!save.action',
					    dataType:'json',
					    success: function(data) {
					    	
					    	alert(data.content);
					    	if(data.code=='I000000'){
					    		closeDialog();
						    	showDocList();
					    	}
					    	
					    }
					  });
			});
		}else{
			//新增修改数据集
		url='${ctx}/dataset!input.action?datasetForm.dataset.keytype='+ type + '&datasetForm.dataset.lakeId=' + lakeid + '&datasetForm.dataset.id=' + id;
		title=title+typeArray[(type-1)]+"数据集";
		dialog(title,url,function(){
			 $('#datasetForm').ajaxSubmit({
				    url: '${ctx}/dataset!save.action',
				    dataType:'json',
				    success: function(data) {
				      	if(data.code!='I000000'){
				    		var msg=data.content.split(";");
						     var content="";
							 $.each(msg, function(index,value){
				                    content+=value+"\r\n";
				                });
							 alert(content);
				    	}else{
				    		alert(data.content);
				    		closeDialog();
					    	showList(type);
				    	}
				    	
				    
				    }
				  });
		});
		}
	}
	
	function openXmlDialog(type){
		var lakeid = $("#lakeid").val();
		url='${ctx}/dataset!xmlinput.action?datasetForm.dataset.keytype='+ type + '&datasetForm.dataset.lakeId=' + lakeid ;
		

		dialog('XML导入',url,function(){
			 $('#xmlForm').ajaxSubmit({
				    url: '${ctx}/dataset!xmlInput.action',
				    dataType:'json',
				    success: function(data) {
				    	
				    	if(data.code!='I000000'){
				    		var msg=data.content.split(";");
						     var content="";
							 $.each(msg, function(index,value){
				                    content+=value+"\r\n";
				                });
							 alert(content);
				    	}else{
				    		closeDialog();
					    	showList(type);
				    		alert(data.content);
				    	}
				    	
				    	
				    }
				  });
			 
//	 		 $('#lakeForm').submit();
		});
	}
	
	function add() {
		var lakeid = $("#lakeid").val();
		location.href = '${ctx}/dataset!input.action?datasetForm.dataset.keytype='
				+ index_type + '&datasetForm.dataset.lakeId=' + lakeid;
	}

		function del(id,type){
			if(type=='delDoc'){
				$.post("${ctx}/knowledge!delete.action",{'knowledgeForm.doc.id':id},function(data){
					alert(data.content);
					showDocList();
				  },'json');
			}else{
			$.post("${ctx}/dataset!delete.action",{'datasetForm.dataset.id':id},function(data){
				alert(data.content);
				showList(type);
			  },'json');
			
			}
		}

	function showList(type) {
		var lakeid = $("#lakeid").val();
// 		index_type = type;
// 		$("table[id^='index_table_']").hide();
		var targetTable = $("table[id='index_table_" + type + "']");
        if(targetTable!=undefined && targetTable!=null){
		$("table[id='index_table_" + type + "'] tr:not(:first)").html("");
		$.getJSON("${ctx}/dataset!list.action", {
			"datasetForm.dataset.lakeId" : lakeid,
			"datasetForm.dataset.keytype" : type
		}, function(data) {
			$.each(data, function(i, item) {
				var tr = $("<tr/>");
				tr.appendTo(targetTable);
				tr.append(
						"<td>" + item.title + "</td>").append(
						"<td>" + item.countryName + "</td>").append(
						"<td>" + item.lakeName + "</td>").append(
						"<td>" + item.memberName + "</td>").append(
						"<td>" + item.dataTime + "</td>").append(
						"<td>" + item.lastModify + "</td>").append(
						"<td><a href='#' onclick=openDialog("+type+","+ item.id +")>修改</a>|<a href='#' onclick=del("+ item.id +","+type+")>删除</a></td>");
			});
		});
        }

// 		$("table[id='index_table_" + type + "']").show();
	}
	
	
// 	 <th width="20%">文章标题</th>
//      <th width="10%">文章作者</th>
//      <th width="10%">上传日期</th>
//      <th width="10%">最后更新日期</th>
//      <th width="20%">文章类型</th>
	function showDocList(){
		var lakeid = $("#lakeid").val();
		var targetTable = $("#doc_table");
		 if(targetTable!=undefined && targetTable!=null){
			 
			 $("#doc_table tr:not(:first)").html("");
			 $.getJSON("${ctx}/knowledge!getLakeDoc.action", {
					"knowledgeForm.lakeId" : lakeid
				}, function(data) {
					$.each(data, function(i, item) {
						var tr = $("<tr/>");
						tr.appendTo(targetTable);
						var docType=docTypeArray[(item.docType-1)];
						tr.append(
								"<td>" + item.docName + "</td>").append(
								"<td>" + item.docAuthor + "</td>").append(
								"<td>" + item.publishDate + "</td>").append(
								"<td>" + item.lastModify + "</td>").append(
								"<td>" + docType + "</td>").append(
								"<td><a href='#' onclick=openDialog('newDoc',"+ item.id +")>修改</a>|<a href='#'  onclick=del("+item.id+",'delDoc')>删除</a></td>");
					});
				});
		 }
	}
	$(function(){
	    $('.facNav li:last').css('borderRight','none')
	    $('.facNav li').each(function(i){
	        $(this).hover(function(){
	            $(this).addClass('facNavOn').siblings().removeClass('facNavOn');//选中样式
	            $('.changeHpxqy:eq('+i+')').show().siblings('.changeHpxqy').hide();
	           
	        })
	        //科研文档页签
	        if($('.changeHpxqy:eq('+i+')').attr("id")=='doc'){
	        	showDocList();
	        }else{
	        showList(i+1);
	        }
	    })
	})
// 	$(function(){
// 		showList(1);
// 	});
	
</script>
<div class="bgDiv">
<input id="lakeid" value="${request.lakeId}" type="hidden">
    <div class="contCenter">
        <div class="locBlock">
            <a href="#" onclick="loadPage('home/homepage')">首页</a><em>&gt;</em><a href="#" onclick="loadPage('memberCenter/member-index')" >会员中心</a><em>&gt;</em><a href="#" onclick="loadPage('memberCenter/lake')">湖泊管理</a><em>&gt;</em><span>数据集</span>
        </div>
        <div class="vip-container clearfix">
            <div class="leftColumn">
				<div class="headTitColumn">会员中心</div>
				<div class="columnLink">
					<a href="#" onclick="loadAction('${ctx}/web/member-input!information.action')">机构信息</a>  
					<a href="#" class="on" onclick="loadPage('memberCenter/lake')">湖泊管理 </a>
				</div>
			</div>
            <div class="data-content">
                <div class="dataMain">
                    <div class="facNav">
                        <ul>
                            <li class="facNavOn">水分因子</li>
                            <li>土壤因子</li>
                            <li>大气因子</li>
                            <li>生物因子</li>
                            <li>水体因子</li>
                            <li>水质检测</li>
                           <li>科研文档</li>
                            
                        </ul>
                    </div>
                    <div class="changeHpxqy">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add" href="#" onclick='openDialog(1)'>+新增</a><a class="daolu" href="#" onclick='openXmlDialog(1)'>↓导入XML</a></div>
                            <table class="hupo-list" width="100%" id='index_table_1'>
                                <tr>
                              <th width="120px">数据集主题</th>
                                    <th width="65px">空间位置</th>
                                    <th width="70px">湖泊名称</th>
                                    <th>数据分发机构</th>
                                    <th width="75px">数据时间</th>
                                    <th width="75px">最新日期</th>
                                    <th width="70px">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
							</div>	 -->                   
							
							
                        </div>
			  </div>
                    
                     <div class="changeHpxqy hide">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add"  href="#" onclick='openDialog(2)'>+新增</a><a class="daolu" href="#" onclick='openXmlDialog(2)'>↓导入XML</a></div>
                            <table class="hupo-list" width="100%" id='index_table_2' >
                                <tr>
                             <th width="120px">数据集主题</th>
                                    <th width="65px">空间位置</th>
                                    <th width="70px">湖泊名称</th>
                                    <th>数据分发机构</th>
                                    <th width="75px">数据时间</th>
                                    <th width="75px">最新日期</th>
                                    <th width="70px">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
							</div>	 -->                   
							
							
                        </div>
			  </div>
			  
			      <div class="changeHpxqy hide">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add" href="#" onclick='openDialog(3)'>+新增</a><a class="daolu" href="#" onclick='openXmlDialog(3)'>↓导入XML</a></div>
                            <table class="hupo-list" width="100%" id='index_table_3' >
                                <tr>
                                <th width="120px">数据集主题</th>
                                    <th width="65px">空间位置</th>
                                    <th width="70px">湖泊名称</th>
                                    <th>数据分发机构</th>
                                    <th width="75px">数据时间</th>
                                    <th width="75px">最新日期</th>
                                    <th width="70px">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
							</div>	 -->                   
							
							
                        </div>
			  </div>
			  
			  
			      <div class="changeHpxqy hide">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add" href="#" onclick='openDialog(4)'>+新增</a><a class="daolu" href="#" onclick='openXmlDialog(4)'>↓导入XML</a></div>
                            <table class="hupo-list" width="100%" id='index_table_4' >
                                <tr>
                                    <th width="120px">数据集主题</th>
                                    <th width="65px">空间位置</th>
                                    <th width="70px">湖泊名称</th>
                                    <th>数据分发机构</th>
                                    <th width="75px">数据时间</th>
                                    <th width="75px">最新日期</th>
                                    <th width="70px">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
							</div>	  -->                  
							
							
                        </div>
			  </div>
			  
			  
			      <div class="changeHpxqy hide">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add" href="#" onclick='openDialog(5)'>+新增</a><a class="daolu" href="#" onclick='openXmlDialog(5)'>↓导入XML</a></div>
                            <table class="hupo-list" width="100%" id='index_table_5' >
                                <tr>
                                <th width="120px">数据集主题</th>
                                    <th width="65px">空间位置</th>
                                    <th width="70px">湖泊名称</th>
                                    <th>数据分发机构</th>
                                    <th width="75px">数据时间</th>
                                    <th width="75px">最新日期</th>
                                    <th width="70px">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
							</div>	 -->                   
							
							
                        </div>
			  </div>
			  
			  
			      <div class="changeHpxqy hide">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add" href="#" onclick='openDialog(6)'>+新增</a><a class="daolu" href="#" onclick='openXmlDialog(6)'>↓导入XML</a></div>
                            <table class="hupo-list" width="100%" id='index_table_6' >
                                <tr>
                                  <th width="120px">数据集主题</th>
                                    <th width="65px">空间位置</th>
                                    <th width="70px">湖泊名称</th>
                                    <th>数据分发机构</th>
                                    <th width="75px">数据时间</th>
                                    <th width="75px">最新日期</th>
                                    <th width="70px">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
							</div>	 -->                   
							
							
                        </div>
			  </div>
			    <div class="changeHpxqy hide" id="doc">
<!--                         <div class="changeSear"> -->
<!--                             <span>最新更新日期</span> -->
<!--                             <span><input type="text" class="timepic" /></span> -->
<!--                             <span><input type="button" value="查询" class="changeCx"/></span> -->
<!--                         </div> -->
                        <div class="shuju-list">
                            <div class="addDiv"><a class="hupo-add" href="#" onclick="openDialog('newDoc')">+新增</a></div>
                            <table class="hupo-list" width="100%" id='doc_table' >
                                <tr>
                                    <th width="20%">文章标题</th>
                                    <th width="10%">文章作者</th>
                                    <th width="10%">上传日期</th>
                                    <th width="15%">最后更新日期</th>
                                    <th width="15%">文章类型</th>
                                    <th width="14%">操作</th>
                                </tr>
                               

                            </table>
							<!-- <div class="pageChange"> 
								<table>
                                <tr><td> 
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
    </div>
</div>