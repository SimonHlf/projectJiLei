<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>
<SCRIPT>
	var zTreeObj3;
	var type = '${type}';
	var setting3 = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : 0
			},
	    key:{
	    	url:"###"
	    }
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				$(".nowTikuP").show();
				$("#sttype").val(treeNode.id)
				$("#sttype1").val(treeNode.id)
				$("#nowTiku").html(treeNode.name);
				$("#quesTypeList").load("analysis/sonList.htm?orgId=" + treeNode.id+"&type="+'${type}');
				if(type==2){
					hideMenu();
				}
			},
		}
	};



	
	var nodes3 = ${nodes3};
	
	$(document).ready(function() {
		zTreeObj3 = $.fn.zTree.init($("#treeDemo3"), setting3, nodes3);
	});
</SCRIPT>
	 <!-- <div class="widget-body" id="quesTypeList" style="float: left;width:83%;"> -->
	  	<div class="flip-scroll" >
	                <table class="table table-bordered table-striped table-condensed flip-content">
	                    <thead class="flip-content bordered-palegreen">
	                    <tr>
	                        <th>题名称</th>
	                        <th>出题总数(个)</th>
	                        <th>正确总数(个)/正确率(%)</th>
	                        <th>错误总数(个)/错误率(%)</th>
	                    </tr>
	                    </thead>
	                    <tbody>
	                     <c:forEach items="${list}" var="list">
	                        <tr>
	                            <td>
	                            	<c:choose>
	                        <c:when  test="${fn:contains(list.name,'image')}">
	                        	<img src="/${list.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
	                        </c:when >
	                        <c:otherwise>
	                        	 ${list.name }
	                        </c:otherwise>
	                      	</c:choose>
	                            </td>
	                            <td align="center">${list.count }</td>
	                            <td align="center">${list.countTrue }/${list.correctRate }%</td>
	                            <td align="center">${list.countErrir }/${list.errorRate }%</td>
	                        </tr>
	                    </c:forEach> 
	                    </tbody>
	                </table>
	                <c:if test="${empty list }">
				      	<div style="width:100%;height:35px;line-height:35px;text-align:center;margin-top:20px;">暂无数据!</div>	
				     </c:if>
				     <c:if test="${!empty list }">
				     	<input type="hidden" id="DisrelationshipPage" value="${page.page}">
	         	 		<v:papers page="${page}" url="analysis/getFatherQuestionType2.htm?1=1&pid=${orgId }&type=${type }"></v:papers> 
				     </c:if>  
	    	</div>
	  <!--   </div> -->          