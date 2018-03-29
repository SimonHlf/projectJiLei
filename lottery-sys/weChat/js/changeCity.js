//省数据的显示
function comShowDataLayer(options){
	var moveHei = $("#header").height() + $("#selBox").height();
	$(".maskLayer").show().animate({"opacity":1},function(){
		if(options == "provData"){
			$("#provData").css({
				"-webkit-transform":"translateY("+ moveHei +"px)",
				"transform":"translateY("+ moveHei +"px)"
			});
			$("#cityData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
			$("#countyData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
		}else if(options == "cityData"){
			$("#cityData").css({
				"-webkit-transform":"translateY("+ moveHei +"px)",
				"transform":"translateY("+ moveHei +"px)"
			});
			$("#provData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
			$("#countyData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
		}else if(options == "countryData"){
			$("#countyData").css({
				"-webkit-transform":"translateY("+ moveHei +"px)",
				"transform":"translateY("+ moveHei +"px)"
			});
			$("#provData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
			$("#cityData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
		}
	});
}
//获取省数据
function getProvName(obj){
	var provName = $(obj).attr("alt");
	$(".toastDiv").show();
	$(".midLayer").show();
	$.ajax({
		method : 'post',
		url : 'cutCity.htm',
		data : {
			province : provName
		},
		success : function(data) {
			$("#areaList").html(data);
			$("#prov_sel").html($("#backData_prov").val());
			$("#provData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
			$(".maskLayer").animate({"opacity":0},function(){
				$(".maskLayer").hide();
			});
			$(".toastDiv").hide();
			$(".midLayer").hide();
		}
	});
}
//获取市数据
function getCityName(obj){
	var cityName = $(obj).attr("alt");
	$(".toastDiv").show();
	$(".midLayer").show();
	$.ajax({
		method : 'post',
		url : 'cutCity.htm',
		data : {
			province : $("#prov_sel").html(),
			cityName:cityName
		},
		success : function(data) {
			$("#areaList").html(data);
			$("#prov_sel").html($("#backData_prov").val());
			$("#city_sel").html($("#backData_city").val());
			
			$("#cityData").css({
				"-webkit-transform":"translateY(-100%)",
				"transform":"translateY(-100%)"
			});
			$(".maskLayer").animate({"opacity":0},function(){
				$(".maskLayer").hide();
			});
			$(".toastDiv").hide();
			$(".midLayer").hide();
		}
	});
}
//县区跳转
function getCountryName(obj){
	var countryName = $(obj).attr("alt");
	window.location.href="getCounty.htm?province="+$("#backData_prov").val() + "&city="+$("#backData_city").val()+"&county="+countryName;
}
//隐藏数据层
function hideAll(){
	$(".comDataBox").css({
		"-webkit-transform":"translateY(-100%)",
		"transform":"translateY(-100%)"
	});
	$(".maskLayer").animate({"opacity":0},function(){
		$(".maskLayer").hide();
	});
}