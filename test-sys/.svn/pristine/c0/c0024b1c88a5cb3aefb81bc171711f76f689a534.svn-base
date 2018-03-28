<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editDisRateForm">
                <input type="hidden" name="id" value="${questions.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题名称</label>
                        <div class="col-sm-9">
                        	<c:choose>
		                        <c:when  test="${fn:contains(questions.name,'image')}">
		                        	<img src="/${questions.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
		                        </c:when >
		                        <c:otherwise>
		                        	 <textarea style="height:71px;" class="form-control" disabled="disabled">${questions.name }</textarea>
		                        </c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">试题分类</label>
                        	<div class="col-sm-9">
                        		 <input class="form-control" id="quesId" name="quesId" readonly="readonly" value="${questTypeName}" placeholder="试题名称" required>
							</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题类型</label>
                        <div class="col-sm-9">
                        	<c:if test="${questions.type==0}">
                        		<input class="form-control" id="type" name="type" readonly="readonly" value="单选" placeholder="试题类型">
							</c:if>
                        	<c:if test="${questions.type==1}">
                        		<input class="form-control" id="type" name="type" readonly="readonly" value="多选" placeholder="试题类型">
                        	</c:if>
                        	<c:if test="${questions.type==2}">
                        		<input class="form-control" id="type" name="type" readonly="readonly" value="判断" placeholder="试题类型">
                        	</c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题图片</label>
                        <div class="col-sm-9">
                            <img src="/${questions.image}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
                        </div>
                    </div>
                    <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">是否分享</label>
                        <div class="col-sm-9">
                            <c:if test="${questions.isShare==0}">分享</c:if>
                            <c:if test="${questions.isShare==1}">不分享</c:if>
                        </div>
                    </div> --%>
                    
                    <c:choose>
                    	<c:when test="${questions.type==2 }">
                    		<c:if test="${questions.answer==0 }">
                    			<div class="form-group">
			                        <label class="col-sm-2 control-label no-padding-right">答案</label>
			                        <div class="col-sm-9" style="top: 6px;">
                    					A
                    				</div>
                    			</div>
                    		</c:if>
                    		<c:if test="${questions.answer==1 }">
                    			<div class="form-group">
			                        <label class="col-sm-2 control-label no-padding-right">答案</label>
			                        <div class="col-sm-9"style="top: 6px;">
                    					B
                    				</div>
                    			</div>
                    		</c:if>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案A</label>
		                        <div class="col-sm-9">
		                        	<c:choose>
				                        <c:when  test="${fn:contains(questions.optionA,'image')}">
				                        	<img src="/${questions.optionA}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" disabled="disabled">${questions.optionA }</textarea>
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案B</label>
		                        <div class="col-sm-9">
		                        	<c:choose>
				                        <c:when  test="${fn:contains(questions.optionB,'image')}">
				                        	<img src="/${questions.optionB}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" disabled="disabled">${questions.optionB }</textarea>
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    
		                    
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案C</label>
		                        <div class="col-sm-9">
		                        	<c:choose>
				                        <c:when  test="${fn:contains(questions.optionC,'image')}">
				                        	<img src="/${questions.optionC}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" disabled="disabled">${questions.optionC }</textarea>
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案D</label>
		                        <div class="col-sm-9">
		                        	<c:choose>
				                        <c:when  test="${fn:contains(questions.optionD,'image')}">
				                        	<img src="/${questions.optionD}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" disabled="disabled">${questions.optionD }</textarea>
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    <%-- <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案E</label>
		                        <div class="col-sm-9">
		                            <input class="form-control" id="optionE" name="optionE" readonly="readonly" value="${questions.optionE}" placeholder="答案C">
		                        </div>
		                    </div><div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案F</label>
		                        <div class="col-sm-9">
		                            <input class="form-control" id="optionF" name="optionF" readonly="readonly" value="${questions.optionF}" placeholder="答案C">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案G</label>
		                        <div class="col-sm-9">
		                            <input class="form-control" id="optionG" name="optionG" readonly="readonly" value="${questions.optionG}" placeholder="答案C">
		                        </div>
		                    </div> --%>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">正确答案</label>
		                        <div class="col-sm-9">
		                            <input class="form-control" id="answer" name="answer" readonly="readonly" value="${questions.answer}" placeholder="答案C">
		                        </div>
		                    </div>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                   <div class="widget-buttons">
                		<!-- <button type="button" class="btn btn-info btn-ok"> 确认</button> -->
                		<button type="button" onclick="daoLiebiao(${page})" class="btn btn-default">返回</button>
            		</div>
                </div>
            </form>
        </div>
    </div>
</div>