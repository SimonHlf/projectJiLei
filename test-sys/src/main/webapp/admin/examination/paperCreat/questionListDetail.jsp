<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <input class="form-control" id="name" name="name" readonly="readonly" value="${questions.name}" placeholder="试题名称" required>
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
                        <label class="col-sm-2 control-label no-padding-right">试题题目</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="title" name="title" readonly="readonly" value="${questions.title}" placeholder="试题题目">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题图片</label>
                        <div class="col-sm-9">
                            <img src="/${questions.image}"  style="width: 50px;height: 50px" alt="暂无图片"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">是否分享</label>
                        <div class="col-sm-9">
                            <c:if test="${questions.isShare==0}">分享</c:if>
                            <c:if test="${questions.isShare==1}">不分享</c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案A</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionA" name="optionA" readonly="readonly" value="${questions.optionA}" placeholder="答案A">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案B</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionB" name="optionB" readonly="readonly" value="${questions.optionB}" placeholder="答案B">
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案C</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionC" name="optionC" readonly="readonly" value="${questions.optionC}" placeholder="答案C">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案D</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionD" name="optionD" readonly="readonly" value="${questions.optionD}" placeholder="答案C">
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
                   <div class="widget-buttons">
                		<!-- <button type="button" class="btn btn-info btn-ok"> 确认</button> -->
                		<button type="button" onclick="toquestionsLists(${paperCreatId})" class="btn btn-default">返回</button>
            		</div>
                </div>
            </form>
        </div>
    </div>
</div>