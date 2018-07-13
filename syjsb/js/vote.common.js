var vote = {};
vote.component = {
		/**
		 * 增加浏览量
		 * @param id
		 */
		addVoteAccess : function(id){
			$.get(app_param.path+'/vote/addVoteAccess.ht?id='+id);
		},
		/**
		 * 用户投票
		 * @param id
		 */
		addVote : function(id){
			if(!isLogin()){
				singRoute(app_param.path+'/loginLayer-vote.jsp');
			}else{
				$.getJSON(app_param.path+'/vote/addVote.ht?id='+id,function(data){
					if(data.status=='success'){
						layer.msg('投票成功！');
					}else{
						layer.msg(data.msg);
					}
				});
			}
		},
		/**
		 * 用户微信投票
		 * @param id
		 */
		addWeVote : function(id,openid,index){
			if(openid==''||openid==null){
				getCodes(index);
			}else{
				$.getJSON(app_param.path+'/vote/addWeVote.ht?id='+id+'&openid='+openid,function(data){
					if(data.status=='success'){
						layer.msg('投票成功！');
					}else{
						layer.msg(data.msg);
					}
				});
			}
		},
		/**
		 * 是否微信内打开
		 */
		isWeiXinBrower : function(){
			var ua = navigator.userAgent.toLowerCase();
            var isWeixin = ua.indexOf('micromessenger') != -1;
            var isAndroid = ua.indexOf('android') != -1;
            var isIos = (ua.indexOf('iphone') != -1) || (ua.indexOf('ipad') != -1);
            if (!isWeixin) {
                document.head.innerHTML = '<title>抱歉，出错了</title><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0"><link rel="stylesheet" type="text/css" href="https://res.wx.qq.com/open/libs/weui/0.4.1/weui.css">';
                document.body.innerHTML = '<div class="weui_msg"><div class="weui_icon_area"><i class="weui_icon_info weui_icon_msg"></i></div><div class="weui_text_area"><h4 class="weui_msg_title">请在微信客户端打开链接</h4></div></div>';
            }
		}
		
};
var browser={
	    versions:function(){
	            var u = navigator.userAgent, app = navigator.appVersion;
	            return {         //移动终端浏览器版本信息
	                trident: u.indexOf('Trident') > -1, //IE内核
	                presto: u.indexOf('Presto') > -1, //opera内核
	                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
	                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
	                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
	                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
	                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
	                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
	                iPad: u.indexOf('iPad') > -1, //是否iPad
	                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
	                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
	                qq: u.match(/QQ/i) == " qq" //是否QQ
	            };
	         }(),
	         language:(navigator.browserLanguage || navigator.language).toLowerCase()
	}
var indexRoute = 0;
var indexRouteTitle = 0; 
function singRoute(url){
	//if(typeof(plus)=='undefined'){
		indexRoute = layer.open({
			  type: 2,
			  title:false,
			  closeBtn:0,
			  offset: '50px',
			  maxmin:false,
			  shadeClose:true,
			  scrollbar: false,
			  content: url,
			  fixed: false,
			  anim: 2,
			  area: [$(window).width()+'px', $(window).height()-50+'px']
		});
	//}else{
	//	window.location.href=url;
	//	return;
	//}
//layer.full(indexRoute);
$('.layui-layer-maxmin').hide();
}

function singRouteTitle(url,title){
	//if(typeof(plus)=='undefined'){
	indexRouteTitle = layer.open({
			  type: 2,
			  title:title,
			  closeBtn:0,
			  offset: '50px',
			  maxmin:false,
			  shadeClose:true,
			  scrollbar: false,
			  content: url,
			  fixed: false,
			  anim: 1,
			  area: [$(window).width()+'px', $(window).height()-50+'px']
		});
$('.layui-layer-maxmin').hide();
}
function closeRoute(){
	layer.close(indexRoute);
}
/**
 * 判断登录
 * @returns {Boolean}
 */
function isLogin(){
	$.ajaxSettings.async = false;
	var isLogin = false;
	 $.get(app_param.path+'/isLogin.ht',function(data) {
					if (data.status == 'success') {
						isLogin=true;
					}else{
						isLogin=false;
					}
	  },'json');
	 return isLogin;
}
function getCodes(index){
	if(index==true){
		window.location='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6e29106b1ad35721&redirect_uri=http://www.gcpy365.com/m/sites/syjsb/index.jsp&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect';
	}else{
		window.location='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6e29106b1ad35721&redirect_uri=http://www.gcpy365.com/m/sites/syjsb/mine.jsp&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect';
	}
	
}