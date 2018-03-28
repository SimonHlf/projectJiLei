<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>
<SCRIPT>
	var zTreeObj4;
	var setting4 = {
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
				
			},
		}
	};
	var nodes4 = ${nodes2};
	
	zTreeObj4 = $.fn.zTree.init($("#treeDemo4"), setting4, nodes4);
</SCRIPT>

<label>题库分类目录</label>
<ul id="treeDemo4" class="ztree"></ul>
