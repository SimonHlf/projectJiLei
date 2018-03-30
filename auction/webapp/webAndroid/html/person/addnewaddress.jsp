<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" http-equiv="Content-Type">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<title>玉商通</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webAndroid/dist/css/com/headercom1.css">
		<link rel="stylesheet"  href="${pageContext.request.contextPath }/webAndroid/dist/css/person/addnewaddress.css">
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath }/webAndroid/jslib/swiper/css/swiper-3.4.1.min.css" />
		<link href="${pageContext.request.contextPath }/webAndroid/jslib/jqueryarea/area.css" rel="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/swiper/js/swiper-3.4.1.min.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/jquery-1.11.0.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/jslib/jqueryarea/jquery-1.9.1.js" ></script>
    	<script type="text/javascript" src="${pageContext.request.contextPath }/webAndroid/jslib/jqueryarea/area.js"></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/com/com.js" ></script>
		<script src="${pageContext.request.contextPath }/webAndroid/js/person/addnewaddress.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<div id="container">
			<header id="aboutHeader">
				<div class="aBack">
					<a href="javascript:void(0);"><em class="iconfont">&#xe600;</em></a>
				</div>
				<div class="aUs">新增收货地址</div>
				<div class="aMore">
					<em class="iconfont">&#xe617;</em>
				</div>
			</header>
				<!----------------------------morelistss--------------------------->
			<ul id="moreCon">
				<li class="active">
					<a href="/src/html/home/index.html">
						<em class="iconfont">&#xe6d9;</em><span>首页</span>
					</a>
				</li>
				<li>
					<a href="/src/html/kind/prokind/kind.html">
						<em class="iconfont">&#xe601;</em><span>分类搜索</span>
					</a>
				</li>
				<li>
					<a href="index.html">
						<em class="iconfont">&#xe636;</em><span>购物车</span>
					</a>
				</li>
				<li>
					<a href="person.html">
						<em class="iconfont">&#xe607;</em><span>个人中心</span>
					</a>
				</li>
			</ul>
			<!-------------------------------main区--------------------------->
			<div id="main">
				<form class="addrMsg">
					<p> 
					   <label for="person">收货人:</label>
				       <input type="text"  name="condigneeName" id="buyer_Name" placeholder="请填写收货人姓名"/>
					</p>
				     <p>
				     	<label for="phone">联系电话:</label>
				        <input type="text" name="telephone" id="telPhone" maxlength="11" placeholder="请填写您的手机号码"/>
				     </p>
				     <p id="selectArea">
				     	所在区域 
					    <input class="address_input1" onclick="getProvinceBuy()"  type="text"  placeholder="请选择地区" id="shengshi"readonly="readonly"><b>></b>
						<select id="province"  name="provinceId" onchange="pdsboom1(this.options[this.options.selectedIndex].value)"> 
								<option value="">请选择省</option>
								<c:forEach items="${provinces}" var="p">${p.regionid}
									<option value="${p.regionid}">${p.regionname}</option>
								</c:forEach>
							</select>
							<select id="city" name="cityId"></select>
							<select id="district" name="areaId"></select>	     	
				     </p>
				      <p>
				      	<label for="dec">详细地址</label></br>
				        <input class="inpt" name="liveAddress" id="detailAddress" placeholder="建议您如实填写详细收货地址" />
				     </p>
				   
				     
				</form>
				
				<div class="btn">
					<p><a href="javascript:void(0);" onclick="saveAddress()">保存收货地址</a></p>
				</div>
			</div>
			<div class="transparent-bg"></div>
		</div>
		<script type="text/javascript">
		

        function pdsboom1(a) {
         	$("#province option[value='pdss1']").remove();
        	$("#city").find("option").remove();
        	$("#district").find("option").remove();
        	$.ajax({
        		url : "${pageContext.request.contextPath }/web/shop/consigneeApi/selectRegions.htm?parentid=" + a,
        		success : function(data) {
        			//var data = eval("("+data+")");
        			var str="<option value=''>---市---</option>";
        			for(var i=0;i<data.length;i++){
        				str+="<option value='"+data[i].regionid+"'>"+data[i].regionname+"</option>";
        			}
        			$("#city").append(str);
        		}
        	});
        }
        
  
	 $("#city").change(function (){
		 $("#city option[value='pdss2']").remove();
			$("#district").find("option").remove();
			$.ajax({
				url : "${pageContext.request.contextPath }/web/shop/consigneeApi/selectRegions.htm?parentid=" + $(this).val(), 
				success : function(data) {
					//var data = eval("("+data+")");
					var str="<option value=''>---区---</option>";
					for(var i=0;i<data.length;i++){
						str+="<option value='"+data[i].regionid+"'>"+data[i].regionname+"</option>";
					}
					$("#district").append(str);
				}
			});
	 });
	
	//保存用户的收货地址
		function saveAddress(){
			
			var buyerName = getId("buyer_Name").value;
			var province = getId("province").value;
			var city = getId("city").value;
			var areaVal = getId("district").value;
			var detailAddress = getId("detailAddress").value;
			var mobile = getId("telPhone").value;
		 	if(buyerName == ""){
				$("#buyer_Name").focus();
				layer.msg("收货人姓名不能为空");
				return false;
			}else if(buyerName.length > 8){
				$("#buyer_Name").focus();
				layer.msg("收货人姓名长度不能超过8个字符");
				return false;
			}else if(!(/^[\u4E00-\u9FA5]+$/).test(buyerName)){
				$("#buyer_Name").focus();
				layer.msg("收货人姓名是应为中文姓名");
				return false;
			}else if(province == ""){
				layer.msg("请选择地区");
				return false;
			}else if(detailAddress==""){
				$("#detailAddress").focus();
				layer.msg("请填写您的详细收货地址");
				return false;
			}else if(mobile == ""){
				$("#telPhone").focus();
				layer.msg("请填写您的手机号码");
				return false;
			}else if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/).test(mobile)){
				$("#telPhone").focus();
				layer.msg("手机号码格式不正确，请从新填写");
				return false;
			}else if(mobile.length != 11){
				$("#telPhone").focus();
				layer.msg("手机号码应为11位，请从新填写");
				return false;
			}else{
			    
				$.ajax({
				    type: 'post',  
				    data:{condigneeName:buyerName,
				    	telephone:mobile,
				    	provinceId:province,
				    	cityId:city,
				    	areaId:areaVal,
				    	liveAddress:detailAddress	
				    },
				    url: "${pageContext.request.contextPath }/web/android/consigneeApi/add.htm",
				    success: function (data) {	        	
				    	 if(data.result=="ok"){
				    		
				    		window.location.href="${pageContext.request.contextPath}/web/android/consigneeApi/toConsigneeJsp.htm";
				    		layer.msg("添加成功");
				    		
				    	 }else{
				    		 layer.msg("添加失败");
				    		 
				    	 }  
				    }
				    });
			}
		}
		
		
		</script>
	</body>
</html>
