<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addDisRateForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">分类名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="分类名称" required>
                        </div>
                    </div>
                    <c:if test="${result=='true'}">
                    	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                        	<select id="insId" name="insId">
                        		<option>--请选择机构--</option>
                        		<c:forEach items="${WindyOrgList}" var="WindyOrg">
                        			<option value="${WindyOrg.id}">${WindyOrg.name}</option>
                        		</c:forEach>
                        	</select>
                            
                        </div>
                    </div>
                    </c:if>
                   
                </div>
            </form>
        </div>
    </div>
</div>
