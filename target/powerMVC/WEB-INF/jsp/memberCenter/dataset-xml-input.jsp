<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
function downLoadXml(){
// var a="${ctx}/dataset!generateXml.action?datasetForm.dataset.keytype="+ ${request.keyType} + "&datasetForm.dataset.lakeId="+ ${ request.lakeId}
}
</script>



  <form method="post" enctype="multipart/form-data" id="xmlForm">
  <input  name="datasetForm.dataset.lakeId"  type="hidden" value="${ request.lakeId}"/>
  <input  name="datasetForm.dataset.keytype"  type="hidden" value="${ request.keyType}"/>
  <table class="openTable">
                <tr>
                    <th width="95">模板下载</th>
                    <td width="185">
                    <a class="hupo-add" href="${ctx}/dataset!generateXml.action?datasetForm.dataset.keytype=${request.keyType}&datasetForm.dataset.lakeId=${ request.lakeId}" >↓模板下载</a>
                    </td>
                    </tr>
                      <tr>
                    <th width="95">导入XML</th>
                    <td width="185">
                       <input type="file" name="datasetForm.xmlFile" />
                        </select>
                    </td>
                </tr>

            </table>
  </form>
