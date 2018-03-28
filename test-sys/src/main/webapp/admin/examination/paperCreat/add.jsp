<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addDisrelationshipForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试卷名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="试卷名称" required>
                        </div>
                    </div>
                    <c:if test="${result=='true'}">
                    	<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                            <select id="insId" name="insId" onchange="pds(this.options[this.options.selectedIndex].value)">
                            	<option>--请选择机构--</option>
                            	<c:forEach items="${WindyOrgList}" var="WindyOrg">
                            		<option value="${WindyOrg.id}">${WindyOrg.name}</option>
                            	</c:forEach>
                            </select>
                        </div>
                    </div>
                    </c:if>
                    <%-- <c:if test="${result=='true'}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属分类</label>
                        <div class="col-sm-9">
                            <select id="quesIds" name="paperTypeId" required>
                        			<option value="">--请选择试题类型--</option>
                        	</select>
                        </div>
                    </div>
                    </c:if> --%>
                    
                    <%-- <c:if test="${result=='false'}">
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">所属分类</label>
                        	<div class="col-sm-9">
                            	<select id="quesId" name="paperTypeId" required>
                        			<option value="">--请选择试题类型---</option>
                        			<c:forEach items="${quesTypeList}" var="quesType">
                        				<option value="${quesType.id}">${quesType.name}</option>
                        			</c:forEach>
                        		</select>
                        	</div>
                    	</div>
                    </c:if> --%>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">生成方式</label>
                        <div class="col-sm-9">
                        	<select id="set" name="sets">
                        		<option >--请选择生成方式--</option>
                        		<option value="0">自动</option>
                        		<option value="1">手动</option>
                        	</select>
                           
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试卷类型</label>
                        <div class="col-sm-9">
                            <select id="type" name="types">
                            	<option >--请选择类型--</option>
                            	<option value="0">练习</option>
                            	<option value="1">考试</option>
                            </select>
                        </div>
                    </div>

                    
                    <!-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">单选题数量</label>
                        <div class="col-sm-3">
                           <input class="form-control" name="attr6" id="danxuanti"/>
                        </div>
                        <div class="col-sm-2 comNoteTxt" style="top: 6px;padding-left: 0px;">道</div>

                    <div style="display:none;">
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">单选题数量</label>
	                        <div class="col-sm-3">
	                           <input class="form-control" name="attr6" id="danxuanti"/>
	                        </div>
	                        <div class="col-sm-2 comNoteTxt" style="top: 6px;padding-left: 0px;">道</div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">多选题数量</label>
	                        <div class="col-sm-3">
	                           <input class="form-control" name="attr7" id="panduanti"/>
	                        </div>
	                        <div class="col-sm-2 comNoteTxt" style="top: 6px;padding-left: 0px;">道</div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">判断题数量</label>
	                        <div class="col-sm-3">
	                           <input class="form-control" name="attr8" id="duoxuanti"/>
	                        </div>
	                        <div class="col-sm-2 comNoteTxt" style="top: 6px;padding-left: 0px;">道</div>
	                    </div>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">多选题数量</label>
                        <div class="col-sm-3">
                           <input class="form-control" name="attr7" id="panduanti"/>
                        </div>
                        <div class="col-sm-2 comNoteTxt" style="top: 6px;padding-left: 0px;">道</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">判断题数量</label>
                        <div class="col-sm-3">
                           <input class="form-control" name="attr8" id="duoxuanti"/>
                        </div>
                        <div class="col-sm-2 comNoteTxt" style="top: 6px;padding-left: 0px;">道</div>
                    </div> -->

                    <!-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">状态</label>
                        <div class="col-sm-9">
                           <select id="status" name="statuss">
                           		<option >--请选择状态--</option>
                           		<option value="0">预览</option>
                           		<option value="1">确定</option>
                           </select>
                        </div>
                    </div> -->
                    
                </div>
            </form>
        </div>
    </div>
</div>
<script>


	/* function pdsboom1(data){
		
		alert("ddde");
		 $.ajax({
			url : "PaperCreatController/PaperTypeList.htm?orgId="+data,
			success : function(data) {
				
				var data = eval("("+data+")");
			alert(data[0]);
				for(var i=0;i<data.length;i++){
				$("#quesIds").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>")
				}
				
			}
		}); 
	} */
</script>