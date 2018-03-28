<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>
<SCRIPT>
	var zTreeObj2;
	var setting2 = {
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
				$("#quesTypeList").load("QuestionsController/sonList.htm?pid=" + treeNode.id);
			},
		}
	};
	var nodes2 = ${nodes2};
	
	$(document).ready(function() {
		zTreeObj2 = $.fn.zTree.init($("#treeDemo2"), setting2, nodes2);
	});
</SCRIPT>

<label>题库分类目录</label>
<ul id="treeDemo2" class="ztree"></ul>

           