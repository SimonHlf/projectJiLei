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
                    <input id="types" type="hidden" value="${types}"/>
                    <input id="orgId" type="hidden" value="${orgId}"/>
                    <input id="indFIds" type="hidden" value="${indFIds}"/>
                    <%-- <c:if test="${result=='true'}">
                    	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                        	<select id="insId" name="insId" onchange="pdsboom1(this.options[this.options.selectedIndex].value)">
                        		<option>--请选择机构--</option>
                        		<c:forEach items="${WindyOrgList}" var="WindyOrg">
                        			<option value="${WindyOrg.id}">${WindyOrg.name}</option>
                        		</c:forEach>
                        	</select>
                            
                        </div>
                    	</div>
                    	<div class="form-group">
                    		<label class="col-sm-2 control-label no-padding-right">父级分类</label>
                    		 <div class="col-sm-9">
                    		<select id="pid" name="pid">
                    			<option value="0">-请选择要添加分类的父级分类-</option>
                    		</select>
                    		</div>
                    	</div>
                    </c:if> --%>
                    <%-- <c:if test="${result=='false'}">
                    	<div class="form-group">
                    		<label class="col-sm-2 control-label no-padding-right">父级分类</label>
                    		 <div class="col-sm-9">
                    		<select id="pid" name="pid">
                    			<option value="0">-请选择要添加分类的父级分类-</option>
                    			<c:forEach items="${quesTypeList}" var="quesType">
                    				<option value="${quesType.id}">${quesType.name}</option>	
                    			</c:forEach>
							</select>
                    		</div>
                    	</div>
                     </c:if> --%>
                   <div class="widget-buttons">
                		<button type="button" onclick="queren()" class="btn btn-info btn-ok"> 确认</button>
                		<button type="button" onclick="fanhuishuoye()" class="btn btn-default"> 返回</button>
            	   </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
	/* function pdsboom1(orgId){
		$.ajax({
			url : "QuesTypeController/getquesType.htm?insId="+orgId,
			success : function(data) {
				
				$("#pid").find("option").remove();
				$("#pid").append('<option>-请选择要添加分类的父级分类-</option>');
				var data = eval("("+data+")");
				for(var i=0;i<data.length;i++){
				$("#pid").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>")
				}
				
			}
		});
		
	} */
</script>