<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>

<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addDisRateForm">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题题目</label>
                        <div class="col-sm-9">

                            <textarea class="form-control" id="name" name="name" placeholder="试题题目" required></textarea>
                        </div>
                    </div>
                    <c:if test="${result=='true'}">
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">试题分类</label>
                        	<div class="col-sm-2">
                        		<select id="orgId" name="orgId" placeholder="试题名称" required onchange="pdsboom1(this.options[this.options.selectedIndex].value)">
                        			<option value="">--请选择试题类型--</option>
                        			 <c:forEach items="${windyOrgList}" var="windyOrg">
                        				<option value="${windyOrg.id}">${windyOrg.name}</option>
                        			 </c:forEach>
                        		</select>
                        	</div>
                        	<div class="col-sm-2">
                        		<select id="typeId" name="quesId" required>
                        			<option value="">--请选择试题类型--</option>
                        		</select>
                        	</div>
                        	
                    	</div>
                    </c:if>
                    <c:if test="${result=='false'}">
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">试题分类</label>
                        	<div class="col-sm-9">
                        		<select id="quesId" name="quesId" placeholder="试题名称" required>
                        			<option value="">--请选择试题类型--</option>
                        			<%-- <c:forEach items="${quesTypeList}" var="quesType"> --%>
                        				<%-- <option value="${quesType.id}">${quesType.name}</option> --%>
                        				<option value="1">专业知识</option>
                        				<option value="2">规章/制度</option>
                        				<option value="3">综合</option>
                        				<option value="4">专题考试</option>
                        			<%-- </c:forEach> --%>
                        		</select>
                        	</div>
                        	<div class="col-sm-9">
                        		<select id="quesId" name="quesId" required>
                        			<option value="">--请选择试题类型--</option>
                        				<option value="5">正常行车</option>
                        				<option value="6">非正常行车</option>
                        		</select>
                        	</div>
                        	<div class="col-sm-9">
                        		<select id="quesId" name="quesId" required>
                        			<option value="">--请选择试题类型--</option>
                        				<option value="5">正常行车</option>
                        				<option value="6">非正常行车</option>
                        		</select>
                        	</div>
                    	</div>
                    </c:if>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题图片</label>
                        <div class="col-sm-9">
                            <input  type="file" id="headImages" name="headImages" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">正确答案</label>
                        <div class="col-sm-9">
							<select>
								<option value="0">正确</option>
								<option value="1">错误</select>
                        </div>
                    </div>
                   <div class="widget-buttons">
                		<button type="button" onclick="yes()" class="btn btn-info btn-ok"> 确认</button>
                		<button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button>
            	   </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
$("#headImages").change(function (e) {
	
	var file, img;
	if ((file = this.files[0])) {
		
		fileSize=file.size;
	}
	if (fileSize > 0) {
	    
		if (fileSize> 2*1024*1024) {
	       alert("图片大小不能超过2MB！");
	       var files = document.getElementById("headImages");
	       files.value="";
		}
	}
	
	});
	
	/* function pdsboom1(data){
		$("#insid option[value='pdss1']").remove();
		
		$.ajax({
			url : "QuestionsController/quesTypeList.htm?orgId="+data,
			success : function(data) {
				
				var data = eval("("+data+")");
			alert(data[0]);
				for(var i=0;i<data.length;i++){
				$("#quesId").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>")
				}
				
			}
		});
	} */
</script>