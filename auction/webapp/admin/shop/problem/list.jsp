<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/problem/problem.js"></script>



<div class="btn-group">
    <button type="button" onclick="ajaxLoad('shop/problem/add.jsp')" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delAuction()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateAuction()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
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
                    <th>常见问题</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="problem">
                        <tr>
                            <td><v:checkbox value="${problem.id}"/></td>
                            <td>${problem.subject}</td>
                            <td>
                            	<button class="btn btn-success" onclick="find(${problem.id})">查看</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="auction/auctionLog/list.htm?1=1&setUpId=${setId }&auctionId=${productId }"></v:pagination>
    </div>                                                               
    </div>
</div>