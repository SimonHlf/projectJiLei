<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap-fileupload.min.css" />
<link rel="stylesheet" href="http://at.alicdn.com/t/font_486497_hl2e4pr88k1hh0k9.css"/>
<style>
	.basicInfoTxt{width:100%;height:30px;padding-left:8px;line-height:30px;margin:15px 0;font-size:16px;color:#666;position:relative;text-indent:100px;}
	.basicInfoTxt span{width:3px;height:20px;background:#2dc3e8;position:absolute;left:100px;top:5px;}
	.sureBtns button{width:130px;border-radius:4px;height:40px;border:none;background:#e74b37;color:#fff;line-height:40px;}
	.sureBtns button:hover{background:#c53d2b;}
</style>
<script type="text/javascript"
	src="assets/js/bootstrap-fileupload.min.js"></script>	
<!-- <script type="text/javascript" src="assets/js/adddate.js"></script>  -->
<script src="auction/rmbproduct/rmbproduct.js"></script> 

<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addProductForm"
				enctype="multipart/form-data">
				<div class="row">
					<p class="basicInfoTxt"><span></span>创建商品类别</p>
					<div class="comMargBot clearfix">
						<label class="col-sm-2 control-label no-padding-right">商品类别</label>
						<div class="col-sm-8">
							<select name="categoryId1" id="s1"
								onchange="sc(this.options[this.options.selectedIndex].value)">
								<option>一级分类</option>
								<c:forEach var="c" items="${category}">
									<option value="${c.id}">${c.shopTypeName}</option>
								</c:forEach>
							</select> 
							<select id="s2" name="categoryId"></select>
						</div>
					</div>
				</div>
				<input type="hidden" name="type" value="${type}" id="type">
			</form>
			<div class="row">
				<div class="sureBtns col-sm-8" style="height:40px;text-align:center;margin-left:16.6%;">
					<button onclick="setProduct()">确定创建此类商品</button>
				</div>
			</div>
			
		</div>
	</div>
</div>
