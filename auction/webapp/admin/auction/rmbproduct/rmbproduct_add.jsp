<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addRmbProductForm" enctype="multipart/form-data">
                	<div class="form-group">
                    	<label class="col-sm-2 control-label no-padding-right">类别</label>
						<div class="col-sm-4">
							<select name="categoryId1" id="s1"
								onchange="sc(this.options[this.options.selectedIndex].value)">
								<option>一级分类</option>
								<c:forEach var="c" items="${category}">
									<option value="${c.id}">${c.shopTypeName}</option>
								</c:forEach>
							</select> <select id="s2" name="categoryid">
							</select>
						</div>
					</div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">商家</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="shopid" name="shopid" placeholder="商家" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">商品名称</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" placeholder="商品名称" required>
                        </div>
                    </div>
 
                   <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">商品缩略图</label>
						<div class="col-md-10">
						 <input type="file" class="default" name="picture" id="imgs" required/>
						</div>
					</div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">市场价</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="marketprice" name="marketprice" placeholder="市场价" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">现价</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="price" name="price" placeholder="现价" required>
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">折扣价</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="discount" name="discount" placeholder="折扣价" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">成本价</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="costprice" name="costprice" placeholder="成本价" required>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">商品简介</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="briefly" name="briefly" placeholder="商品简介" required></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">搜索关键词</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="keywords" name="keywords" placeholder="搜索关键词" required>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">运费</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="transportationcost" name="transportationcost" placeholder="运费" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">评价标签</label>
                        <div class="col-sm-4">
							<div class="checkbox" id="tag">
								<v:Tag></v:Tag>
							</div>
						</div>
                    </div> 
                </div>
            </form>
        </div>
    </div>
</div>
