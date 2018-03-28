<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>
<SCRIPT>
	var zTreeObj;
	var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : "types"
			},
	    key:{
	    	url:"###"
	    }
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				$("#quesTypeList").load("QuestionsController/sonList.htm?pid=" + treeNode.wid+"&level="+treeNode.level);
			},
		}
	};
	var nodes = ${nodes};
	
	zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
</SCRIPT>
<div class="btn-group">
    <button type="button" onclick="addGong()" class="btn btn-success" style="margin:5px 10px 0 15px;"><i class="fa fa-plus"></i>添加到当前题库</button>
    <button type="button" onclick="fanhui()" class="btn btn-success" style="margin-top:5px;"><i class="fa fa-arrow-left"></i>返回</button>
</div>
    <div style="margin-top:6px;">
        <form id="searchItemForm" method="post">
            <div class="row">
                <div class="form-group col-lg-4">
                </div>
            </div>
        </form>
    </div>
<div class="widget">
    
    <div class="widget-body">
    <div class="row">
    	<div class="clearfix" style="width:30%;float:left;margin-left:10px;">
    		<div style="width:50%;float:left;">
	    		<label>部门目录</label>
	             <ul id="treeDemo" class="ztree"></ul>
	         </div>
	         <div style="width:50%;float:left;" id="menuTable">
	         </div>
    	</div>
    	
    	<div class="widget-body" id="quesTypeList" style="float: left;width:69%;">
    	<div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th style="width:50%;">试题名称 </th>
                    <th>所属机构</th>
                    <th>试题类型</th>
                    <th>试题分类</th>
                    <th>详情</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>
              	   <c:forEach items="${questionsList}" var="Questions">
	                    <tr>
	                        <td><v:checkbox value="${Questions.id}"/></td>
	                        <td style="width:50%;">
		                        <c:choose>
			                        <c:when  test="${fn:contains(Questions.name,'image')}">
			                        	<img src="/${Questions.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
			                        </c:when >
			                        <c:otherwise>
			                        	 ${Questions.name }
			                        </c:otherwise>
	                        	</c:choose>
	                        </td>
	                        <td>${Questions.typeName}</td>
	                        <c:if test="${Questions.type==0}">
	                        	<td>单选题</td>
	                        </c:if>
	                        <c:if test="${Questions.type==1}">
	                        	<td>多选题</td>
	                        </c:if>
	                        <c:if test="${Questions.type==2}">
	                        	<td>判断题</td>
	                        </c:if>
	                        <td>${Questions.orgName}</td>
	                        <td><a href="javascript:xiangqing(${Questions.id},${page.page})">详情</a></td>
	                        <c:if test="${Questions.creatTime!=null && Questions.creatTime!=''}">
	                        <td>${Questions.creatTime}</td>
	                        </c:if>
	                        <c:if test="${Questions.creatTime==null || Questions.creatTime==''}">
	                        <td></td>
	                        </c:if>
	                        
	                    </tr>
	                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:pagination page="${page}" url="QuestionsController/searchGong.htm?1=1&pid=${pid}&name=${name}"></v:pagination>
        </div>
        </div>
    </div>
        
    </div>
</div>
<script>
	//查看详情
	function xiangqing(questionId,page){
		$.ajax({
			type:"post",
			url:"QuestionsController/getDetail.htm",
			data:{id:questionId,page:page},
			success:function(html){
				
				$("#mainContent").html(html);
			}
		})
	}
</script>
