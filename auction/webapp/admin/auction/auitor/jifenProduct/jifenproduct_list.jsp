<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="auction/auitor/auitor.js"></script>
<div class="btn-group">
 <button type="button" onclick="setRecommend(${type})" class="btn btn-primary"><i class="fa fa-pencil"></i> 设为首页推荐</button>
	商品名称<input id="name" type="text" style="width: 80px; height: 33px" value="${name}">	
	是否审核通过<select id="verify">
				<c:if test="${verify ==null || verify =='' }">
					<option value="">请选择</option>
					<option value="0">待审核</option>
					<option value="1">通过</option>
					<option value="2">未通过</option>
				</c:if>
				<c:if test="${verify ==0}">
					<option value="">请选择</option>
					<option value="0" selected>待审核</option>
					<option value="1">通过</option>
					<option value="2">未通过</option>
				</c:if>
				<c:if test="${verify ==1}">
					<option value="">请选择</option>
					<option value="0">待审核</option>
					<option value="1" selected>通过</option>
					<option value="2">未通过</option>
				</c:if>
				<c:if test="${verify ==2}">
					<option value="">请选择</option>
					<option value="0">待审核</option>
					<option value="1">通过</option>
					<option value="2" selected>未通过</option>
				</c:if>
	         </select>     
	是否上架<select id="status">
				<c:if test="${status ==null || status =='' }">
					<option value="">请选择</option>
					<option value="0">已下架</option>
					<option value="1">已上架</option>
				</c:if>
				<c:if test="${status ==0 }">
					<option value="">请选择</option>
					<option value="0" selected>已下架</option>
					<option value="1">已上架</option>
				</c:if>
				<c:if test="${status ==1 }">
					<option value="">请选择</option>
					<option value="0">已下架</option>
					<option value="1" selected>已上架</option>
				</c:if>
	      </select> 
	         
	 类别<select name="categoryId1" id="s1" onchange="sc(this.options[this.options.selectedIndex].value)">
			<option value="">请选择一级分类</option>
			<c:forEach var="c" items="${cate}">
				<c:if test="${category.id == c.id}">
				<option value="${c.id}" selected>${c.shopTypeName}</option>
				</c:if>
				<c:if test="${category.id != c.id}">
				<option value="${c.id}">${c.shopTypeName}</option>
				</c:if>
			</c:forEach>
	      </select> 
	       
	   <select id="s2" name="categoryid"> 
	  		 <c:forEach var="c" items="${cate2}">
				<c:if test="${categoryid == c.id}">
				<option value="${c.id}" selected>${c.shopTypeName}</option>
				</c:if>
				
			</c:forEach>
	   </select>
 
	<button type="button" onclick="searchAuitorProduct('${type}')"
			class="btn btn-warning">
			<i class="fa fa-search"></i> 查询
	</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">积分商品列表</span>
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
                    <th>提交审核状态</th>
                    <th>平台审核状态</th>
                    <th>商品状态</th>
                    <th>是否推荐首页</th>
                   	<th>操作</th>
                    
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="n">
                        <tr>
                            <td><v:checkbox value="${n.id}"/></td>
                            <td><v:productcate aid="${n.categoryid}" type="false"></v:productcate>
                            </td>
                            <td>
                            <c:if test="${n.type==1}">现金商品</c:if>
                            <c:if test="${n.type==2}">金币商品</c:if>
                            <c:if test="${n.type==3}">积分商品</c:if>
                            </td>  
                            <td>${n.name}</td>
                            <td><img src="/${n.thumbnailurl}" width="50px" height="50px"></td>
                            <td> <c:forEach var="u" items="${users}">
									<c:if test="${n.shopid == u.id}">
										${u.name}
									</c:if>
								</c:forEach></td>
                            <td>${n.marketprice}</td>
                            <td>${n.price}</td>
                            <td>${n.costprice}</td>
                            <td>
                            <c:if test="${n.attr3=='1'}">
                            <label type="text" class="label label-success">已提交</label>
                            </c:if>
                            <c:if test="${n.attr3=='0'}">
                            <label type="text" class="label label-danger">未提交</label>
                            </c:if>
                            </td>
                            <td>
                            <c:if test="${n.verify==2}">
                            <label type="text" class="label label-danger">未通过</label>
                            </c:if>
                            <c:if test="${n.verify==1}">
                            <label type="text" class="label label-success">通过</label>
                            </c:if>
                            <c:if test="${n.verify==0}">
                            <label type="text" class="label label-info">待审核</label>
                            </c:if>
                            <c:if test="${n.verify==null}">
                           	无
                            </c:if>
                            </td>
                           
                            <td>
                            <c:if test="${n.status==1}">
                            <label type="text" class="label label-success">上架</label>
                            </c:if>
                            <c:if test="${n.status==0}">
                            <label type="text" class="label label-danger">下架</label>
                            </c:if>
                            </td>
                            <td>
	                            <c:if test="${n.recommendId==null}">
	                            		<label class="label label-info">未推荐</label>
	                            </c:if>
	                            <c:if test="${n.recommendId!=null}">
	                            		 <label class="label label-success">已推荐</label>
	                            </c:if>
                            </td>
                           <td>
                           		<button type="button" onclick="queryAuctionInfo(${n.id})" class="btn  btn-info">查看竞拍信息</button>
                           		<button type="button" onclick="auitorProduct(${n.id})" class="btn  btn-info">去审核</button>
                           </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="auction/rmbProductController/list.htm?type=${type}&name=${name}&status=${status}&categoryid=${categoryid}&verify=${verify}"></v:pagination>
        </div>
    </div>
</div>