<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post">
            
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">身份证号</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="cardid" value="${userIdent.cardid }" readonly>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">身份证正面</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.cardfront}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">身份证反面</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.cardafter}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">手持身份证</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.handcard}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">法人身份证正面</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.facarfront}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">法人身份证反面</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.facardafter}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">营业执照</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.facardafter}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">开户许可证</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.openlicence}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">对公账户</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="cardid" value="${userIdent.publicaccount }" readonly>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">委托书</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.proxy}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">合同人姓名</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="cardid" value="${userIdent.contractname }" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">合同证件照</label>
                        <div class="col-sm-9">
                            <img src="/${userIdent.contractpaper}" width="200px" height="200px">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">申请时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="createtime" value="${userIdent.createtime }" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">审核状态</label>
                        <div class="col-sm-9">
                            <c:if test="${userIdent.status == 0}">
                             <button type="button" class="btn  btn-primary"> 未审核</button>
                           </c:if>
                            <c:if test="${userIdent.status == 1}">
                             <button type="button" class="btn  btn-info"> 通过</button>
                            </c:if>
                            <c:if test="${userIdent.status == 2}">
							<button type="button" class="btn  btn-danger"> 未通过</button>
							</c:if>
                        </div>
                    </div>
                    <c:if test="${userIdent.auditor != null}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">审核人</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="auditorName" value="${userIdent.auditorName}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">审核时间</label>
                        <div class="col-sm-9">
                            <input class="form-control" name="audittime" value="${userIdent.audittime }" readonly>
                        </div>
                 	</div>
                 	 </c:if>
                  	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">原因</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="content" name="content">${userIdent.content }</textarea>
                        </div>
                    </div>
                   
                    <%--   <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">备注</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" name="cardid" readonly>${userIdent.remark }</textarea>
                        </div>
                    </div> --%>
                    
                </div>
            </form>
            
        </div>
    </div>
</div>
<div class="btn-group">
    <button type="button" onclick="shenhe(1,'${userIdent.id}')" class="btn btn-info">通过</button>
    <button type="button" onclick="shenhe(2,'${userIdent.id}')" class="btn btn-danger">不通过</button>
    <button type="button" onclick="callback('${page1}')" class="btn btn-primary">返回</button>
</div>