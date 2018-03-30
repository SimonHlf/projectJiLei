<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/with/with.js"></script>



<div class="btn-group">
  <!--   <button type="button" onclick="addAuction()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delAuction()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateAuction()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button> -->
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> 
</div>
<div style="margin-top:6px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按用户账号查找</span>
                    <input type="text" name="account" value="" class="form-control" placeholder="按用户账号查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <span class="widget-caption themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
           提现申请管理</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>用户账号</th>
                    <th>提现类型</th> 
                    <th>提现金额</th> 
                    <th>积分兑换金额</th> 
                    <th>提现银行</th>
                    <th>银行卡号</th>
                    <th>提现时间</th>
                    <th>提现状态</th>
                    <th>操作</th> 
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="with">
                        <tr>
                            <td><v:checkbox value="${with.wid}"/></td>
                            <td>${with.userAccount}</td>
                            <td>
                            	<c:if test="${with.type==1 }">
                            		余额提现
                            	</c:if>
                            	<c:if test="${with.type==2 }">
                            		积分提现
                            	</c:if>
                            </td>
                            <td>
                            	${with.money }
                            </td>
                            <td>
                            	${with.cash }
                            </td>
                            <td>${with.cardName }</td>
                            <td>${with.cardNo }</td>
                            <td id="shelf_${product.id }">
                            	${with.createTime }
                            </td>
                            <td>
                            	<c:if test="${with.status==1 }"><span style="color: green;">提现成功</span></c:if>
								<c:if test="${with.status==2 }"><span style="color: gray;">提现审核中</span></c:if>
								<c:if test="${with.status==3 }"><span style="color: red;">提现失败</span></c:if>
                            </td>
                            <td>
                            	<c:if test="${with.status==2 }">
	                            	<button class="btn btn-success" onclick="adopt(${with.wid},1,${with.money },${with.fid })">审核通过</button>
	                            	<button class="btn btn-success" onclick="adopt(${with.wid},3,${with.money },${with.fid })">审核拒绝</button>
                            	</c:if>
                            	<%-- <span id="operation_${product.id }">
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
                            	</c:if> --%>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="auction/withdraw/list.htm?1=1"></v:pagination>
    </div>                                                               
    </div>
</div>