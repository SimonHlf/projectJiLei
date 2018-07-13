<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta  charset="UTF-8"  name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
		<title>企业详情</title>
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/mine.css"/>
		<link rel="stylesheet" type="text/css" href="css/footer.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript">
			var app_param={};
			app_param.path = '${ctx}';
		</script>
		<script type="text/javascript" src="${ctx}/resources/ui/lib/layer3.1/layer.js?v=20151225"></script>
		<script src="js/swiper.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/resources/ckplayer/ckplayer.js"></script>
		<script type="text/javascript" src="js/vote.common.js"></script>
		<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
		<script src="js/flexible.js"></script>
		<script type="text/javascript">
			$(function(){
				var weid = $('#weid').val();
				if(weid==''||weid==null){
					var code = '${param.code}';
					if(code==''||code==null||code=='undefind'){
						//alert(weid);
						getCode();
						return;
					}
					getOid(code);

				}
				//vote.component.isWeiXinBrower();
				var sharedata = {};
				vote.component.addVoteAccess('${param.id}');
				$.getJSON('${ctx}/vote/getVoteDetail.ht',function(data){
					var str = '';
					var d = data.data.dataObject;
					var serverTime = d.serverTime; //服务器时间，毫秒数 
				  	var dateTime = new Date(); 
				  	var difference = dateTime.getTime() - serverTime; //客户端与服务器时间偏移量 
				    var endTime = new Date(d.endTime.replace(new RegExp(/-/gm) ,"/")); 
				  	setInterval(function(){ 
				    var nowTime = new Date();
				    var nMS=endTime.getTime() - nowTime.getTime() + difference;
				    var myD=Math.floor(nMS/(1000 * 60 * 60 * 24)); //天 
				    var myH=Math.floor(nMS/(1000*60*60)) % 24; //小时 
				    var myM=Math.floor(nMS/(1000*60)) % 60; //分钟 
				    var myS=Math.floor(nMS/1000) % 60; //秒 
				    if(myD>= 0){ 
				     	str = '<i>'+myD+'</i>天<i>'+myH+'</i>小时<i>'+myM+'</i>分<i>'+myS+'</i>秒'; 
				    }else{ 
				     	str = "已结束！";  
				    }
				    $('#endTime').html('距离活动结束：'+str);
				  }, 100); //每个0.1秒执行一次 
				});
				$.getJSON('${ctx}/vote/getEnterpriseDetail.ht?id=${param.id}',function(data){
					var d = data.data.dataObject;
					document.title=d.name;
					$('.innerImg img').attr('src','${ctx}/'+d.coverUrl);
					//判断是否有video
					var video = d.videoUrl;
					if(video!=null && video!=''){
							$('.videoBj').show();
							$('.innerImg').click(function(){
								var videoObject = {
										container: '.innerImg',//“#”代表容器的ID，“.”或“”代表容器的class
										variable: 'player',//该属性必需设置，值等于下面的new chplayer()的对象
										video:'${ctx}/'+video//视频地址
									};
								var player=new ckplayer(videoObject);
							});
					}
					$('.innerImg').show();
					if(d.voteNumber==0){
						$('#voteRank').html('暂无');
					}else{
						$('#voteRank').html(d.voteRank);
					}
					$('#voteNumber').html(d.voteNumber);
					$('#voteAccess').html(d.voteAccess);
					$('#name').html(d.name);
					$('#seNumber').html(d.seNumber);
					$('#address').html(d.address);
					$('#contactNumber').html(d.contactNumber);
					$('#introduct').html(d.introduct);
					$('#businessMiss').html(d.businessMiss);
					$('#cxxy').html(d.cxxy);
					var qrCode = d.qrCode;
					if(qrCode!=null && qrCode!=''){
						$('#qrCode img').attr('src','${ctx}/'+qrCode);
					}
					sharedata = {
							title: d.name+'-邀请您参与投票，企业编号：'+d.seNumber,
							desc: d.name+'-邀请您参与投票，企业编号：'+d.seNumber,
							link: window.location.href,
							imgUrl: 'http://'+window.location.host+'/'+d.coverUrl+'',// 自定义图标
							success: function () {
								layer.msg('成功分享');
							},
							cancel: function () {
								layer.msg('取消分享');
							}
						};
				});
				var url = location.href.split('#').toString();//url不能写死
				$.post('${ctx}/weixin/share.ht',{url:url},function(data){
					var d = data.data.dataObject;
					wx.config({
		                debug: false,////生产环境需要关闭debug模式
		                appId: d.appId,//appId通过微信服务号后台查看
		                timestamp: d.timestamp,//生成签名的时间戳
		      			nonceStr: d.nonceStr,//生成签名的随机字符串
		       			signature: d.signature,//签名
		                jsApiList: [//需要调用的JS接口列表
		                    'checkJsApi',//判断当前客户端版本是否支持指定JS接口
		                    'onMenuShareTimeline',//分享给好友
		                    'onMenuShareAppMessage'//分享到朋友圈
		                ]
		            });
					
				},'json');
			    wx.ready(function () {
			    	wx.showMenuItems({
			    	      menuList: [
			    	        'menuItem:share:appMessage',
			    	        'menuItem:share:timeline' // 分享到朋友圈
			    	      ]});
			        wx.onMenuShareAppMessage(sharedata);
			        wx.onMenuShareTimeline(sharedata);
			    });
			});
function getCode(){
	window.location='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx6e29106b1ad35721&redirect_uri=http://www.gcpy365.com/m/sites/syjsb/mine.jsp&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect';
}
function getOid(code){
	$.ajax({
		type:'post',  
        url:'${ctx}/weixin/getOpId.ht', 
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
function voteLog(){
	var weid = $('#weid').val();
	var id = '${param.id}';
	vote.component.addWeVote(id,weid);
}
		</script>
	</head>
	<body>
	<div class="midMineCon">
	<!--nav-->
		<div class="mineNav">
			<input type="hidden" id="weid" value="">
			<div class="share" onclick="layer.msg('请点击右上角分享！');"></div>
		</div>
		  <!--video-->
		    <div class="videoImg">
		    	<!-- img -->
		    	<div class="innerImg vidImgBox" style="display: block;">
		    		<img src=""/>
		    		<div class="videoBj">
			    		<div class="btn"></div>
			    	</div>
		    	</div>
		    	
		    </div>
	<!--商家排名信息--> 
	<div class="shopMessage">
		<div class="paiMing">
			<div class="beginTime" id="endTime">距离活动结束还有：</div>
			<div class="paiMingMessage">
				<div class="paiMingNum">
					<i>排名</i>
					<span id="voteRank">
						0
					</span>
				</div>
				<div class="piaoNum">
					<i>得票数</i>
					<span id="voteNumber">
						0
					</span>
				</div>
				<div class="paiMingNum">
					<i>访问量</i>
					<span id="voteAccess">
						0
					</span>
				</div>
			</div>
		</div>
		<!--商家具体信息--> 
		<div class="shopMessageCon">
			<div class="clearfix">
				<div class="top_left ">
					<div><span class="shopName">企业名称:</span><p id="name"></p></div>
					<div><span class="shopName">编 &nbsp;&nbsp;&nbsp;号:</span><p id="seNumber"></p></div>
					<div><span class="shopName">地  &nbsp;&nbsp;&nbsp;址:</span><p id="address"></p></div>
					<div><span class="shopName">联系电话:</span><p id="contactNumber"></p></div>
				</div>
				<div class="erWeiMa" id="qrCode"><img src=""><i>关注我</i></div>
			</div>
			<div class="xuanYan clearfix"><span class="shopName">诚信宣言:</span><i id="cxxy"></i></div>
		</div>
		<!--按钮--> 
		<div class="touPiaobtn clearfix">
			<div class="btnLeft" onclick="voteLog();">
				投他一票
			</div>
			<div class="btnRight" onclick="relM();">
				给他留言
			</div>
		</div>
	</div>
	<!--商家简介-->
	<div class="introduceCon">
		 <div class="intro_title">企业简介</div>
		 <div class="banner">
		 <div class="intro_text" id="introduct"></div>
		 	<img src="images/banner2.jpg" />
		 </div>
		 <div class="shiMing"><span>企业使命</span><p id="businessMiss"></p></div>
	</div>
		<!--留言列表-->
	<div class="shop_liuYan">
		<div class="liuyanTitle">留言列表</div>
		<ul>
		</ul>
		<a class="showMoreBtn" href="javascript:void(0)" onclick="getMore();">点击加载更多</a>
		<span id="spage" style="display:none;">1</span>
			</div>
			</div>
		<!-- footer -->
		<div class="footer fixed">
			<div class="footerCon">
				<ul class="clearfix">
					<li>
						<a href="index.html">
							<i class="iconfont icon-home homeIcon"></i>
							<em>首页</em>
						</a>
					</li>
					<li class="active">
						<a href="mine.html">
							<span></span>
							<i class="iconfont icon-mine minIcon"></i>
							<em>我的</em>
						</a>
					</li>
					<li>
						<a href="signUp.html">
							<i class="iconfont icon-baoming"></i>
							<em>报名</em>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="layer"></div>
		<!-- 留言 -->
		<div class="leaveMsg" style="display: none;">
			
		</div>
	<script>
	$(function(){
		getMessages(0);
	});
	function getMessages(obj){
		 var page =$('#spage').html();
		 var pageSize = 10;
		if(obj!=''&&obj!='undefined'&&obj!=0) {
			page=1;
			pageSize=pageSize*Number(obj);
		}
		var sjHTML='';
		var enterpriseId = '${param.id}';
		$.ajax({  
            type:'post',  
            url:'${ctx}/voteMsg/RplList.ht', 
            data: {
            	enterpriseId:enterpriseId,
            	page: page,
            	pageSize:pageSize
	           	},
            dataType:'json', 
            success:function(data){  
            	var lmsg = data.data.dataObject;
            	var sPage = data.data.other.page;
            	if(obj!=''&&obj!='undefined'&&obj!=0) {
        			sPage=obj;
        		}
            	var sTotal = data.data.other.total;
            	sTpage = Math.ceil(sTotal/pageSize);
            	if (sTotal / pageSize - sPage > 0) {
					$("#spage").html(sPage+1);
				}
            	var sLen = lmsg.length;
            	$.each(lmsg,function(i,o){
            		sjHTML+='<li>'+
							'	<div class="user_message clearfix">'+
							'		<div class="touXiang"><img src="'+o.userPhoto+'" onerror="javascript:this.src=\'${ctx}/m/sites/cxcs/resources/images/chengyuan.png\';"></div>'+
							'		<div class="userName">'+o.userNickname+'</div>'+
							'		<time>'+o.createtime+'</time>'+
							'	</div>'+
							'	<p>'+o.msgContent+'</p>'+
							'</li>';
            		
            		
            	});
            	if(obj!=''&&obj!='undefined'&&obj!=0) {
        			$('.shop_liuYan ul').html(sjHTML);
        		}else{
        			$('.shop_liuYan ul').append(sjHTML);
        		}
            	if (sLen < pageSize) {
					$('.showMoreBtn').html('没有更多留言了！');
					$('.showMoreBtn').removeAttr('onclick');
				}else{
					$('.showMoreBtn').html('点击加载更多');
					$('.showMoreBtn').attr('onclick','getMore()');
				}
            }
		});
	}
	function getMore() {
		getMessages(0);
	}
	 function relM(obj){
			var enterpriseId = '${param.id}';
			var width = $(window).width();
			if(!isLogin()){
				singRoute(app_param.path+'/loginLayer-vote.jsp');
			}else{
							layer.prompt({
								  formType: 2,
								  value: '',
								  title: '请输入您的回复:',
								  offset: [100,0],
								  area: [width*0.8, width*0.5] //自定义文本域宽高
								}, function(value, index, elem){
									$.ajax({
								        type: 'post',
								        url: '/bc/voteMsg/addvoteMsg.ht',
								        data: {
								        	msgContent:value,
								        	enterpriseId:enterpriseId
								      	  	},
								        cache: false,
								        dataType: 'json',
								        success: function(data) {
								        	//加载层-风格2

								        	layer.load(2);
								        	setTimeout(function(){
								        		var page =$('#spage').html();
								        		getMessages(page);
								        		  layer.closeAll('loading');
								        		}, 1000);
								        },
								        error: function(data) {
								        }
								    });
								  layer.close(index);
								});
						}
		}
	</script>
	</body>
	<script>
		(function(){
			$(".midMineCon").height($(window).height() - $(".footer").height());
		})();
	</script>
</html>
