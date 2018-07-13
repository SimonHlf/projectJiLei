var globalUrl = app_param.path+'/vote/';
//var globalUrl = 'http://192.168.1.108:8081/vote/';
var wrapperObj = "allDistrict";
var pullUpObj = "pullUpAll";
var scrollObj = "allDisFoods";
var pageSwiper,myScroll,pullUpEl, pullUpOffset;
var rankTypeNum = 0; // rankType 0:食品企业榜 1:药品企业榜
var groupIdArray = ['all'];
var flagObj = {
	loadFlag : true,
	shiquFlag : true,
	pyxianFlag : true,
	qfFlag : true,
	fxFlag : true,
	nlFlag : true,
	tqFlag : true,
	noDataFlag : false
}
var pageObj = {
	pageTmp : 1,
	allFoodsPage : 1,
	allMedPage : 1,
	sqFoodsPage : 1,
	sqMedPage : 1,
	pyxFoodsPage : 1,
	pyxMedPage : 1,
	qfFoodsPage : 1,
	qfMedPage : 1,
	fxFoodsPage : 1,
	fxMedPage : 1,
	nlFoodsPage :　1,
	nlMedPage :　1,
	tqFoodsPage :　1,
	tqMedPage : 1
}
var hasDataFlag = false;
var scrollFlag = true;
tSpeed = 300 //切换速度300ms
var tipStrInfo = "<p class='tipInfoTxt'>"+ 
	"<strong>提示</strong>" +
	"<span>投票时间: 7月7日--7月15日</span>" + 
	"<span>公布时间: 7月16日--7月22日</span>" + 
	"<span>参选方式：在濮阳共创诚信平台上，消费者从参评企业中宣传濮阳市民认可信赖的食品、药品企业。</span>" +
"</p>";
var noDataInfo = "<p class='noDataInfo'><i class='iconfont icon-zanwu'></i><span>暂无数据！</span></p>";
$(function(){
	getDistrict();
});
(function(){
	$(".bodyBg_cen").height($(window).height());
	$(".bigTabCon").width($(".mainCon").width());
	$(".tabContent").width($(".mainCon").width());
	$(".tabConParent").width($(".bigTabCon").width()*$(".bigTabCon").length);
	$(".tabConDis").width(2*$(".tabContent").width());
})();
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});
//获取district名groupID
function getDistrict(){
	$(".loadingDiv").show();
	$.ajax({
		url: globalUrl + "getGroup.ht",
		success:function(res){
			$(".loadingDiv").hide();
			var res = JSON.parse(res).data.dataObject;
			var options = "";
			for(i=0; i<res.length; i++){
				options += "<li dataGroupId='"+ res[i].id +"' ontouchend='showListDiv(this)' nowIndex='"+ (i+1) +"'>\
					<span>"+ res[i].name +"</span>\
					<div class='navBar'><span class='barSpan'></span></div>\
				</li>";
				groupIdArray.push(res[i].id);		  	
			}
			$("#districtWrap").append(options);

			var len = $('#districtWrap li').length;
			var liWid = $('#districtWrap li').eq(0).width();
			$('#districtWrap').width((len * liWid));

			var myScroll1 = new iScroll('nav', { 
				checkDOMChanges: true,
				hScrollbar : false, 
				onScrollMove:function(){
					scrollFlag = false;
				},
				onScrollEnd:function(){
					scrollFlag = true;
				}
			});

			getListRank_init("allDistrict",'allDisFoods',0);
			if(flagObj.loadFlag){
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#allDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpAll").show();
					}else{
						$("#pullUpAll").hide();
						$("#allFoodDataUl").append(noDataInfo);
					}
				}else if(globalOpt == "listConOpt"){
					if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpAll").show();
					}else{
						$("#pullUpAll").hide();
						$("#allFoodDataUl").append(noDataInfo);
					}
				}
			}
			flagObj.loadFlag = false;
			if(globalOpt =="waterFullOpt"){
				$(".tabContent").height($(".mainCon").height() - $("#nav ").height() - $("#subNav").height() - $(".queryDiv").innerHeight());
			}else if(globalOpt == "listConOpt"){
				$(".tabContent").height($(".mainCon").height() - $("#nav ").height() - $("#subNav").height() - $(".listUl").height());
			}
		}
	});
}
//点击nav显示出对应的div层内容
function showListDiv(obj){
	if(scrollFlag){
		var clickIndex = $(obj).attr("nowIndex");
		$(obj).parent().find("li").removeClass('active');
		$(obj).addClass('active');
		$(".tabConParent").css({
			"-webkit-transform":"translateX("+ (-(clickIndex*$(".bigTabCon").width())) +"px)",
			"transform":"translateX("+ (-(clickIndex * $(".bigTabCon").width())) +"px)"
		});
		rankTypeNum = 0; 
	  	$("#groupIdInp").val(groupIdArray[clickIndex]);
	  	if(clickIndex == 0){
	  		wrapperObj = 'allDistrict';
			pullUpObj = "pullUpAll";
	  	}else if(clickIndex == 1){
	  		wrapperObj = 'shiquDis';
			scrollObj = "shiquDisFoods";
			pullUpObj = "pullUpSq";
			if(flagObj.shiquFlag){
	  			getListRank_init(wrapperObj,scrollObj,0);
	  			if(globalOpt =="waterFullOpt"){
	  				if(hasDataFlag == true){
	  					$("#shiquDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpSq").show();
	  				}else{
	  					$("#pullUpSq").hide();
	  					$("#sqFoodDataUl").append(noDataInfo);
	  				}
				}else if(globalOpt == "listConOpt"){
					if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpSq").show();
	  				}else{
	  					$("#pullUpSq").hide();
	  					$("#sqFoodDataUl").append(noDataInfo);
	  				}
				}
  			}
	  		flagObj.shiquFlag = false;
	  	}else if(clickIndex == 2){
	  		wrapperObj = 'puyangxianDis';
	  		scrollObj = "pyxianDisFoods";
	  		pullUpObj = "pullUpPyx";
	  		if(flagObj.pyxianFlag){
	  			getListRank_init(wrapperObj,scrollObj,0);
	  			if(globalOpt =="waterFullOpt"){
	  				if(hasDataFlag == true){
	  					$("#pyxianDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpPyx").show();
	  				}else{
	  					$("#pullUpPyx").hide();
	  					$("#pyxFoodDataUl").append(noDataInfo);
	  				}
				}else if(globalOpt == "listConOpt"){
					if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpPyx").show();
	  				}else{
	  					$("#pullUpPyx").hide();
	  					$("#pyxFoodDataUl").append(noDataInfo);
	  				}
				}
	  		}
	  		flagObj.pyxianFlag = false;
	  	}else if(clickIndex == 3){
	  		wrapperObj = 'qingfengDis';
	  		scrollObj = "qfDisFoods";
	  		pullUpObj = "pullUpQf";
	  		if(flagObj.qfFlag){
	  			getListRank_init(wrapperObj,scrollObj,0);
	  			if(globalOpt =="waterFullOpt"){
	  				if(hasDataFlag == true){
	  					$("#qfDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpQf").show();
	  				}else{
	  					$("#pullUpQf").hide();
	  					$("#qfFoodDataUl").append(noDataInfo);
	  				}
				}else if(globalOpt == "listConOpt"){
					if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpQf").show();
	  				}else{
	  					$("#pullUpQf").hide();
	  					$("#qfFoodDataUl").append(noDataInfo);
	  				}
				}
	  		}
	  		flagObj.qfFlag = false;
	  	}else if(clickIndex == 4){
	  		wrapperObj = 'nanleDis';
	  		scrollObj = "nlDisFoods";
	  		pullUpObj = "pullUpNl";
	  		if(flagObj.nlFlag){
	  			getListRank_init(wrapperObj,scrollObj,0);
	  			if(globalOpt =="waterFullOpt"){
	  				if( hasDataFlag == true ){
	  					$("#nlDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpNl").show();
	  				}else{
	  					$("#pullUpNl").hide();
	  					$("#nlFoodDataUl").append(noDataInfo);
	  				}
				}else if(globalOpt == "listConOpt"){
					if( hasDataFlag == true ){
						loadedDetail();
						$("#pullUpNl").show();
	  				}else{
	  					$("#pullUpNl").hide();
	  					$("#nlFoodDataUl").append(noDataInfo);
	  				}
				}
	  			
	  		}
	  		flagObj.nlFlag = false;
	  	}else if(clickIndex == 5){
			wrapperObj = 'fanxianDis';
	  		scrollObj = "fxDisFoods";
	  		pullUpObj = "pullUpFx";
	  		if(flagObj.fxFlag){
	  			getListRank_init(wrapperObj,scrollObj,0);
	  			if(globalOpt =="waterFullOpt"){
	  				if(hasDataFlag == true){
	  					$("#fxDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpFx").show();
	  				}else{
	  					$("#pullUpFx").hide();
	  					$("#fxFoodDataUl").append(noDataInfo);
	  				}

				}else if(globalOpt == "listConOpt"){
					if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpFx").show();
	  				}else{
	  					$("#pullUpFx").hide();
	  					$("#fxFoodDataUl").append(noDataInfo);
	  				}
				}
	  		}
	  		flagObj.fxFlag = false;
	  	}else if(clickIndex == 6){
	  		wrapperObj = 'taiqianDis';
	  		scrollObj = "tqDisFoods";
	  		pullUpObj = "pullUpTq";
	  		if(flagObj.tqFlag){
	  			getListRank_init(wrapperObj,scrollObj,0);
	  			if(globalOpt =="waterFullOpt"){
	  				if( hasDataFlag == true ){
	  					$("#tqDisFoods li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpTq").show();
	  				}else{
	  					$("#pullUpTq").hide();
	  					$("#tqFoodDataUl").append(noDataInfo);
	  				}
				}else if(globalOpt == "listConOpt"){
					if( hasDataFlag == true ){
						loadedDetail();
						$("#pullUpTq").show();
	  				}else{
	  					$("#pullUpTq").hide();
	  					$("#tqFoodDataUl").append(noDataInfo);
	  				}
				}
	  		}
	  		flagObj.tqFlag = false;
	  	}
	  	createSubNavCon(wrapperObj,scrollObj,rankTypeNum);
	}
}
//点击subNav自导航显示对应内容
function showSubDiv(obj,wrapperObj,scrollObj,rankTypeNum){
	var isClickObj = {
		isClickShiqu : $("#shiquDis").attr("isClick"),
		isClickPyXian : $("#puyangxianDis").attr("isClick"),
		isClickqf : $("#qingfengDis").attr("isClick"),
		isClickfx : $("#fanxianDis").attr("isClick"),
		isClicknl : $("#nanleDis").attr("isClick"),
		isClicktq : $("#taiqianDis").attr("isClick")
	};
	$(obj).parent().find('li').removeClass('active');
	$(obj).addClass('active');
	$("#"+wrapperObj).css({
		"-webkit-transform":"translateX("+ (-(rankTypeNum*$(".bigTabCon").width())) +"px)",
		"transform":"translateX("+ (-(rankTypeNum * $(".bigTabCon").width())) +"px)"
	});

	if(rankTypeNum == 0){//食品排行榜
		rankTypeNum = 0;
		if(wrapperObj == "allDistrict"){
			scrollObj = "allDisFoods";
		}else if(wrapperObj == "shiquDis"){
			scrollObj = "shiquDisFoods";
		}else if(wrapperObj == "puyangxianDis"){
			scrollObj = "pyxianDisFoods";
		}else if(wrapperObj == "qingfengDis"){
			scrollObj = "qfDisFoods";
		}else if(wrapperObj == 'nanleDis'){
			scrollObj = "nlDisFoods";
		}else if(wrapperObj == "fanxianDis"){
			scrollObj = "fxDisFoods";
		}else if(wrapperObj == 'taiqianDis'){
			scrollObj = "tqDisFoods";
		}
	}else if(rankTypeNum == 1){//药品排行榜
		rankTypeNum = 1;
		if(wrapperObj == "allDistrict"){
			if(flagObj.loadFlag == false){ 
				scrollObj = "allDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#allDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpAllMed").show();
					}else{
						$("#pullUpAllMed").hide();
						$("#allMedDataUl").append(noDataInfo);
					}
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpAllMed").show();
					}else{
						$("#pullUpAllMed").hide();
						$("#allMedDataUl").append(noDataInfo);
					}
				}
			}
			flagObj.loadFlag = true;						
  		}else if(wrapperObj == "shiquDis"){
			if(isClickObj.isClickShiqu=="0"){
				scrollObj = "shiquDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#shiquDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpSqMed").show();
					}else{
						$("#pullUpSqMed").hide();
						$("#sqMedDataUl").append(noDataInfo);
					}
				
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpSqMed").show();
					}else{
						$("#pullUpSqMed").hide();
						$("#sqMedDataUl").append(noDataInfo);
					}
				}
			}
			$("#shiquDis").attr("isClick","1");
  		}else if(wrapperObj == "puyangxianDis"){
			if(isClickObj.isClickPyXian=="0"){
				scrollObj = "pyxianDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#pyxianDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpPyxMed").show();
					}else{
						$("#pullUpPyxMed").hide();
						$("#pyxMedDataUl").append(noDataInfo);
					}
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpPyxMed").show();
					}else{
						$("#pullUpPyxMed").hide();
						$("#pyxMedDataUl").append(noDataInfo);
					}
				}
			}
			$("#puyangxianDis").attr("isClick","1");
  		}else if(wrapperObj == "qingfengDis"){
			if(isClickObj.isClickqf=="0"){
				scrollObj = "qfDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#qfDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpQfMed").show();
					}else{
						$("#pullUpQfMed").hide();
						$("#qfMedDataUl").append(noDataInfo);
					}	
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpQfMed").show();
					}else{
						$("#pullUpQfMed").hide();
						$("#qfMedDataUl").append(noDataInfo);
					}	
				}
			}
			$("#qingfengDis").attr("isClick","1");
  		}else if(wrapperObj == 'nanleDis'){
			if(isClickObj.isClicknl == "0"){
				scrollObj = "nlDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#nlDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpNlMed").show();
					}else{
						$("#pullUpNlMed").hide();
						$("#nlMedDataUl").append(noDataInfo);
					}
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpNlMed").show();
					}else{
						$("#pullUpNlMed").hide();
						$("#nlMedDataUl").append(noDataInfo);
					}
				}
			}
		$("#nanleDis").attr("isClick","1");
  		}else if(wrapperObj == "fanxianDis"){
			if(isClickObj.isClickfx == "0"){
				scrollObj = "fxDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#fxDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpFxMed").show();
					}else{
						$("#pullUpFxMed").hide();
						$("#fxMedDataUl").append(noDataInfo);
					}
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpFxMed").show();
					}else{
						$("#pullUpFxMed").hide();
						$("#fxMedDataUl").append(noDataInfo);
					}
				}
			}				
			$("#fanxianDis").attr("isClick","1");
  		}else if(wrapperObj == 'taiqianDis'){
			if(isClickObj.isClicktq == "0"){
				scrollObj = "tqDisMedical";
				getListRank_init(wrapperObj,scrollObj,rankTypeNum);
				if(globalOpt =="waterFullOpt"){
					if(hasDataFlag == true){
						$("#tqDisMedical li").eq(0).prepend(tipStrInfo);
						loadedDetail();
						$("#pullUpTqMed").show();
					}else{
						$("#pullUpTqMed").hide();
						$("#tqMedDataUl").append(noDataInfo);
					}
			}else if(globalOpt == "listConOpt"){
				if(hasDataFlag == true){
						loadedDetail();
						$("#pullUpTqMed").show();
					}else{
						$("#pullUpTqMed").hide();
						$("#tqMedDataUl").append(noDataInfo);
					}
				}
			}
			$("#taiqianDis").attr("isClick","1");
  		}		
	}
}
function createSubNavCon(wrapperObj,scrollObj,rankTypeNum){
	var strFood = "";
	var strMed = "";
	if(rankTypeNum == 0){
		scrollObj = $("#"+wrapperObj).find('.tabContent').eq(0).attr("id");
		strFood += "<li class='active' ontouchend=showSubDiv(this,'"+ wrapperObj +"','"+ scrollObj +"',"+ rankTypeNum +")>";
		strFood += "<span>食品企业榜</span>";
		strFood += "<div class='subNavBar'><div class='subBarSpan'></div></div></li>";
	}
	rankTypeNum = 1;
	scrollObj = $("#"+wrapperObj).find('.tabContent').eq(1).attr("id");
	strMed += "<li ontouchend=showSubDiv(this,'"+ wrapperObj +"','"+ scrollObj +"',"+ rankTypeNum +")>";
	strMed += "<span>药品排行榜</span>";
	strMed += "<div class='subNavBar'><div class='subBarSpan'></div></div></li>";

	$("#subNavUl").html(strFood + strMed);
}
function loadedDetail() {
	pullUpEl = document.getElementById(pullUpObj);
	pullUpOffset = pullUpEl.offsetHeight;;//表示获取元素自身的高度	 
	myScroll = new iScroll(scrollObj, {
		checkDOMChanges: true,
		onRefresh: function () {
			pullUpEl = document.getElementById(pullUpObj);
			if (pullUpEl.className == "loading") {
				pullUpEl.className = '';

				if(flagObj.noDataFlag == true){//没有数据
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '没有更多了...';
				}else{
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				}
			}
		},
		onScrollMove: function () {  //onScrollMove：主要表示根据用户下拉或上拉刷新的高度值,来显示不同的交互文字;
			//this.y 表示手指下拉的高度
			scrollFlag = false;
			pullUpEl = document.getElementById(pullUpObj);
			if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {//向上滑动
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放加载更多...';
				this.maxScrollY = this.maxScrollY;
			}else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () { //onScrollEnd:表示用户下拉刷新完,放开手指时所显示的不同的交互文字
			scrollFlag = true;
			pullUpEl = document.getElementById(pullUpObj);
			//pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...'
			if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载数据中...';
				if(wrapperObj == "allDistrict"){
					if(rankTypeNum == 0){
						pullUpAction("allDistrict","allDisFoods",0);
					}else{
						pullUpAction("allDistrict","allDisMedical",1);	
					}
				}else if(wrapperObj == "shiquDis"){
					if(rankTypeNum == 0){
						pullUpAction("shiquDis","shiquDisFoods",0);
					}else{
						pullUpAction("shiquDis","shiquDisMedical",1);	
					}
				}else if(wrapperObj == "puyangxianDis"){
					if(rankTypeNum == 0){
						pullUpAction("puyangxianDis","pyxianDisFoods",0);
					}else{
						pullUpAction("puyangxianDis","pyxianDisMedical",1);
					}
				}else if(wrapperObj == "qingfengDis"){
					if(rankTypeNum == 0){
						pullUpAction("qingfengDis","qfDisFoods",0);
					}else{
						pullUpAction("qingfengDis","qfDisMedical",1);
					}
				}else if(wrapperObj == "fanxianDis"){
					if(rankTypeNum == 0){
						pullUpAction("fanxianDis","fxDisFoods",0);
					}else{
						pullUpAction("fanxianDis","fxDisMedical",0);
					}
				}else if(wrapperObj == "nanleDis"){
					if(rankTypeNum == 0){
						pullUpAction("nanleDis","nlDisFoods",0);
					}else{
						pullUpAction("nanleDis","nlDisMedical",1);
					}
				}else if(wrapperObj == "taiqianDis"){
					if(rankTypeNum == 0){
						pullUpAction("taiqianDis","tqDisFoods",0);
					}else{
						pullUpAction("taiqianDis","tqDisMedical",0);
					}
				}
			}
		}
	});
}
function pullUpAction (districtName,scrollPar,rankTypeNum) {
	setTimeout(function () {	
		//console.log(districtName + "--" + scrollPar + "--" + rankTypeNum)
		getListRank(districtName,scrollPar,rankTypeNum);
		myScroll.refresh();// 数据加载完成后，调用界面更新方法 Remember to refresh when 
	}, 1000);	
		
}
function getListRank(districtName,scrollPar,rankTypeNum){
	var groupId = $("#groupIdInp").val();
	var pageTmp = 1;

	if(wrapperObj == "allDistrict"){
		if(rankTypeNum == 0){
			pageObj.allFoodsPage++;
			pageTmp = pageObj.allFoodsPage;
		}else{
			pageObj.allMedPage++;
			pageTmp = pageObj.allMedPage;
		}
	}else if(wrapperObj == "shiquDis"){
		if(rankTypeNum == 0){
			pageObj.sqFoodsPage++;
			pageTmp = pageObj.sqFoodsPage;
		}else{
			pageObj.sqMedPage++;
			pageTmp = pageObj.sqMedPage;
		}
	}else if(wrapperObj == "puyangxianDis"){
		if(rankTypeNum == 0){
			pageObj.pyxFoodsPage++;
			pageTmp = pageObj.pyxFoodsPage;
		}else{
			pageObj.pyxMedPage++;
			pageTmp = pageObj.pyxMedPage;
		}
	}else if(wrapperObj == "qingfengDis"){
		if(rankTypeNum == 0){
			pageObj.qfFoodsPage++;
			pageTmp = pageObj.qfFoodsPage;
		}else{
			pageObj.qfMedPage++;
			pageTmp = pageObj.qfMedPage;
		}
	}else if(wrapperObj == "fanxianDis"){
		if(rankTypeNum == 0){
			pageObj.fxFoodsPage++;
			pageTmp = pageObj.fxFoodsPage;
		}else{
			pageObj.fxMedPage++;
			pageTmp = pageObj.fxMedPage;
		}
	}else if(wrapperObj == "nanleDis"){
		if(rankTypeNum == 0){
			pageObj.nlFoodsPage++;
			pageTmp = pageObj.nlFoodsPage;
		}else{
			pageObj.nlMedPage++;
			pageTmp = pageObj.nlMedPage;
		}
	}else if(wrapperObj == "taiqianDis"){
		if(rankTypeNum == 0){
			pageObj.tqFoodsPage++;
			pageTmp = pageObj.tqFoodsPage;
		}else{
			pageObj.tqMedPage++;
			pageTmp = pageObj.tqMedPage;
		}
	}
	$.ajax({
		type:"get",
		url: globalUrl + "getEnterpriseList.ht?page=" + pageTmp + "&pageSize=10",
		async:false,
		data:{
			groupId : groupId,
			flag : rankTypeNum
		},
		success:function(data){
			var data = JSON.parse(data).data.dataObject.rows;
			if(data.length > 0){
				flagObj.noDataFlag = false;
				if(globalOpt == "waterFullOpt"){
					getData(data,scrollPar);
				}else if(globalOpt == "listConOpt"){
					//加载list数据
					getListData(data,scrollPar);
				}
			}else{
				//上拉加载data内部的数据全部加载完成
				if(globalOpt == "waterFullOpt" || globalOpt == "listConOpt"){
					flagObj.noDataFlag = true;
				}
			}
		},
	});
}
function getListRank_init(disName,scrollPar,rankTypeNum){
	var groupId = $("#groupIdInp").val();
	var pageTmp = 1;
	$.ajax({
		type:"get",
		url: globalUrl + "getEnterpriseList.ht?page=" + pageTmp + "&pageSize=10",
		async:false,
		data:{
			groupId : groupId,
			flag : rankTypeNum
		},
		success:function(data){
			var data = JSON.parse(data).data.dataObject.rows;
			if(data.length > 0){
				hasDataFlag = true;
				if(globalOpt == "waterFullOpt"){
					getData(data,scrollPar);
				}else if(globalOpt == "listConOpt"){
					//加载数据
					getListData(data,scrollPar);
				}
			}else{
				//代表点击tap的时候执行的没有数据的方法
				if(globalOpt == "waterFullOpt" || globalOpt == "listConOpt"){
					hasDataFlag = false;
				}
			}
		},
	});
}
function getData(data,scrollPar){
	var oUl = document.getElementById(scrollPar).getElementsByTagName('ul')[0];
	var aLi = oUl.getElementsByTagName("li");				

	for(var i=0;i<data.length;i++){
		var _index = getShortLi(aLi);
		var oImg = document.createElement("img");
        var oDiv = document.createElement("div");
    	oDiv.setAttribute('class','product_picture');
    	oDiv.setAttribute("voteId",data[i].id);
    	oImg.addEventListener('touchend',function(){
    		if(scrollFlag){
    			location.href='mine.jsp?id='+oDiv.getAttribute("voteId");
    		}
    	});
        oImg.src = app_param.path+'/'+data[i].coverUrl;
        //oImg.src = globalUrl+'/'+data[i].coverUrl;
        //oImg.style.width = iWidth + 'px';
		//oImg.style.height = (data[i].height * (iWidth/data[i].width)) + "px";
		oDiv.appendChild(oImg);
		var oParTxt = document.createElement("div");
		var oStrong = document.createElement("strong");
		oStrong.setAttribute('class','ellip');
		var oSpan = document.createElement("span");
		var oBotDiv = document.createElement("div");
		oBotDiv.setAttribute('class','botDivFun clearfix');
		oParTxt.setAttribute('class','product_ie');
		var oVoteNumP = document.createElement("p");
		var oVote = document.createElement("a");
		oVote.setAttribute("voteId",data[i].id);
		oVote.setAttribute("ontouchend","voteFn(this)");
		oBotDiv.appendChild(oVoteNumP);
		oParTxt.appendChild(oStrong);
		insertAfter(oSpan,oStrong);
		insertAfter(oBotDiv,oSpan);
		insertAfter(oVote,oVoteNumP);
		oDiv.appendChild(oParTxt);
		
		oStrong.innerHTML = data[i].name;
		oSpan.innerHTML = data[i].seNumber + "： ("+ data[i].groupId +"组) ";
		oVoteNumP.innerHTML = "<em>"+ data[i].voteNumber +"</em>票";
		oVote.innerHTML="投票";
		
		aLi[_index].appendChild(oDiv);
	}
}
function getListData(data,scrollPar){
	var content = "";
	for(var i=0;i<data.length;i++){					
	content += "<li voteid='"+data[i].id+"'>";
	content += "<p class='oneWidLi'>";
	if(data[i].voteRank == 1 || data[i].voteRank == 2 || data[i].voteRank == 3){
		content += "<span class='rankSpan'>"+ data[i].voteRank +"</span></p>";
	}else{
		content += "<span>"+ data[i].voteRank +"</span></p>";
	}
	content += "<p class='twoWidLi ellip'>["+ data[i].seNumber +"] "+ data[i].name +"</p>";
	content += "<p class='oneWidLi'>"+ data[i].voteNumber +"</p>";
	content += "<p class='oneWidLi'>"+ data[i].groupId +"</p>";
	}
	$("#" + scrollPar + " ul").append(content);
	//$('#allFoodDataUl li').on('touchend',function(){
	$("#" + scrollPar + " li").on('touchend',function(){
		if(scrollFlag){
			location.href='mine.jsp?id='+$(this).attr('voteid');
		}
	});
}
function getShortLi(aLi){
	var index = 0;
	var iLen = aLi.length;
	var ih = aLi[index].offsetHeight;
	for(var i=1;i<iLen;i++ ){
		if(aLi[i].offsetHeight < ih){
			index = i;
			ih = aLi[i].offsetHeight;
		}
	}
	return index;
}
function insertAfter(newEl, targetEl){
    var parentEl = targetEl.parentNode; 
    if(parentEl.lastChild == targetEl){
        parentEl.appendChild(newEl);
    }else{
        parentEl.insertBefore(newEl,targetEl.nextSibling);
    }            
}
//投票
function voteFn(obj){
	if(scrollFlag){
		var enid = $(obj).attr('voteid');
		voteLog(enid);
	}
}
//搜索
function query(){
	var queryWords = $.trim($("#queryInp").val());
	if(queryWords == ""){
		toast("请输入商家名称或商家编号");
		return;
	}
	window.location.href = "queryResIndex.jsp?keyword=" + queryWords;
}
//获取code
function getCode(){
	window.location='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6e29106b1ad35721&redirect_uri=http://www.gcpy365.com/m/sites/syjsb/index.jsp&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect';
}
//获取openid
function getOid(code){
	$.ajax({
		type:'post',  
        url:app_param.path+'/weixin/getOpId.ht', 
        data: {
        	code:code
           	},
        dataType:'json', 
        success:function(data){  
			var oid = data.data.dataObject;
			if(oid==null||oid==''){
				getCode();
			}
        	 $('#weid').val(oid);
        },
		error: function(){
        	getCode();
        }
	});
}
//投票
function voteLog(obj){
	var weid = $('#weid').val();
	var id = obj;
	var index = true;
	vote.component.addWeVote(id,weid,index);
}