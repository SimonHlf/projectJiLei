<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="pro">
	<p>${pcCategory.shopTypeName}</p>
	<div class="proImg">
		<c:forEach items="${twocategories}" var="n">
			<a href="">
				<div class="imgDiv">
					<img src="/${n.shopTypeLogo}" alt="" />
				</div>
				<p>${n.shopTypeName}</p>
			</a>
		</c:forEach>

	</div>
</div>
