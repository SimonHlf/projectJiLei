<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/auctionProduct/productInfo.js"></script>



<div class="btn-group">
    <button type="button" onclick="addAuction()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delAuction()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateAuction()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> 
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
           竞拍商品管理</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>商品名</th>
                    <th>上传人</th> 
                    <th>是否未转拍商品</th> 
                   <!--  <th>起拍价</th> 
                    <th>每次出价增加幅度</th> 
                    <th>保证金</th> 
                    <th>竞拍开始时间</th>
                    <th>竞拍结束时间</th>-->
                     <th>状态</th>
                     <th>拍卖状态</th>
                    <th>操作</th> 
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="product">
                        <tr>
                            <td><v:checkbox value="${product.id}"/></td>
                            <td>${product.name}</td>
                            <td>${product.bidderName }</td>
                            <td>
                            	<c:if test="${product.thisStatus==2 }">
                            		否
                            	</c:if>
                            	<c:if test="${product.thisStatus==1 }">
                            		是
                            	</c:if>
                            </td>
                            <%-- <td>${product.startPrice}</td>
                            <td>${product.ladder}</td>
                            <td>${product.bond}</td> 
                            <td></td>
                            <td></td>--%>
                            <td id="shelf_${product.id }">
                            	<c:if test="${product.shelf==1}">已上架</c:if>
                            	<c:if test="${product.shelf==2}">已下架</c:if>
                            </td>
                            <td>
                            	<c:choose>
                            		<c:when test="${product.status==1 }">
                            			已成交
                            		</c:when>
                            		<c:otherwise>
                            			未成交
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                            <td>
                            	<button class="btn btn-success" onclick="setting(${product.id});">设置拍卖信息</button>
                            	<span id="operation_${product.id }">
                            		<c:if test="${product.shelf==1}">
                            			<button class="btn btn-danger" onclick="shelf(${product.id},2);">下架</button>
	                            	</c:if>
	                            	<c:if test="${product.shelf==2}">
	                            		<button class="btn btn-success" onclick="shelf(${product.id},1);">上架</button>
	                            	</c:if>
                            	</span>
                            	<c:if test="${product.upId ne null }">
	                            	<button class="btn btn-success" onclick="copyLink(${product.id},${product.upId });">复制链接</button>
                            		<input type="text" readonly="readonly" value="web/productInfoWeb/detail.htm?id=${product.id }&type=0&upId=${product.upId }&cmd=4" id="link_${product.id }">
                            	</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="product/productInfo/list.htm?1=1"></v:pagination>
    </div>                                                               
    </div>
</div>