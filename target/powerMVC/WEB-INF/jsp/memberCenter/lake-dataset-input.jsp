<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript">
		
</script>




  <form method="post" enctype="multipart/form-data"  id="datasetForm">
  <input  name="datasetForm.dataset.lakeId"  type="hidden" value="${ request.dataset.lakeId}"/>
   <input  name="datasetForm.dataset.keytype"  type="hidden" value="${ request.dataset.keytype}" id="keyType"/>
   <input  name="datasetForm.dataset.id"  type="hidden" value="${ request.dataset.id}" id="datasetId"/>
   <table class="openTable">
                <tr>
                    <th width="95">数据集主题</th>
                    <td width="185">
                    <input type="text" class="openInput w575"  name="datasetForm.dataset.title"   value="${ request.dataset.title}"/>
                    </td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td><textarea  class="openTextarea w575" name="datasetForm.dataset.dataDesc">${ request.dataset.dataDesc}</textarea></td>
                </tr>
                <tr>
                    <th>数据集图片</th>
                    <td><input type="file" name="datasetForm.img"/></td>
                </tr>
                <tr>
                    <th>数据指标</th>
                    <td>
                        <ul class="zbTable">
                        <c:if test="${not empty request.indexList }">
                        <c:forEach items="${request.indexList }" var="index" varStatus="status">
                         
                            <li>
                              <span> ${ index.indexCnName} </span>
                                
                                <input name="datasetForm.dataset.details[${status.index}].keyvalue" type="text" class="openInput w70" />
							   <input name="datasetForm.dataset.details[${status.index}].keyflag" value="${index.indexCode}" type="hidden" />
                               <input name="datasetForm.dataset.details[${status.index}].id" type="hidden" />
                               <em><c:if test="${not empty index.indexSymbol}">(${ index.indexSymbol})</c:if></em>
                                
                            </li>
                         </c:forEach>   
                         </c:if>
                             <c:if test="${not empty request.dataset.details }">
                          <c:forEach items="${request.dataset.details }" var="index" varStatus="status">
                            <li>
                                <span>${ index.keyname}</span>
                                <input name="datasetForm.dataset.details[${status.index}].keyvalue" type="text" class="openInput w70" value="${ index.keyvalue}"/>
							   <input name="datasetForm.dataset.details[${status.index}].keyflag" value="${index.keyflag}" type="hidden" />
                               <input name="datasetForm.dataset.details[${status.index}].id" type="hidden" value="${ index.id}" />
                               <em><c:if test="${not empty index.indexSymbol}">(${ index.indexSymbol})</c:if>  </em>
                            </li>
                         </c:forEach>   
                         </c:if>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th>数据附件:</th>
                    <td><input type="file" name="datasetForm.attach"/></td>
                </tr>
            </table>



  </form>
</div>
