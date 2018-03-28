<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!-- <script src="examination/questions/disrate.js"></script>  -->
<!-- <link href="assets/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />  -->
<script>
	var zTreeObj3;
	var setting3 = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : "0"
			},
	    key:{
	    	url:"###"
	    }
		}
	};
	var nodes3=${nodes};
	$.fn.zTree.init($("#treeDemo3"), setting3, nodes3); 
</script>
<div style="width:50%;float:left;">
<input id="questionsIdList" type="hidden" value="${questionsIdList}"/>
<input id="issuper" type="hidden" value="${issuper}"/>
<label>机构目录</label>
<ul id="treeDemo3" class="ztree"></ul>

</div>
<div style="width:50%;float:left;" id="menuTable2">
 </div>
<!--  <script src="assets/zTree_v3/js/jquery.ztree.all.js"></script> -->