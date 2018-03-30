//初始化轮播图对应的底部索引
function initSmBtnNum(){
	var cliWid = document.documentElement.clientWidth;
	var cliHei = document.documentElement.clientHeight;
	var len = $("#flashBox li").length;
	var strSpan = "";
	for(var i=0;i<len;i++){
		strSpan += '<span></span>';
	}
	$(".smallBtn").append(strSpan);
	$(".smallBtn").find("span").eq(0).addClass("active");
	$(".smallBtn").css({"margin-left":-($(".smallBtn span").eq(0).width()*len)/2});
	$(".fixedNav").css({
		"left":(cliWid - 1100)/2 - 70,
		"top":$(".comMainPart ").eq(0).offset().top
	});
	$(".kefuDiv").css({"right":(cliWid - 1100)/2 - 190,
	"top":(cliHei)/2 + 600})
	autoFalsh();
	showDetailNav();
	smFixedNav();
	backTop("backTop");
}
//轮播图
function autoFalsh(){
	var iNow = 0;
	var page = $("#flashBox li").length;
	var iTime = null;
	
	$('.smallBtn span').each(function(i){
		$(this).click(function(){
			  banner(i);
		});
	});
	function banner(index){
	    iNow = index;
		$('.smallBtn span').eq(index).addClass('active').siblings('span').removeClass('active');
		  $('#flashBox .banner li').eq(index).stop().animate({
			'opacity':1 
		  },1000).siblings('li').stop().animate({
			  'opacity':0
		  },1000);
	}
	
	autoRun();
	
	function autoRun(){
		iTime = setInterval(function(){
			iNow++;
			if(iNow>page-1){
			  iNow = 0;	
			}
			banner(iNow);
		},4000);
	}
}
//分类式导航
function showDetailNav(){
	$('.catagNav').on('mouseenter', function() {
		$(".js-nav").removeClass('hide');
	}).on('mouseleave', function() {
		$(".js-nav").addClass('hide');
		$(".jsDetailNav").addClass('hide');
	}).on('mouseenter', 'li', function(e) {
		var li_data = $(this).attr('data-id');
		$(".jsDetailNav").addClass('hide');
		$('.jsDetailNav[data-id="' + li_data + '"]').removeClass('hide');
	})
}
//侧边栏副导航
function smFixedNav(){
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		if(scrollTop >= 708){
			$(".fixedNav").removeClass("absoPos").addClass('fixedPos');
			$(".kefuDiv").removeClass("absoPos").addClass('fixedPos_kefu');
		}else{
			$(".fixedNav").removeClass("fixedPos").addClass('absoPos');
			$(".kefuDiv").removeClass("fixedPos_kefu").addClass('absoPos');
		}
		//滚动到标杆位置,左侧导航加active
		$('.comMainPart').each(function(i){
			var wst =  $(window).scrollTop()
			if($('.comMainPart').eq(i).offset().top <= wst){
				$('.navDiv a').removeClass('active');
			 	$('.navDiv a').eq(i).addClass('active');
			}
		});

	});
	$('.navDiv a').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		var _i=$(this).index();
		$('body, html').animate({scrollTop:$('.comMainPart').eq(_i).offset().top},500);
	});
}
//返回顶部
function backTop(obj){
	var oBackTop=document.getElementById(obj);
	var timer=null;
	var bSys=true;
	oBackTop.onclick=function(){
		timer=setInterval(function(){
			var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
			if(scrollTop==0){
				clearInterval(timer);
			}
			bSys=true;
			var speed=(0-scrollTop)/6;
			speed=speed>0?Math.ceil(speed):Math.floor(speed);
			document.documentElement.scrollTop=document.body.scrollTop=speed+scrollTop;
		},30);
	};
}

/*var cmd = '${param.cmd}';
if(cmd=='') cmd = '20';
$($(".innerNav p")[parseInt(cmd)]).addClass("active");
 //点击热门搜索
function queryHot(name){
	window.location.href="${pageContext.request.contextPath}/web/shop/categoryApi/toCategoryJsp.htm?keywords="+name+"&cmd=1";
}
//搜索框
function searchHot(){
	var name=$("#hot_name").val();
	window.location.href="${pageContext.request.contextPath}/web/shop/categoryApi/toCategoryJsp.htm?keywords="+name+"&cmd=1";
}
//到登录页
function qudenglu(){
    var requri = encodeURI(window.location.href);
	window.location.href="${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm?requri=" + requri;
}
//到注册页
function quregister(){
	window.location.href="${pageContext.request.contextPath}/web/shop/userLoginApi/getRegistJsp.htm";
}

//退出登录
function onlogout(){
	window.location.href="${pageContext.request.contextPath}/web/shop/userLoginApi/logoutUser.htm";
}*/