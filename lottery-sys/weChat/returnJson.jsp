<%@ page language="java" pageEncoding="utf-8" contentType="text/json; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 {
<c:forEach items="${nvps}" var="item">
	"${item.name}":"${item.value}",
</c:forEach>
"_1": "-1"}