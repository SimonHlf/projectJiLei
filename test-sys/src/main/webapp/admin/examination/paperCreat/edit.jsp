<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editDisrelationshipForm">
                <input type="hidden" name="id" value="${PaperCreat.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试卷名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" value="${PaperCreat.name}" placeholder="试卷名称" required>
                            
                        </div>
                    </div>
                   <%--  <c:if test="${result=='true'}">
                    	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                            <select id="insId" name="insId" onchange="pds(this.options[this.options.selectedIndex].value)">
                            	<option>--请选择机构--</option>
                            	<c:forEach items="${WindyOrgList}" var="WindyOrg">
                            		<c:choose>
                            			<c:when test="${PaperCreat.insId==WindyOrg.id}">
                            			<option  selected value="${WindyOrg.id}">${WindyOrg.name}</option>
                            			</c:when>
                            			<c:otherwise>
                            			<option value="${WindyOrg.id}">${WindyOrg.name}</option>
                            			</c:otherwise>
                            		</c:choose>
                            		
                            	</c:forEach>
                            </select>
                        </div>
                    </div>
                    </c:if> --%>
                  
                    
                   
                    <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">生成方式</label>
                        <div class="col-sm-9">
                        	<select id="sets" name="sets">
                        		<option >--请选择生成方式--</option>
                        		<c:if test="${PaperCreat.sets==0}">
                        			<option selected="selected" value="0">自动</option>
                        			<option  value="1">手动</option>
                        		</c:if>
                        		
                        		<c:if test="${PaperCreat.sets==1}">
                        			<option selected="selected" value="1">手动</option>
                        			<option  value="0">自动</option>
                        		</c:if>
                        		
                        	</select>
                           
                        </div>
                    </div> --%>
                   <%--  <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试卷类型</label>
                        <div class="col-sm-9">
                            <select id="types" name="types">
                            	<option >--请选择类型--</option>
                            	<c:if test="${PaperCreat.types==0}">
                            		<option selected="selected" value="0">练习</option>
                            		<option value="1">考试</option>
                            	</c:if>
                            	<c:if test="${PaperCreat.types==1}">
                            		<option value="0">练习</option>
                            		<option selected="selected" value="1">考试</option>
                            	</c:if>
                            	
                            </select>
                        </div>
                    </div> --%>
                    
                   <%--  <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">状态</label>
                        <div class="col-sm-9">
                           <select id="statuss" name="statuss">
                           		<option >--请选择状态--</option>
                           		<c:if test="${PaperCreat.types==0}">
                            		<option selected="selected" value="0">预览</option>
                           		<option value="1">确定</option>
                            	</c:if>
                            	<c:if test="${PaperCreat.types==1}">
                            		<option value="0">预览</option>
                           		<option selected="selected" value="1">确定</option>
                            	</c:if>
                           		
                           </select>
                        </div>
                    </div> --%>
                    
                    
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
/* $(function(){
	alert("dddd")
	var select = document.querySelector('select#insId'); 
	
	var option = select.querySelectorAll('option');
	
	var len = option.length;
	var i;
	var selectValue='${PaperCreat.insId}';
	for(i = 0; i < len; i++){
		  if(option[i].value==selectValue){
		    option[i].selected = true;
		    break;
		  }
		}
}) 
 */
 $(function(){
	alert("dddd")
	/* var select = document.querySelector('select#sets'); 
	
	var option = select.querySelectorAll('option');
	
	var len = option.length;
	var i;
	var selectValue='${PaperCreat.sets}';
	for(i = 0; i < len; i++){
		  if(option[i].value==selectValue){
		    option[i].selected = true;
		    break;
		  }
		} */
}) 
</script>