<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css"/>
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<script src="contactway/credit.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editCreditForm">
            	 <input type="hidden" name="id" value="${contactWay.id}">
                <div >
                	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">联系类型</label>
                        <div class="col-sm-9">
                            <select id="type" name="type" onchange="types(this.value)">
                            	<option value="0" <c:if test="${contactWay.type==0 }">selected = "selected"</c:if> >QQ1</option>
                            	<option value="1" <c:if test="${contactWay.type==1 }">selected = "selected"</c:if> >QQ2</option>
                            	<option value="2" <c:if test="${contactWay.type==2 }">selected = "selected"</c:if> >微信1</option>
                            	<option value="3" <c:if test="${contactWay.type==3 }">selected = "selected"</c:if> >微信2</option>
                            	<option value="4" <c:if test="${contactWay.type==4 }">selected = "selected"</c:if> >二维码</option>
                            	<option value="5" <c:if test="${contactWay.type==5 }">selected = "selected"</c:if> >二维码简介</option>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" value="${contactWay.contactNuma }" name="contactNuma">
                    <div class="form-group" id="types">
                        <label class="col-sm-2 control-label no-padding-right">
	                        <c:if test="${contactWay.type==4 }">二维码</c:if>
	                        <c:if test="${contactWay.type==5 }">二维码简介</c:if>
	                        <c:if test="${contactWay.type==0 || contactWay.type==1 || contactWay.type==2 || contactWay.type==3 }">联系号码</c:if>
                        </label>
                        <div class="col-sm-9">
                         	<c:if test="${contactWay.type==4 }">
                         		<div class="fileupload fileupload-new" data-provides="fileupload">
                            		<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                		<img  src="/${contactWay.contactNuma}" alt=""/>
                            		</div>
		                            <div class="fileupload-preview fileupload-exists thumbnail"
		                                 style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
		                            <div>
										<span class="btn btn-default btn-file">
											<span class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
											<span class="fileupload-exists"><i class="fa fa-undo"></i>替换</span>
											 上传图片 <input type="file" class="default" name="headImage" id="imgs"/>
										</span> 
										<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> 删除 </a>
		                            </div>
		                            <span id="pictureSpan"></span>
		                        </div>
                         	</c:if>
	                        <c:if test="${contactWay.type==5 }">
	            				<input class="form-control" id="contactNuma" name="contactNuma" value="${contactWay.contactNuma }" placeholder="二维码简介" required>            
	                        </c:if>
	                        <c:if test="${contactWay.type==0 || contactWay.type==1 || contactWay.type==2 || contactWay.type==3 }">
								<input class="form-control" id="contactNuma" maxlength="11" name="contactNuma" value="${contactWay.contactNuma }" placeholder="联系号码" required>
							</c:if>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">状态</label>
                        <div class="col-sm-9">
                            <select id="isOpen" name="isOpen">
                            	<option value="0" <c:if test="${contactWay.isOpen==0 }">selected = "selected"</c:if> >未启用</option>
                            	<option value="1" <c:if test="${contactWay.isOpen==1 }">selected = "selected"</c:if> >启用</option>
                            	
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">时间</label>
                        <div class="col-sm-9" id="datepicker">
                            <input class="form-control" id="updateTime" type="date" name="updateTime" value="${contactWay.updateTime }" placeholder="时间" required>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
