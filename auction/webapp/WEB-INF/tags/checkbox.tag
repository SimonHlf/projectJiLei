<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="css" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="value" required="false" type="java.lang.String"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="bs" required="false" type="java.lang.String"%>
<%
	if (value == null)
		value = "-2";
	request.setAttribute("value", value);
	if (id == null)
		id = "selAll";
	request.setAttribute("id", id);
%>
<div class="checkbox ${css}">
	<label> <c:choose>
			<c:when test="${bs == '1' }">
				<input type='checkbox' value='${value}' name='${name}' id='${id}'
					checked="checked">
			</c:when>
			<c:otherwise>
				<input type='checkbox' value='${value}' name='${name}' id='${id}'>
			</c:otherwise>
		</c:choose> <span class="text">${label}</span>
	</label>
</div>
<script>
	$("#selAll").click(
			function() {
				if ($(this).prop("checked")) {
					$(this).parents("table").find("input[type='checkbox']")
							.prop("checked", true);
				} else {
					$(this).parents("table").find("input[type='checkbox']")
							.prop("checked", false);
				}
			});
</script>