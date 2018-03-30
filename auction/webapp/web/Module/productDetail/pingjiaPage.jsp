<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${commentmaplist.size()==0}">

</c:if>
<c:if test="${commentmaplist.size()>0}">
	<c:forEach items="${commentmaplist}" var="c">
		<tr>
			<td class="tdWid1">
				<div class="contentPart">
					<p>
						${c.comment.content}
					</p>
				</div>
				 <div class="imgPart clearfix">
					<ul id="proImgUl1" class="clearfix">
						<c:forEach items="${c.imgs}" var="p">
							<li id="${p.id}" onclick="showBigImg(this)" data-src="/${p.bigimg}">
								<img src="/${p.smallimg}"/>
								<b class="photosArrow"></b>
							</li>
						</c:forEach>
					</ul>
					<div id="proImg1" class="photoViewer">
						<span onclick="closeBigImg('proImg1')"></span>
						<img id="bigPreviewImg1" class="bigPreviewImg" src=""/>
					</div>
				</div>
				<div class="timePart">
					<p>${c.comment.commenttime}</p>
				</div>
			</td>
			<td class="tdWid2">
				<div class="rateSku">
					<p><span>${c.comment.specComment}</span></p>
					
				</div>
			</td>
			<td class="tdWid2">
				<div class="rate-user-info">
					${c.comment.nickName}<span>***</span>${c.comment.nums} <span></span>
					<%-- X<span>***</span>5 <span>（匿名）</span> --%>
				</div>
			</td>
		</tr>
	</c:forEach>
</c:if>
