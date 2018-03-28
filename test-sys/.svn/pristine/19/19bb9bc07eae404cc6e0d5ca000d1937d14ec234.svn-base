<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<style type="text/css">
input[type=checkbox], input[type=radio]{opacity:1 !important;left:25px !important; top:1px;},    input[type=checkbox]{opacity:1 !important;left:25px !important; top:1px;}
.setImgPar{position:absolute;line-height:27px;right:0px;top:3px;}
.setImgPar span,.setImgPar div.radio{float:left;}  div.checkbox{float:left;}
.setImgPar div.radio{width:50px;padding-top:0px  !important;}
.setImgPar div.checkbox{width:50px;padding-top:0px  !important;}
.setImgPar div.radio label{width:100%;display:inline-block;text-indent:20px;}
.setImgPar div.checkbox label{width:100%;display:inline-block;text-indent:20px;}
</style>
<script>
function tabSwitch(obj){
	if(obj.value==0){
		var str = "<div class='radio'><label><input type='radio' name='answer'  value='A' checked>A</label></div>"+
		  "<div class='radio'><label><input type='radio' name='answer'  value='B'>B</label></div>"+
		  "<div class='radio'><label><input type='radio' name='answer'  value='C'>C</label></div>"+
		  "<div class='radio'><label><input type='radio' name='answer'  value='D'>D</label></div>";
		$("#danduo").html(str);
	}else if(obj.value==1){
		var str =   "<div class='checkbox'><label><input type='checkbox' name='answer'  value='A'>A</label></div>"+
			"<div class='checkbox'><label><input type='checkbox' name='answer'  value='B'>B</label></div>"+
			"<div class='checkbox'><label><input type='checkbox' name='answer'  value='C'>C</label></div>"+
			"<div class='checkbox'><label><input type='checkbox' name='answer'  value='D'>D</label></div>";
		$("#danduo").html(str);
	}else{
		
	}
}
</script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editDisRateForm">
                <input type="hidden" name="id" value="${questions.id}">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题名称</label>
                        <div class="col-sm-9">
                        	<c:choose>
		                        <c:when  test="${fn:contains(questions.name,'image')}">
		                        	<img src="/${questions.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
		                        	<input  type="file"  id="headImages1" name="headImages1" >
		                        </c:when >
		                        <c:otherwise>
		                        	 <textarea style="height:71px;" class="form-control" id="name" name="name" placeholder="试题名称" required>${questions.name }</textarea>
		                        </c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <c:if test="${result=='true'}">
                   <%--  <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                        	<select id="insIdss" name="insid" required onchange="pdsboom1(this.options[this.options.selectedIndex].value)">
                        		<option>--请选择机构--</option>
                        		<c:forEach items="${windyOrgList}" var="windyOrg">
                        			<option value="${windyOrg.id}">${windyOrg.name}</option>
                        		</c:forEach>
                        	</select>
                        </div>
                    </div> --%>
                    </c:if>
                    <%-- <c:if test="${result=='true'}">
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">试题分类</label>
                        	<div class="col-sm-9">
                        		<select id="quesIds" name="quesId" required>
                        			<option value="">--请选择试题类型--</option>
                        			<c:forEach items="${quesTypeList}" var="quesType">
                        				<option value="${quesType.id}">${quesType.name}</option>
                        			</c:forEach>
                        		</select>
                        	</div>
                    	</div>
                    </c:if> --%>
                    <%-- <c:if test="${result=='false'}">
                    	<div class="form-group">
                        	<label class="col-sm-2 control-label no-padding-right">试题分类</label>
                        	<div class="col-sm-9">
                        		<select id="quesId" name="quesId" required>
                        			<option value="">--请选择试题类型--</option>
                        			<c:forEach items="${quesTypeList}" var="quesType">
                        				<option value="${quesType.id}">${quesType.name}</option>
                        			</c:forEach>
                        		</select>
                        	</div>
                    	</div>
                    </c:if> --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题类型</label>
                        <div class="col-sm-9">
                        	<select id="type" name="type" required onclick="tabSwitch(this);">
                        		<c:if test="${questions.type==0 || questions.type==1 }">
	                        		<option>--选择试题类型--</option>
	                        		<option <c:if test="${questions.type==0 }">selected</c:if> value="0">单选</option>
	                        		<option <c:if test="${questions.type==1 }">selected</c:if> value="1">多选</option>
	                        	</c:if>
	                        	<c:if test="${questions.type==2 }">
                        			<option <c:if test="${questions.type==2 }">selected</c:if> value="2">判断</option>
                        		</c:if>
                        	</select>
                        </div>
                    </div>
                    
                     <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题题目</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="title" name="title" value="${questions.title}" placeholder="试题题目" required>
                        </div>
                    </div> --%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题图片</label>
                        <div class="col-sm-9">
                            <img src="/${questions.image}" style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
                            <input  type="file" id="headImages" name="headImages" >
                        </div>
                        
                    </div>
                   <c:choose>
                 		<c:when test="${questions.type==2 }">
                 			<div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">正确答案</label>
		                        <div class="col-sm-9">
									<select name="answer">
										<option <c:if test="${questions.answer==0 }">selected</c:if> value="0">正确</option>
										<option <c:if test="${questions.answer==1 }">selected</c:if> value="1">错误</option></select>
		                        </div>
		                    </div>
		                    <input type="file" style="display: none" id="headImagesA1" name="headImagesA">
		                    <input type="file" style="display: none" id="headImagesB1" name="headImagesB">
		                    <input type="file" style="display: none" id="headImagesC1" name="headImagesC">
		                    <input type="file" style="display: none" id="headImagesD1" name="headImagesD">
                 		</c:when>
                 		<c:otherwise>
                 		<div>
                 			<div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案A</label>
		                        <div class="col-sm-9">
		                            <c:choose>
				                        <c:when  test="${fn:contains(questions.optionA,'image')}">
				                        	<img src="/${questions.optionA}"  style="width: 50px;height: 50px" onclick="open_(this)"/>
				                        	<input type="file" id="headImagesA" name="headImagesA" placeholder="答案A" >
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" id="optionA" name="optionA" placeholder="答案A" required>${questions.optionA }</textarea>
				                        	<input type="file" style="display: none" id="headImagesA" name="headImagesA">
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案B</label>
		                        <div class="col-sm-9">
		                            <c:choose>
				                        <c:when  test="${fn:contains(questions.optionB,'image')}">
				                        	<img src="/${questions.optionB}"  style="width: 50px;height: 50px" onclick="open_(this)"/>
				                        	<input type="file" id="headImagesB" name="headImagesB" placeholder="答案B" >
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" id="optionB" name="optionB" placeholder="答案B" required>${questions.optionB }</textarea>
				                        	<input type="file" style="display: none" id="headImagesB" name="headImagesB">
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案C</label>
		                        <div class="col-sm-9">
		                            <c:choose>
				                        <c:when  test="${fn:contains(questions.optionC,'image')}">
				                        	<img src="/${questions.optionC}"  style="width: 50px;height: 50px" onclick="open_(this)"/>
				                        	<input type="file" id="headImagesC" name="headImagesC" placeholder="答案C" >
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" id="optionC" name="optionC" placeholder="答案C" required>${questions.optionC }</textarea>
				                        	<input type="file" style="display: none" id="headImagesC" name="headImagesC">
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">答案D</label>
		                        <div class="col-sm-9">
		                            <c:choose>
				                        <c:when  test="${fn:contains(questions.optionD,'image')}">
				                        	<img src="/${questions.optionD}"  style="width: 50px;height: 50px"  onclick="open_(this)"/>
				                        	<input type="file" id="headImagesD" name="headImagesD" placeholder="答案D" >
				                        </c:when >
				                        <c:otherwise>
				                        	 <textarea style="height:71px;" class="form-control" id="optionD" name="optionD" placeholder="答案D" required>${questions.optionD }</textarea>
				                        	<input type="file" style="display: none" id="headImagesD" name="headImagesD">
				                        </c:otherwise>
		                        	</c:choose>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-sm-2 control-label no-padding-right">正确答案</label>
		                        <div class="col-sm-9">
		                        <div class="setImgPar clearfix" style="left:85px;" id="danduo">
		                        	<c:if test="${questions.type==0 }">
				                        	<div class="radio">
											  <label>
											    <input type="radio" name="answer"  value="A" <c:if test="${questions.answer=='A' }">checked</c:if>>
											   		 A
											  </label>
											</div>
							           		<div class="radio">
											  <label>
											    <input type="radio" name="answer" value="B" <c:if test="${questions.answer=='B' }">checked</c:if>>
											   		 B
											  </label>
											</div>
											<div class="radio">
											  <label>
											    <input type="radio" name="answer"  value="C" <c:if test="${questions.answer=='C' }">checked</c:if>>
											   		 C
											  </label>
											</div>
							           		<div class="radio">
											  <label>
											    <input type="radio" name="answer" value="D" <c:if test="${questions.answer=='D' }">checked</c:if>>
											   		 D
											  </label>
											</div>
										
		                        	</c:if>
		                        	<c:if test="${questions.type==1 }">
				                        	<div class="checkbox">
											  <label>
											    <input type="checkbox" name="answer"  value="A" <c:if test="${fn:contains(questions.answer,'A')}">checked='checked'</c:if>>
											   		 A
											  </label>
											</div>
							           		<div class="checkbox">
											  <label>
											    <input type="checkbox" name="answer" value="B" <c:if test="${fn:contains(questions.answer,'B')}">checked='checked'</c:if>>
											   		 B
											  </label>
											</div>
											<div class="checkbox">
											  <label>
											    <input type="checkbox" name="answer"  value="C" <c:if test="${fn:contains(questions.answer,'C')}">checked='checked'</c:if>>
											   		 C
											  </label>
											</div>
							           		<div class="checkbox">
											  <label>
											    <input type="checkbox" name="answer" value="D" <c:if test="${fn:contains(questions.answer,'D')}">checked='checked'</c:if>>
											   		 D
											  </label>
											</div>
		                        	</c:if>
		                        	</div>
		                            <%-- <input class="form-control" id="answer" name="answer" value="${questions.answer}" placeholder="正确答案" required> --%>
		                        </div>
		                    </div>
		                </div>
                 		</c:otherwise>
                 	</c:choose>
                   
                     <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案E</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionE" name="optionE" value="${questions.optionE}">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案F</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionF" name="optionF" value="${questions.optionF}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">答案G</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="optionG" name="optionG" value="${questions.optionG}">
                        </div>
                    </div> --%>
                    <div class="form-group">
                       <label class="col-sm-2 control-label no-padding-right">是否锁定</label>
                       <div class="col-sm-9">
						<select name="attr8">
							<option <c:if test="${questions.attr8==0 }">selected</c:if> value="0">未锁定</option>
							<option <c:if test="${questions.attr8==1 }">selected</c:if> value="1">已锁定</option>
						</select>
                       </div>
                   </div>
                   <div class="widget-buttons" style="display:inherit;text-align:center;margin-top:15px;">
                		<button type="button" onclick="yesofUpdate()" class="btn btn-info btn-ok"> 确认</button>
                		<button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button>
            	   </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>


function pdsboom1(data) {
	alert("ddd")
	
	$("#quesIds").find("option").remove();
	$("#quesIds").append('<option>--请选择--</option>');
	
	$.ajax({
		url : "QuestionsController/quesTypeList.htm?orgId=" + data,/* 这是父类的id */
		success : function(data) {/* 子类的数据 */
			/* console.log(data) */
			var data = eval("("+data+")");
			for(var i=0;i<data.length;i++){
			$("#quesIds").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>")
			}
			
		}
	});
}




$(function(){
	//机构
	/* var select4 = document.querySelector('select#insIdss'); 
	
	
	var option4 = select4.querySelectorAll('option');
	var len4 = option4.length;
	var i4;
	var selectValue4='${insId}';
	
	for(i = 0; i < len4; i++){
		  if(option4[i].value==selectValue4){
		    option4[i].selected = true;
		    break;
		  }
	}*/ 
	
	
	
	
	//类型
	/* var select5 = document.querySelector('select#quesIds'); 
	var option5 = select5.querySelectorAll('option');
	var len5 = option5.length;
	var i5;
	var selectValue5='${questions.quesId}';
	
	for(i = 0; i < len5; i++){
		  if(option5[i].value==selectValue5){
		    option5[i].selected = true;
		    break;
		  }
		} */
	
	/*var select3 = document.querySelector('select#type'); 
	var option3 = select3.querySelectorAll('option');
	var len3 = option3.length;
	var i3;
	
	var selectValue3='${questions.type}';
	
	for(i = 0; i < len3; i++){
		  if(option3[i].value==selectValue3){
		    option3[i].selected = true;
		    break;
		  }
		}
	
	
	
	var select2 = document.querySelector('select#isShare'); 
	var option2 = select2.querySelectorAll('option');
	var len2 = option2.length;
	var i2;
	var selectValue2='${questions.isShare}';
	
	for(i = 0; i < len2; i++){
		  if(option2[i].value==selectValue2){
		    option2[i].selected = true;
		    break;
		  }
		}
	
	*/
	
	
	
	
	
	//试题分类
	/* var select6 = document.querySelector('select#quesId'); 
	var option6 = select6.querySelectorAll('option');
	var len6 = option6.length;
	var i6;
	var selectValue6='${questions.quesId}';
	
	for(i = 0; i < len6; i++){
		  if(option6[i].value==selectValue6){
		    option6[i].selected = true;
		    break;
		  }
		} */
	
	
	
	
	
	
	
}) 




</script>

