<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
           <div >
           	<div class="form-group">
           		<label class="col-sm-2 control-label no-padding-right">题目:</label>
                	<div class="col-sm-3">
                       <c:choose>
	                        <c:when  test="${fn:contains(ques.name,'image')}">
	                        	<img src="/${ques.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
	                        </c:when >
	                        <c:otherwise>
	                        	 ${ques.name}
	                        </c:otherwise>
                      	</c:choose>
                   </div>
           	</div></br>
           	<div class="form-group">
           		<label class="col-sm-2 control-label no-padding-right">所属机构:</label>
                	<div class="col-sm-3">
                       ${org.name}
                   </div>
           	</div></br>
           	<div class="form-group">
                	<label class="col-sm-2 control-label no-padding-right">所属分类:</label>
                	<div class="col-sm-3">
                       ${quesType.name}
                   </div>
           	</div></br>
           	 <c:choose>
               	<c:when test="${ques.type==2 }">
               		<c:if test="${ques.answer==0 }">
               			<div class="form-group">
                      <label class="col-sm-2 control-label no-padding-right">答案</label>
                      <div class="col-sm-9">
               					正确
               				</div>
               			</div>
               		</c:if>
               		<c:if test="${ques.answer==1 }">
               			<div class="form-group">
                      <label class="col-sm-2 control-label no-padding-right">答案</label>
                      <div class="col-sm-9">
               					错误
               				</div>
               			</div>
               		</c:if>
               	</c:when>
               	<c:otherwise>
	                <div class="form-group">
	                   <label class="col-sm-2 control-label no-padding-right">答案A</label>
	                	<div class="col-sm-3">
	                       <c:choose>
		                        <c:when  test="${fn:contains(ques.optionA,'image')}">
		                        	<img src="/${ques.optionA}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
		                        </c:when >
		                        <c:otherwise>
		                        	 ${ques.optionA }
		                        </c:otherwise>
	                       	</c:choose>
	                   </div>
	               </div></br>
	               <div class="form-group">
	               	<label class="col-sm-2 control-label no-padding-right" width='50'>答案B</label>
	                   <div class="col-sm-3">
	                      <c:choose>
		                        <c:when  test="${fn:contains(ques.optionB,'image')}">
		                        	<img src="/${ques.optionB}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
		                        </c:when >
		                        <c:otherwise>
		                        	 ${ques.optionB }
		                        </c:otherwise>
	                       	</c:choose>
	                   </div>
	               </div></br>
	               <div class="form-group">
	                   <label class="col-sm-2 control-label no-padding-right">答案C</label>
	                   <div class="col-sm-3">
	                       <c:choose>
		                        <c:when  test="${fn:contains(ques.optionC,'image')}">
		                        	<img src="/${ques.optionC}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
		                        </c:when >
		                        <c:otherwise>
		                        	 ${ques.optionC }
		                        </c:otherwise>
	                       	</c:choose>
	                   </div>
	               </div></br>
	               <div class="form-group">
	                   <label class="col-sm-2 control-label no-padding-right">答案D</label>
	                   <div class="col-sm-3">
	                       <c:choose>
		                        <c:when  test="${fn:contains(ques.optionD,'image')}">
		                        	<img src="/${ques.optionD}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
		                        </c:when >
		                        <c:otherwise>
		                        	 ${ques.optionD }
		                        </c:otherwise>
	                       	</c:choose>
	                   </div>
	               </div></br>
	               <div class="form-group">
	                   <label class="col-sm-2 control-label no-padding-right">正确答案</label>
	                   <div class="col-sm-3">
	                       ${ques.answer}
	                   </div>
	               </div></br>
	            </c:otherwise>
	            </c:choose>
           </div>
        </div>
    </div>
</div>