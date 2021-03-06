<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="auction/rmbproduct/rmbproduct.js"></script>
<div class="btn-group">
    <button type="button" onclick="addRmbProduct()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delRmbProduct()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editProduct()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
	商品名称<input id="name" type="text" style="width: 80px; height: 33px">	
	是否上架<select id="status">
				<option value="">请选择</option>
				<option value="0">已下架</option>
				<option value="1">已上架</option>
	         </select> 
	 类别<select name="categoryId1" id="s1" onchange="sc(this.options[this.options.selectedIndex].value)">
			<option>请选择一级分类</option>
			<c:forEach var="c" items="${cate}">
				<option value="${c.id}">${c.shopTypeName}</option>
			</c:forEach>
	      </select> 
	      <select id="s2" name="categoryid"> </select>
		<button type="button" onclick="searchProduct('${type}')"
			class="btn btn-warning">
			<i class="fa fa-search"></i> 查询
		</button>

</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">现金商品列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>商品分类</th>
                    <th>商品类型</th>
                    <th>商品名称</th>
                    <th>商品缩略图</th>
                    <th>商家</th>
                    <th>市场价</th>
                    <th>现价</th>
                    <th>成本价</th>
                    <th>状态</th>
                    <th>操作</th>
          
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="n">
                        <tr>
                            <td><v:checkbox value="${n.id}" name=""/></td>
                            <td><v:productcate aid="${n.categoryid}" type="false"></v:productcate>
                            </td>
                            <td>
                            <c:if test="${n.type==1}">现金商品</c:if>
                            <c:if test="${n.type==2}">金币商品</c:if>
                            <c:if test="${n.type==3}">积分商品</c:if>
                            </td>  
                            <td>${n.name}</td>
                            <td><img src="/${n.thumbnailurl}" width="50px" height="50px"></td>
                            <td>
                            <c:forEach var="u" items="${users}">
									<c:if test="${n.shopid == u.id}">
										${u.name}
									</c:if>
								</c:forEach>
 
                            </td>
                            <td>${n.marketprice}</td>
                            <td>${n.price}</td>
                            <td>${n.costprice}</td>
                            <td>
	                                <c:if test="${n.status==1}">
		                            <button type="text" class="btn  btn-success">上架</button>
		                            </c:if>
		                            <c:if test="${n.status==0}">
		                            <button type="text" class="btn  btn-danger">下架</button>
		                            </c:if>
	                         </td>
							<td>
								 <c:if test="${n.status==1}">
	                            <button type="button" onclick="down(${n.id})"
											class="btn  btn-success">下架</button>
	                            </c:if>
	                            <c:if test="${n.status==0}">
	                            <button type="button" onclick="up(${n.id},'${n.verify}','${n.type}','')"
											class="btn  btn-danger">上架</button>
	                            </c:if>
	                            <%-- <button type="button" onclick="geturl('${n.id}')"
										class="btn btn-info">
										 获取路径
								</button> --%>
								
								 <button class="btn btn-success" onclick="copyLink(${n.id});">复制链接</button>
                          		 <input type="text" readonly="readonly" value="web/shop/productDetailApi/toRmbProDetailJsp.htm?pid=${n.id}" id="link_${n.id}">
							</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="auction/rmbProductController/list.htm?type=${type}"></v:pagination>
        </div>
    </div>
</div>