<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function goBack(){
	location.href='${ctx}/lakeForm.action';
}

//加载国家列表
function loadCountry( id){
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

//加载湖泊类型列表

function loadLakeType( id){
	$.getJSON("${ctx}/json/lakeType.json", function(data){
		  $.each(data, function(i,item){
			  
			  if(item.id==Number(id)){
				 
				  $("<option/>").val(item.value).text(item.text).attr("selected",true).appendTo($("#lakeType"));
			  }else{
				  $("<option/>").val(item.value).text(item.text).appendTo($("#lakeType"));
			  }
			  
			  
		  });
		});
}
loadCountry("${lakeForm.lake.countryId}");
loadLakeType("${lakeForm.lake.laketype}");
</script>



  <form method="post" enctype="multipart/form-data" action="${ctx}/lake!save.action" id="lakeForm">
  <input  name="lakeForm.lake.id"  type="hidden" value="${ lakeForm.lake.id}"/>
  <table class="openTable">
                <tr>
                    <th width="95">湖泊名称</th>
                    <td width="185"><input type="text" class="openInput" name="lakeForm.lake.lakename" value="${lakeForm.lake.lakename}"/></td>
                    <th width="95">国家</th>
                    <td width="185">
                        <select class="openSelect" id="countryList" name="lakeForm.lake.countryId" >
                          
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>湖泊面积(km<sup>2</sup>)</th>
                    <td><input type="text" class="openInput" name="lakeForm.lake.lakearea" value="${lakeForm.lake.lakearea}"/></td>
                    <th>湖泊类型</th>
                    <td><select class="openSelect" name="lakeForm.lake.laketype" id="lakeType" >
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>纬度</th>
<%--                     <img src="${ctx}/images/dw.jpg" /> --%>
                    <td><input type="text" class="openInput " name="lakeForm.lake.latitude" value="${lakeForm.lake.latitude}"/></td>
                    <th>经度</th>
                    <td><input type="text" class="openInput " name="lakeForm.lake.longitude" value="${lakeForm.lake.longitude}"/></td>
                </tr>
                <tr>
                    <th>长度(km)</th>
                    <td><input type="text" class="openInput"  name="lakeForm.lake.lakeLength" value="${lakeForm.lake.lakeLength}"/></td>
                    <th>宽度(km)</th>
                    <td><input type="text" class="openInput" name="lakeForm.lake.lakeWidth" value="${lakeForm.lake.lakeWidth}"/></td>
                </tr>
                <tr>
                    <th>容积(m<sup>3</sup>)</th>
                    <td><input type="text" class="openInput" name="lakeForm.lake.volume" value="${lakeForm.lake.volume}"/></td>
                    <th>湖泊岸线</th>
                    <td><input type="text" class="openInput" name="lakeForm.lake.shoreline" value="${lakeForm.lake.shoreline}"/></td>
                </tr>
                <tr>
                    <th>流域范围</th>
                    <td colspan="3">
                        <textarea class="openTextarea" name="lakeForm.lake.basinRange" >${lakeForm.lake.basinRange}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>湖泊图片</th>
                    <td colspan="3"><input type="file" name="lakeForm.upload" /></td>
                </tr>
                <tr >
                    <td colspan="4"><span style="color: red;">*经纬度填写方式：例如鄱阳湖 东经116.291582 北纬28.88347， 如为西经与南纬填入负数 </span></td>
                </tr>
            </table>
  </form>
