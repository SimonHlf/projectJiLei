<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addLogisticsForm">
           
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">物流状态</label>
                    <div class="col-sm-9">
                       	<c:if test="${maps.State==4}">问题件</c:if>
						<c:if test="${maps.State==3}">已签收</c:if>
						<c:if test="${maps.State==2}">在途中</c:if>
						<c:if test="${maps.State==0}">暂无轨迹信息</c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">运单编号</label>
                    <div class="col-sm-9">
                        ${maps.LogisticCode}
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">物流信息</label>
                     <div class="col-sm-9">
                    <c:forEach items="${traces}" var="t">
						<div>
						${t.AcceptStation}
						</div>
						<div>
						${t.AcceptTime}
						</div>
						<br>
					</c:forEach>
                   </div>
                </div>
				
			</form>
        </div>
    </div>
</div>
