<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>文化荟萃</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/cultural/css/cultural.css"/>
	</head>
	<body>
		<%@ include file="../../head.jsp"%>  
		
		<div class="peopleList w1100">
		<c:forEach items="${maplist}" var="meta">
			<div class="categDiv">
				<strong class="categTit">${meta.metaModel1.modelname}</strong>
				 <c:forEach items="${meta.listmap2}" var="m2">
					<div class="smCategDiv">
						<p class="smCategTit">${m2.metaModel2.modelname}</p>
						<ul class="listFamousPeo clearfix">
							<c:forEach items="${m2.list3}" var="info">
								<li><a href="javascript:metaInfo('${info.id}')" value="${info.id}"> <img src="/${info.photo}" width="158px" height="185px"/>
								</a>
									<p>${info.name}</p>
								</li>
							</c:forEach> 
						</ul>
					</div> 
				</c:forEach> 
			</div>
		</c:forEach>
		
	</div>
	
	<%@ include file="../../foot.jsp"%>  
		
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		
		<script type="text/javascript">
		function metaInfo(id){
			window.location.href="${pageContext.request.contextPath }/web/shop/metaInfoController/metaInfo.htm?id="+id;
			
		}
		
		
		</script>
	</body>
</html>
    