<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editDisRateForm">
                <input type="hidden" name="id" value="${paperCreat.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试卷名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" readonly="readonly" value="${paperCreat.name}" placeholder="试卷名称" required>
                        </div>
                    </div>
                    <div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        	<div class="col-sm-9">
                        		 <input class="form-control" id="quesId" name="quesId" readonly="readonly" value="${paperCreat.orgName}" placeholder="试题名称" required>
							</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">生成方式</label>
                        <div class="col-sm-9">
                        	<c:if test="${paperCreat.sets==0}">
                        		<input class="form-control" id="sets" name="sets" readonly="readonly" value="自动" placeholder="试题类型">
							</c:if>
                        	<c:if test="${paperCreat.sets==1}">
                        		<input class="form-control" id="sets" name="sets" readonly="readonly" value="手动" placeholder="试题类型">
                        	</c:if>
                       
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试卷类型</label>
                        <div class="col-sm-9">
                        	<c:if test="${paperCreat.sets==0}">
                        		<input class="form-control" id="sets" name="sets" readonly="readonly" value="练习" placeholder="试卷类型">
							</c:if>
                        	<c:if test="${paperCreat.sets==1}">
                        		<input class="form-control" id="sets" name="sets" readonly="readonly" value="考试" placeholder="试卷类型">
                        	</c:if>
                       
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">创建时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="sets" name="sets" readonly="readonly" value="${paperCreat.creat_time}" placeholder="试卷类型">
                        </div>
                    </div>
                   
                   <div class="widget-buttons">
                		<!-- <button type="button" class="btn btn-info btn-ok"> 确认</button> -->
                		<button type="button" onclick="returnPaperCreatList(${page.page})" class="btn btn-default">返回</button>
            		</div>
                </div>
            </form>
        </div>
    </div>
</div>