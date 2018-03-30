<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/auctionProduct/productInfo.js"></script>



<div class="btn-group">
    <button type="button" onclick="add(${id})" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="del(${id})" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="update(${id})" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="fh()" class="btn btn-success"><i class="fa fa-search"></i> 返回</button>
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
                    <th width="44px;"><v:checkbox /></th>
                    <th>起拍价</th> 
                    <th>每次出价增加幅度</th> 
                    <th>保证金</th>
                    <th>竞拍开始时间</th>
                    <th>竞拍结束时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="product">
                        <tr>
                            <td><v:checkbox value="${product.id}"/></td>
                            <td>${product.startPrice}</td>
                            <td>${product.ladder}</td>
                            <td>${product.bond}</td>
                            <td>${product.startTime}</td>
                            <td>${product.endTime}</td>
                            <td>
                           		<button class="btn btn-success" onclick="details(${product.id},${product.auctionId });">查看拍卖详情</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
    </div>                                                               
    </div>
</div>