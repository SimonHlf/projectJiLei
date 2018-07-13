<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<meta  charset="UTF-8"  name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
		<title>我要报名</title>
		<link rel="stylesheet" type="text/css" href="css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="css/iconfont.css"/>
		<link rel="stylesheet" type="text/css" href="css/tipInfo.css"/>
		<link rel="stylesheet" type="text/css" href="css/singUp.css"/>
		<link rel="stylesheet" type="text/css" href="css/footer.css"/>
		<link rel="stylesheet" type="text/css" href="${ctx}/resources/huploadify/Huploadify.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/resources/huploadify/jquery.Huploadify.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctx}/m/sites/main/resources/css/fsgallery.css">
		<script type="text/javascript" src="${ctx}/m/sites/main/resources/js/fs_forse.js"></script>
		<script type="text/javascript" src="${ctx}/resources/ckplayer/ckplayer.js"></script>
		<script src="js/iScroll.js"></script>
	</head>
	<body>
		<!-- 头部 -->
		<div class="singUpHead">
			<a href="javascritp:void(0)" onclick="back()">
				<i class="iconfont icon-fanhui"></i>
			</a>
		</div>
		<div class="topPartCon">
			<!-- 活动介绍 -->
			<h2>活动详情</h2>
			<div id="activeIntroDiv" class="activeIntro">
		        <div class="scrollDiv">
		             <p>
		             	<strong>活动介绍:</strong> 
		             	<span>为发现和树立我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认
		             	我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识
		             我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识
		             我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识
		             我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识
		             我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识
		             我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识
		             我市食品、药品行业诚信经营标杆企业和先进典范， 加深公众对食品药品安全的认识识理解，营造良好的社会公</span>
		             </p>
		    	</div>
			</div>
			<!-- 报名表单 -->
			<div class="signUpForm">
				<div class="signUpHead">
					<strong class="fl">企业类型</strong>
					<div class="fl">
						<input type="hidden" id="enterpriseSty"/>
						<!-- 食品 -->
						<label class="enterpriLabel">
							<span><i class="iconfont icon-duihao"></i></span>
							<input type="radio" id="foodsInp" class="comEnterInp inpRadCheck" name="flag" value="0" ontouchend="selectEnterSty(this)" />
							<p>食品</p>
						</label>
						<!-- 药品 -->
						<label class="enterpriLabel">
							<span><i class="iconfont icon-duihao"></i></span>
							<input type="radio" id="medicalInp" class="comEnterInp inpRadCheck" name="flag" value="1" ontouchend="selectEnterSty(this)" />
							<p>药品</p>
						</label>
					</div>
				</div>
				<div class="singUpMidCon">
					<div class="comFormInpDiv hasHei">
						<span>企业名称</span>
						<input type="text" id="enterpriseName" name="name" class="singUpInp" placeholder="请输入您的企业名称"/>
					</div>
					<div class="comFormInpDiv hasHei">
						<span>注册代码</span>
						<input type="text" id="registerCode" name="businessLicense" class="singUpInp" placeholder="请输入营业执照注册号"/>
					</div>
					<div class="comFormInpDiv hasHei">
						<span>联系人</span>
						<input type="text" id="contractPerson" name="contactName" class="singUpInp" placeholder="请输入联系人姓名"/>
					</div>
					<div class="comFormInpDiv hasHei">
						<span>手机号码</span>
						<input type="number" id="phoneNum" name="contactNumber" class="singUpInp" placeholder="请输入您的手机号码"/>
					</div>
					<div class="comFormInpDiv hasHei">
						<span>企业地址</span>
						<input type="text" id="address" name="address" class="singUpInp" placeholder="请输入您的企业地址"/>
					</div>
					<div class="comFormInpDiv clearfix">
						<span>企业简介</span>
						<textarea id="introduct"  name="introduct" placeholder="请输入企业简介(200字)"></textarea>
					</div>
					<div class="comFormInpDiv clearfix">
						<span>诚信宣言</span>
						<textarea id="cxxy"  name="cxxy" placeholder="请输入诚信宣言(200字)"></textarea>
					</div>
					<div class="comFormInpDiv clearfix">
						<span>企业使命</span>
						<textarea id="businessMiss"  name="businessMiss" placeholder="请输入企业使命(200字)"></textarea>
					</div>
					<div class="comFormInpDiv clearfix">
						<span>企业展示</span>
						<div class="showEnterpri fl">
							<!-- 企业图片 -->
							<div class="comUpLoadDiv enterpriPicDiv fl">
								<input id="coverUrl" name="coverUrl" type="hidden" />
								<div id="selectFile1" class="enterpriPic comUpLoadBtn">
									<em class="iconfont icon-add"></em>
									<i>上传图片</i>
									<i>建议:790*470</i>
								</div>
								<div class="enterImgDiv hasUpLoadDiv">
									<img id="enterpriImg" src=""/>
								</div>
							</div>
							<div class="comUpLoadDiv enterpriVidDiv fl">
								<input id="videoUrl" name="videoUrl" type="hidden" />
								<div id="video" class="enterPriVideo comUpLoadBtn">
									<em class="iconfont icon-add"></em>
									<i class="specI">上传视频</i>
								</div>
								<div class="uploadImg hasUpLoadDiv">
									<video id="enterpriVideo"  src=""></video>
								</div>
							</div>
							<div class="comUpLoadDiv enterpriErWeiDiv fl">
								<input id="qrCode" name="qrCode" type="hidden" />
								<div id="selectFile2" class="enterpriErWeiPic comUpLoadBtn">
									<em class="iconfont icon-add"></em>
									<i>上传二维码</i>
									<i>建议:200*200</i>
								</div>
								<div class="uploadErWeiMa hasUpLoadDiv">
									<img id="enterpriErWeiImg" src=""/>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<!-- tipInfo -->
				<p class="tipInfo">注：请务必输入有效信息，投票截止前均可在线报名</p>
				<span id="goSingUp" class="singUpBtn">报名</span>
			</div>
		</div>
		<!-- footer -->
		 <div class="footer fixed">
			<div class="footerCon">
				<ul class="clearfix">
					<li>
						<a href="index.jsp">
							<i class="iconfont icon-home homeIcon"></i>
							<em>首页</em>
						</a>
					</li>
					<li>
						<a href="mine.jsp">
							<span></span>
							<i class="iconfont icon-mine minIcon"></i>
							<em>我的</em>
						</a>
					</li>
					<li class="active">
						<a href="signUp.jsp">
							<i class="iconfont icon-baoming"></i>
							<em>报名</em>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- loading -->
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
		<!-- toast层 -->
		<div class="toast-wrap">
	        <span class="toast-msg"></span>
	    </div> 
	</body>
	<script type="text/javascript" src="js/flexible.js" ></script>
	<script src="js/iScroll.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/tipInfo.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(function(){
			page.init();
			uploadInit('selectFile1');
			uploadInit('selectFile2');
			uploadInit('video');
			viewVideo();
		});
		function back(){
			window.location.href="index.jsp";
		}
		(function(){
			var cliHei = document.documentElement.clientHeight;
			$(".topPartCon").height(cliHei - $(".footerCon").height()-50);
		})();
	    myScroll = new iScroll("activeIntroDiv", { 
			checkDOMChanges: true,
			vScrollbar:false,
			hScrollbar : false,
		});
		//图片上传初始化
	function uploadInit(domName){
		if(domName != 'video'){
	        $("#"+domName).Huploadify({
	            auto:true,
	            fileTypeExts:'*.jpg;*.png',  
	            multi:false,
	            fileObjName:'Filedata',  
	            fileSizeLimit:1,
	            fileSizeLimit:30720,
	            showUploadedPercent:false,
	            uploader:'${ctx}/bc/attach/upload.ht?rid=&insert=1&module=merchantAd&fieldname=file_upload&folder=signUp',  
	            onUploadSuccess:function(file, data, response){  
	            	var data = eval('(' + data + ')');
		            var status = data.status;
		            var attList = data.data.dataObject;
		            if (status == 'success') {
		            	$.each(attList,function(i,o){
		            		if(domName=="selectFile1"){
		            			$(".enterImgDiv").show();
		            			$('#coverUrl').val('bc/attach/download.ht?filepath='+o.filename+'&realname='+encodeURI(o.realname)+'');
		       					$('#enterpriImg').attr('src','${ctx}/bc/attach/download.ht?filepath='+o.filename+'&realname='+encodeURI(o.realname)+'');
		            		}else{
		            			$('.uploadErWeiMa').show();
		            			$('#qrCode').val('bc/attach/download.ht?filepath='+o.filename+'&realname='+encodeURI(o.realname)+'');
		       					$('#enterpriErWeiImg').attr('src','${ctx}/bc/attach/download.ht?filepath='+o.filename+'&realname='+encodeURI(o.realname)+'');
		            		}
		       			});
		            }
		            $('img').fsgallery();
	            },  
	            onUploadError:function(file,response){  
	                //jQuery.longhz.alert("上传失败!");  
	                toast("上传失败!");
	            }
	        });  
	    }else{
    	$("#"+domName).Huploadify({
			            auto:true,
			            fileTypeExts:'*.mp4;*.m3u8',  
			            multi:false,
			            fileObjName:'Filedata',  
			            fileSizeLimit:1,
			            fileSizeLimit:51200,
			            showUploadedPercent:false,
			            uploader:'${ctx}/bc/attach/upload.ht?rid=&insert=1&module=signUp&fieldname=file_upload&folder=signUp',  
			            onUploadSuccess:function(file, data, response){  
			            	var data = eval('(' + data + ')');
				            var status = data.status;
				            var attList = data.data.dataObject;
				    if (status == 'success') {
		            	$.each(attList,function(i,o){
		            			$('.uploadImg').show();
		            			$('#videoUrl').val('bc/attach/download.ht?filepath='+o.filename+'&realname='+encodeURI(o.realname)+'');
		       					$('#enterpriVideo').attr('src','${ctx}/bc/attach/download.ht?filepath='+o.filename+'&realname='+encodeURI(o.realname)+'');
		            	})
		           }
	        },onUploadError:function(file,response){  
                //jQuery.longhz.alert("上传失败!");  
                toast("上传失败!");
	        }
	   	 })
	   }
	 }
	function viewVideo(){
		if($('#videoUrl').val()==null){
			layer.msg('无法预览视频，请先上传！');
			return false;
		}
		var videoObject = {
				container: '#enterpriVideo',//“#”代表容器的ID，“.”或“”代表容器的class
				variable: 'player',//该属性必需设置，值等于下面的new chplayer()的对象
				video:'${ctx}/'+$('#videoUrl').val()//视频地址
			};
		var player=new ckplayer(videoObject);
	}
	//选择当前报名的企业类型
	function selectEnterSty(obj){
		$(obj).parent().siblings().find("i").removeClass("selectNow");
		$(obj).prev().find("i").addClass("selectNow");
		$("#enterpriseSty").val($(obj).val());
	}
	var page = {
		init : function(){
			this.bindEvent();
		},
		validate : function(value,type){
			var value = $.trim(value);
			//非空验证
			if('require' === type || 'src' === type){
				return !!value;
			}
			//手机号验证
			if('phone' === type){
				return /^1\d{10}$/.test(value);
			}
			
		},
		bindEvent : function(){
			var _this = this;
			//去报名
			$("#goSingUp").on("touchend",function(){
				_this.submit();
			});
		},
		// 提交表单 伪表单
		submit : function(){
			var formData = {
				flag : $("#enterpriseSty").val(),
				name : $.trim($('#enterpriseName').val()),
				businessLicense : $.trim($('#registerCode').val()),
				contactName : $.trim($('#contractPerson').val()),
				contactNumber : $.trim($('#phoneNum').val()),
				address : $.trim($('#address').val()),
				introduct : $.trim($('#introduct').val()),
				coverUrl : $("#enterpriImg").attr("src"),
				videoUrl : $("#enterpriVideo").attr("src"),
				qrCode : $("#enterpriErWeiImg").attr("src"),
			};
			var validateResult = this.formValidate(formData); 
			if(validateResult.status){//返回值验证成功
				//ajax
				var url = '${ctx}/vote/addVoteSign.ht';
				$.post(url,formData,function(data){
					toast("报名成功!请静待审核");
					window.location.href="index.jsp";
				},'json')
			}else{
				toast(validateResult.msg);
			}
		},
		formValidate : function(formData){
			var result = {
				status : false,
				msg : ''
			};
			if(!page.validate(formData.flag,'require')){
				result.msg = "请选择企业类型";
				return result;
			}
			if(!page.validate(formData.name,'require')){
				result.msg = "企业名称不能为空";
				return result;
			}
			if(!page.validate(formData.businessLicense,'require')){
				result.msg = "注册代码不能为空";
				return result;
			}
			if(!page.validate(formData.contactName,'require')){
				result.msg = "请填写联系人姓名";
				return result;
			}
			if(!page.validate(formData.contactNumber,'require')){
				result.msg = "请填写手机号码";
				return result;
			}
			if(!page.validate(formData.contactNumber,'phone')){
				result.msg = "手机号码格式不正确";
				return result;
			}
			if(!page.validate(formData.address,'require')){
				result.msg = "请填写企业地址";
				return result;
			}
			if(!page.validate(formData.introduct,'require')){
				result.msg = "请填写企业简介";
				return result;
			}
			if(!page.validate(formData.coverUrl,'src')){
				result.msg = "请上传企业宣传图片";
				return result;
			}
			if(!page.validate(formData.videoUrl,'src')){
				result.msg = "请上传企业宣传视频";
				return result;
			}
			if(!page.validate(formData.qrCode,'src')){
				result.msg = "请上传企业宣传二维码";
				return result;
			}
			console.log("test1")
			//通过验证，返回正确提示
			result.status = true;
			result.msg = "报名成功";
			return result;
		}
		
	}
	</script>
</html>

