<!DOCTYPE html>
<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
		<title>添加小区</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/weChat/Module/setting/css/addCommunity.css"/>
	</head>
	<body>
		<div id="addWrap" class="addCommunity">
			<div class="scrollerWrap padBot">
				<p class="scrollTit"><em>添加小区</em><span class="lineSpan"></span></p>
				<div class="comAddDiv">
					<p>请选择省：</p>
					<p>
						<input id="provInp" type="hidden"/>
						<span id="provinceSp" class="spNoSelColor" onclick="selProv()">请选择省</span>
						<!--input type="text" id="provinceInp" name="province" placeholder="请选择省" required/-->
					</p>
				</div>
				<div class="comAddDiv">
					<p>请选择市：</p>
					<p>
						<input id="cityInp" type="hidden"/>
						<span id="citySp" class="spNoSelColor" onclick="selCity()">请选择市</span>
					</p>
				</div>
				<div class="comAddDiv">
					<p>请选择县/区：</p>
					<p>
						<input id="districtInp" type="hidden"/>
						<span id="districtSp" class="spNoSelColor" onclick="selDistrict()">请选择县/区</span>
					</p>
				</div>
				<div class="comAddDiv">
					<p>小区名称：</p>
					<p>
						<input type="text" id="name" name="name" placeholder="请填写小区名称" maxlength="6" required/>
					</p>
				</div>
				<div class="comAddDiv">
					<p>小区地址：</p>
					<p>
						<input type="text" id="address" name="address" placeholder="请填写小区所在地址" required/>
					</p>
				</div>
				<div class="comAddDiv">
					<p>小区联系人：</p>
					<p>
						<input type="text" id="regionUser" name="regionUser" placeholder="请填写小区联系人" required/>
					</p>
				</div>
				<div class="comAddDiv">
					<p>联系电话：</p>
					<p>
						<input type="number" id="regionPhone" name="regionPhone" placeholder="请填写小区运营商电话" required/>
					</p>
				</div>
				<div class="buttonDiv">
					<button onclick="submit()">提交审核</button>
				</div>
			</div>
		</div>
		
		<div id="provData" class="comSelDisData">
			<div id="provDataDiv" class="comListDiv">
				<ul class="scrollerWrap padBot">
					<c:forEach var="cdzRegion" items="${provinceList}">
						<li attrId="${cdzRegion.code}" class="ellip" onclick="selThisProv(this)">${cdzRegion.name}</li>
					</c:forEach>
				</ul>
			</div>
			<p class="backP" onclick="goBack('provData')"><span></span>返回</p>
		</div>
		<div id="cityData" class="comSelDisData">
			<div id="cityDataDiv" class="comListDiv">
				<ul id="cityDataUl" class="scrollerWrap"></ul>
			</div>
			<p class="backP" onclick="goBack('cityData')"><span></span>返回</p>
		</div>
		<div id="districtData" class="comSelDisData">
			<div id="districtDataDiv" class="comListDiv">
				<ul id="districtDataUl" class="scrollerWrap"></ul>
			</div>
			<p class="backP" onclick="goBack('districtData')"><span></span>返回</p>
		</div>
		<div class="layer"></div>
		<div class="toast-wrap">
	        <span class="toast-msg"></span>
	    </div> 
		<!-- confirm 增加小区审核 -->
	    <div class="confirmDiv verifyDiv">
	    	<p>提交审核后请联系厂家，确认提交审核？</p>
	    	<button class="comTwoBtn twoBtn_cancel" onclick="closeAlert($('.confirmDiv'))">取消</button>
			<button class="comTwoBtn twoBtn_sure">确定</button>
	    </div>
	    <div class="loadingDiv">
			<div class="loadEffect">
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
		        <span></span>
			</div>
			<p>正在加载...</p>
		</div>
		<!-- footer -->
		<jsp:include page="../../down.jsp">
			<jsp:param value="4" name="cmd"/>
		</jsp:include>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/iscroll.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/weChat/jsPlugin/tipInfo.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				initData();
			});
			function initData(){
				var cliHei = $(window).height();
				$("#addWrap").height(cliHei-56);
				$(".comSelDisData").height(cliHei);
				$(".comListDiv").height(cliHei - 36);
				wrapScroll('addWrap');
				calDocPos();
			}
			document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
			//采用iscroll当吊起输入法时书写结束给document一个从新定位
			function calDocPos(){
				var $input = $('body').find('input[type="text"],input[type="number"]');
	            $input.focusout(function () {
	            	console.log("111")
	                $(document).scrollTop(0);
	            });
			}
			//选择省
			function selProv(){
				$("#provData").css({
					"-webkit-transform":"translateX(0px)",
					"transform":"translateX(0px)"
				});
				wrapScroll('provDataDiv');
			}
			function selThisProv(obj){
				$("#provInp").val($(obj).attr("attrId"));
				$("#provinceSp").html($(obj).html()).removeClass("spNoSelColor");
				$("#cityInp").val("");
				$("#citySp").html("请选择市").addClass("spNoSelColor");
				$("#districtInp").val("");
				$("#districtSp").html("请选择县/区").addClass("spNoSelColor");
				$("#provData").css({
					"-webkit-transform":"translateX("+ $(window).width() +"px)",
					"transform":"translateX("+ $(window).width() +"px)"
				});
			}
			//选择 市
			function selCity(){
				var provId = $("#provInp").val();
				var provTxt = $("#provinceSp").text();
				if(provTxt == "请选择省"){
					toast("请选择省");
					return;
				}
				$(".loadingDiv").show();
				$.ajax({
					url : "${pageContext.request.contextPath}/weChat/findByCityRegionCode.htm?code=" + provId,/* 这是父类的id */
					success : function(data) {/* 子类的数据 */
						$(".loadingDiv").hide();
						var data = eval("(" + data + ")");
						var strCity = "";
						for (var i = 0; i < data.length; i++) {
							strCity += "<li attrId='" + data[i].code + "' class='ellip' onclick='selThisCity(this)'>" + data[i].name + "</li>";
						}
						$("#cityDataUl").html(strCity);
						$("#cityData").css({
							"-webkit-transform":"translateX(0px)",
							"transform":"translateX(0px)"
						});
						wrapScroll('cityDataDiv');
					}
				});
			}
			function selThisCity(obj){
				$("#cityInp").val($(obj).attr("attrId"));
				$("#citySp").html($(obj).html()).removeClass("spNoSelColor");
				$("#districtInp").val("");
				$("#districtSp").html("请选择县/区").addClass("spNoSelColor");
				$("#cityData").css({
					"-webkit-transform":"translateX("+ $(window).width() +"px)",
					"transform":"translateX("+ $(window).width() +"px)"
				});
			}
			//选择县/区
			function selDistrict(){
				var cityId = $("#cityInp").val();
				var cityTxt = $("#citySp").text();
				if(cityTxt == "请选择市"){
					toast("请选择市");
					return;
				}
				$(".loadingDiv").show();
				$.ajax({
					url : "${pageContext.request.contextPath}/weChat/findByAreaRegionCode.htm?code=" + cityId,/* 这是父类的编号 */
					success : function(data) {/* 子类的数据 */
						$(".loadingDiv").hide();
						var data = eval("(" + data + ")");
						var strDistrict = "";
						for (var i = 0; i < data.length; i++) {
							strDistrict += "<li attrId='" + data[i].code + "' class='ellip' onclick='selThisDist(this)'>" + data[i].name + "</li>";
						}
						$("#districtDataUl").html(strDistrict);
						$("#districtData").css({
							"-webkit-transform":"translateX(0px)",
							"transform":"translateX(0px)"
						});
						wrapScroll('districtDataDiv');
					}
				});
			}
			function selThisDist(obj){
				$("#districtInp").val($(obj).attr("attrId"));
				$("#districtSp").html($(obj).html()).removeClass("spNoSelColor");
				$("#districtData").css({
					"-webkit-transform":"translateX("+ $(window).width() +"px)",
					"transform":"translateX("+ $(window).width() +"px)"
				});
			}
			function goBack(obj){
				$("#" + obj).css({
					"-webkit-transform":"translateX("+ $(window).width() +"px)",
					"transform":"translateX("+ $(window).width() +"px)"
				});
			}
			//提交审核
			function submit(){
				var districtId = $("#districtInp").val();
				var name=$("#name").val();
				var address=$("#address").val();
				var regionUser=$("#regionUser").val();
				var regionPhone=$("#regionPhone").val();
				
				if(districtId == ""){
					toast("请选择区/县");
					return;
				}else if(name == null || name == "" || address == null || address == "" || regionUser == null || regionUser == "" || regionPhone== null || regionPhone == ""){
					toast("请将申请信息输入完整");
					return;
				}
				if(isNaN(regionPhone)){
					alert("请输入正确格式的手机号");
					return false;
				}
				$(".loadingDiv").show();
				$.ajax({
					method:'post',
					url:'${pageContext.request.contextPath}/weChat/addCommunity.htm',
					data:{
						code:districtId,
						name:name,
						address:address,
						regionUser:regionUser,
						regionPhone:regionPhone
					},
					dataType:"json",
					success:function(data){
						$(".loadingDiv").hide();
						if(data.state==false){
							toast(data.msg);
							return;
						}else{
							toast(data.msg);
							setTimeout(function(){
								var item = {}
								httpPost("/quick_fill/weChat/mySmallArea.htm",item);
							},2000);
						}
					}
				})
			}
			//发送POST请求跳转到指定页面
			function httpPost(URL, PARAMS) {
			    var temp = document.createElement("form");
			    temp.action = URL;
			    temp.method = "post";
			    temp.style.display = "none";

			    for (var x in PARAMS) {
			        var opt = document.createElement("textarea");
			        opt.name = x;
			        opt.value = PARAMS[x];
			        temp.appendChild(opt);
			    }

			    document.body.appendChild(temp);
			    temp.submit();

			    return temp;
			}
		</script>
	</body>
</html>
