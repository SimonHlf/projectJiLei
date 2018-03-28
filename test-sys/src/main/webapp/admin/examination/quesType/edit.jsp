<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editDisRateForm">
                <input type="hidden" name="id" value="${quesType.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">分类名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" value="${quesType.name}" placeholder="分类名称" required>
                        </div>
                    </div>
                    <%-- <c:if test="${result=='true'}">
                    	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                        	<select id="insId" name="insId" onchange="pdsboom2(this.options[this.options.selectedIndex].value)">
                        		<option >--请选择机构--</option>
                        		<c:forEach items="${WindyOrgList}" var="WindyOrg">
                        			<c:if test="${quesType.insId==WindyOrg.id}">
                        				<option value="${WindyOrg.id}" selected="selected">${WindyOrg.name}</option>
                        			</c:if>
                        			<c:if test="${quesType.insId!=WindyOrg.id}">
                        				<option value="${WindyOrg.id}">${WindyOrg.name}</option>
                        			</c:if>
                        				
                        		</c:forEach>
                        	</select>
                            
                        </div>
                        </div>
                        <div class="form-group">
                    		<label class="col-sm-2 control-label no-padding-right">父级分类</label>
                    		 <div class="col-sm-9">
                    		<select id="pid" name="pid">
                    			<option value="0">-请选择要添加分类的父级分类-</option>
                    			<c:forEach items="${quesTypeList}" var="quesTypes">
                    				
                    				<c:if test="${quesTypes.id==quesType.pid}">
                    					<option value="${quesTypes.id}" selected>${quesTypes.name}</option>
                    				</c:if>
                    				<c:if test="${quesTypes.id!=quesType.pid}">
                    					<option value="${quesTypes.id}" >${quesTypes.name}</option>
                    				</c:if>
                    				<c:choose>
                    				<c:when test="${quesTypes.id==quesType.pid}">
                    					<option value="${quesTypes.id}" selected>${quesTypes.name}</option>
                    				</c:when>
                    				<c:when test="${quesTypes.id!=quesType.pid}">
                    					<option value="${quesTypes.id}" >${quesTypes.name}</option>
                    				</c:when>
                    				
                    				</c:choose>
                    			</c:forEach>
                    			
                    		</select>
                    		</div>
                    	</div>
                        
                        
                    </c:if> --%>
                    
                </div>
            </form>
        </div>
    </div>
</div>
<script>
$(function(){
	alert("dddd")
	var select2 = document.querySelector('select#insId'); 
	var option2 = select2.querySelectorAll('option');
	var len2 = option2.length;
	var i2;
	var selectValue2='${quesType.insId}';
	alert(selectValue2)
	for(i = 0; i < len2; i++){
		  if(option2[i].value==selectValue2){
		    option2[i].selected = true;
		    break;
		  }
		}
	
}) 
</script>