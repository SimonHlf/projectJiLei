<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/auction/auction.js"></script>



<div class="btn-group">
    <%-- <button type="button" onclick="addAuction()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delAuction(${productId},${setId })" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateAuction()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button> 
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> --%>
    <button type="button" onclick="fh(${productId})" class="btn btn-success"><i class="fa fa-search"></i> 返回</button> 
</div>
<div style="margin-top:6px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按商品名字查找</span>
                    <input type="text" name="name" value="" class="form-control" placeholder="按商品名字查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <span class="widget-caption themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
          竞拍记录列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>竞拍商品</th>
                    <th>竞价者</th> 
                    <th>出价金额</th> 
                    <th>出价时间</th> 
                    <th>是否成交</th> 
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="auction">
                        <tr>
                            <td><v:checkbox value="${auction.id}"/></td>
                            <td>${auction.name}</td>
                            <td>${auction.bidder }</td>
                            <td>${auction.offer}</td>
                            <td>${auction.createTime}</td>
                            <td id="status_${auction.id }">
                            	<c:if test="${auction.status==0 }">
                            		未成交
                            	</c:if>
                            	<c:if test="${auction.status==1 }">
                            		已成交
                            	</c:if>
                            	<c:if test="${auction.status==2 }">
                            		撤回
                            	</c:if>
                            </td>
                            <td id="an_${auction.id }">
                            	<c:choose>
                            		<c:when test="${flag==1}">
                            			
                            		</c:when>
                            		<c:otherwise>
                            			<c:if test="${auction.status==0 }">
		                            		<a class="btn btn-success" onclick="cj(${auction.id},1,${auction.setUpId },${auction.productId })" >成交</a>
		                            		<%-- <a class="btn btn-success" onclick="cj(${auction.id},2,${auction.setUpId },${auction.productId })" >撤回</a> --%>
		                            	</c:if>
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="auction/auctionLog/list.htm?1=1&setUpId=${setId }&auctionId=${productId }"></v:pagination>
    </div>                                                               
    </div>
</div>