<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- proTag -->
					<div class="tagDiv clearfix">
						<div class="leftTagTit">
							<p>与描述相符</p>
							<strong>${fenshu}</strong>分
						</div>
						<div class="rightTagList">
							<ul id="evaTag">
								<c:forEach items="${taglist}" var="tag">
									<li >
										<label onclick="queryByTag(${tag.id})">
											<input type="radio" name="commentTag" />
											<span id="tag_${tag.id}">${tag.tagName}
											<c:if test="${tag.num==null}">(0)</c:if>
											<c:if test="${tag.num!=null}">(${tag.num})</c:if>
											</span>
										</label>
									</li>
								</c:forEach>	
								
							</ul>
						</div>
					</div>
					<!-- 评论主要内容 -->
					<div class="mainComment">
						<table class="commentTab" cellpadding="0" cellspacing="0" id="listProUl" >
							
						</table>
						<div id="Pagination1" class="pagination"></div>
					</div>

		<script>
			var pageSize = '${page.pageSize}';
			var tagId='${tagId}';
			/* $(function(){
			
				showPageMBInfo1();
			}) */
			
			//分页用
			function showPageMBInfo1(){
				var allCount = '${page.total}';
			    $("#Pagination1").pagination(allCount, {
			        callback: pageselectCallback1,  //PageCallback() 为翻页调用次函数。
			        prev_text: "上一页",
			        next_text: "下一页 ",
			        items_per_page:pageSize,
			        ellipse_text:"...",
			        num_edge_entries: 1,       //两侧首尾分页条目数
			        num_display_entries: 3   //连续分页主体部分分页条目数
			    });
			}
			//显示出列表数据
			function pageselectCallback1(page_index,jq){
				getMBList1(page_index+1,pageSize);
			}
			function getMBList1(page,pageSize){
				var pid=$("#pid").val();
				$.ajax({
					type : "post",
					data:{page:page,pageSize:pageSize,pid:pid,tagId:tagId},
					url : "${pageContext.request.contextPath }/web/shop/productDetailApi/commentTagPage2.htm",
					success : function(html) {
						//$("#listProUl").html(html);
						if(html.trim()==""){
							$("#Pagination1").hide();
							$("#listProUl").html("<div class='noDataDiv'><img src='${pageContext.request.contextPath }/web/images/noDataImg.png'/><p>暂无数据</p></div>");
						}else{
							$("#listProUl").html(html);
						}
					}
				});
			}
			
		</script>
