<%@ page contentType="text/html;charset=UTF-8"%>
<script
	src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<input type="hidden" id="url" value="${url }">
<script>
$(document).ready(function(){
	var url=$("#url").val();
	window.location.href=url;
})
</script>