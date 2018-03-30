<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>商家入驻</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/personalCen/css/merchantEntry.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/layer.css"/>
	</head>
	<body>
		<div id="content">
		<%@ include file="../../head.jsp"%> 
		<!-- 个人中心内容 -->
		<div class="personalCenCon clearfix w1100">
			<%@ include file="personalHead.jsp"%>  
			<div class="rightPersonal fr">
				<strong class="rightTit"><span></span>商家入驻</strong>
				<div class="rightCon">
					<div class="merchantWrap">
						<div class="refundNav">
							<ul class="clearfix">
							<c:if test="${userIdent == null}">
								<li class="active">
									<span class="triSpanR"></span>
									<span class="stepNum posL1">01</span>
									<p>申请商家入驻</p>
								</li>
								<li>
									<span class="triSpanL"></span>
									<span class="triSpanR"></span>
									<span class="stepNum posL2">02</span>
									<p>审核中</p>
								</li>
								<li>
									<span class="triSpanL"></span>
									<span class="stepNum posL3">03</span>
									<p>审核成功</p>
								</li>
							</c:if>
							<c:if test="${userIdent != null && userIdent.status==0}">
								<li class="active">
									<span class="triSpanR"></span>
									<span class="stepNum posL1">01</span>
									<p>申请商家入驻</p>
								</li>
								<li  class="active">
									<span class="triSpanL"></span>
									<span class="triSpanR"></span>
									<span class="stepNum posL2">02</span>
									<p>审核中</p>
								</li>
								<li>
									<span class="triSpanL"></span>
									<span class="stepNum posL3">03</span>
									<p>审核成功</p>
								</li>
							</c:if>
							<c:if test="${userIdent != null && userIdent.status!=0}">
								<li class="active">
									<span class="triSpanR"></span>
									<span class="stepNum posL1">01</span>
									<p>申请商家入驻</p>
								</li>
								<li class="active">
									<span class="triSpanL"></span>
									<span class="triSpanR"></span>
									<span class="stepNum posL2">02</span>
									<p>审核中</p>
								</li>
								<li  class="active">
									<span class="triSpanL"></span>
									<span class="stepNum posL3">03</span>
									<c:if test="${userIdent.status==1}">
										<p>审核成功</p>
									</c:if>
									<c:if test="${userIdent.status==2}">
										<p>审核失败</p>
									</c:if>
								</li>
							</c:if>
							</ul>
						</div>
						<c:if test="${userIdent.status==2}">
						<div>   
						审核未通过原因：${userIdent.content}
						</div>
						</c:if>
						<div class="merchantDiv">
							<form id="addIdentForm" method="post">
							
								<input type="hidden" id="id" name="id" value="${userIdent.id}" >
								<strong class="comTit">申请人信息</strong>
								<div class="comMerchantCon">
									<span class="titSpan" style="left: 55px;"><em>*</em>身份证号：</span>
									<input type="text" name="cardid" id="cardid" placeholder="请输入身份证号" onblur="checkCard()" value="${userIdent.cardid}"/>
								</div>
							
								<div class="comMerchantCon clearfix">
									<span class="titSpan"><em>*</em>手持身份证：</span>
									<div class="fl">
									    <input type="hidden" id="handcard1" value="${userIdent.handcard}" >
										<input id="handcard" type="file" name="pictures" style="display: none;"  onchange="preview(this,'pinkIdenImgDiv')"/>
										<c:if test="${userIdent.handcard==null}">
											<a href="javascript:void(0)" onclick="selectImg('handcard')"><span>点击上传图片</span></a>
											<div id="pinkIdenImgDiv" class="comPreview" onclick="selectImg('handcard')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.handcard!=null}">
											<a href="javascript:void(0)"></a>
											<div id="pinkIdenImgDiv" class="comPreviewShow" onclick="selectImg('handcard')"><img src="/${userIdent.handcard}"/></div>
										</c:if>
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的手持身份证上身照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan"><em>*</em>身份证正面：</span>
									<div class="fl">
										<input type="hidden" id="cardfront1" value="${userIdent.cardfront}" >
										<input type="file" id="cardfront" name="pictures" style="display: none;" value="${userIdent.cardfront}" onchange="preview(this,'frontImgDiv')"/>
										<c:if test="${userIdent.cardfront==null}">
											<a href="javascript:void(0)" onclick="selectImg('cardfront')"><span>点击上传图片</span></a>
											<div id="frontImgDiv" class="comPreview" onclick="selectImg('cardfront')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.cardfront!=null}">
											<a href="javascript:void(0)"></a>
											<div id="frontImgDiv" class="comPreviewShow" onclick="selectImg('cardfront')"><img src="/${userIdent.cardfront}"/></div>
										</c:if>
										
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的身份证正面照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
									<div class="exampleDiv fl">
										<span>范例：</span>
										<img src="${pageContext.request.contextPath }/web/Module/personalCen/images/font.jpg" height="90" />
									</div>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan"><em>*</em>身份证反面：</span>
									<div class="fl">
										<input type="hidden" id="cardafter1" value="${userIdent.cardafter}" >
										<input type="file" id="cardafter" name="pictures" style="display: none;" value="${userIdent.cardafter}" onchange="preview(this,'backImgDiv')"/>
										<c:if test="${userIdent.cardafter==null}">
											<a href="javascript:void(0)" onclick="selectImg('cardafter')"><span>点击上传图片</span></a>
											<div id="backImgDiv" class="comPreview" onclick="selectImg('cardafter')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.cardafter!=null}">
											<a href="javascript:void(0)"></a>
											<div id="backImgDiv" class="comPreviewShow" onclick="selectImg('cardafter')"><img src="/${userIdent.cardafter}"/></div>
										</c:if>	
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的身份证反面照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
									<div class="exampleDiv fl">
										<span>范例：</span>
										<img src="${pageContext.request.contextPath }/web/Module/personalCen/images/back.jpg" height="90" />
									</div>
								</div>
								<strong class="comTit marginTitT">申请公司信息</strong>
								<div class="comMerchantCon">
									<span class="titSpan" style="left: 55px;"><em>*</em>对公账号：</span>
									<input type="text" name="publicaccount" placeholder="请输入对公账号" value="${userIdent.publicaccount}"/>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan" style="left: 55px;"><em>*</em>营业执照：</span>
									<div class="fl">
										<input type="hidden" id="licence1" value="${userIdent.licence}" >
										<input type="file" id="licence" name="pictures" style="display: none;" value="${userIdent.licence}"  onchange="preview(this,'companyImgDiv')"/>
										<c:if test="${userIdent.licence==null}">
											<a href="javascript:void(0)" onclick="selectImg('licence')"><span>点击上传图片</span></a>
											<div id="companyImgDiv" class="comPreview" onclick="selectImg('licence')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.licence!=null}">
											<a href="javascript:void(0)"></a>
											<div id="companyImgDiv" class="comPreviewShow" onclick="selectImg('licence')"><img src="/${userIdent.licence}"/></div>
										</c:if>
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的营业执照照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
									<div class="exampleDiv fl">
										<span>范例：</span>
										<img src="${pageContext.request.contextPath }/web/Module/personalCen/images/company.jpg" height="92" />
									</div>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan"><em>*</em>开户许可证：</span>
									<div class="fl">
										<input type="hidden" id="openlicence1" value="${userIdent.openlicence}" >
										<input type="file" name="pictures" id="openlicence" style="display: none;"  value="${userIdent.openlicence}" onchange="preview(this,'kaihuxukeDiv')"/>
										<c:if test="${userIdent.openlicence==null}">	
											<a href="javascript:void(0)" onclick="selectImg('openlicence')"><span>点击上传图片</span></a>
											<div id="kaihuxukeDiv" class="comPreview" onclick="selectImg('openlicence')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.openlicence!=null}">	
											<a href="javascript:void(0)"></a>
											<div id="kaihuxukeDiv" class="comPreviewShow" onclick="selectImg('openlicence')"><img src="/${userIdent.openlicence}"/></div>
										</c:if>
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的开户许可证照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan" style="left: 15px;"><em>*</em>法人身份证正面：</span>
									<div class="fl">
										<input type="hidden" id="facarfront1" value="${userIdent.facarfront}" >
										<input type="file" name="pictures" id="facarfront" style="display: none;" value="${userIdent.facarfront}" onchange="preview(this,'farenFontImgDiv')"/>
										<c:if test="${userIdent.facarfront==null}">	
											<a href="javascript:void(0)" onclick="selectImg('facarfront')"><span>点击上传图片</span></a>
											<div id="farenFontImgDiv" class="comPreview" onclick="selectImg('facarfront')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.facarfront!=null}">	
											<a href="javascript:void(0)"></a>
											<div id="farenFontImgDiv" class="comPreviewShow" onclick="selectImg('facarfront')"><img src="/${userIdent.facarfront}"/></div>
										</c:if>
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的法人身份证正面照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
									<div class="exampleDiv fl">
										<span>范例：</span>
										<img src="${pageContext.request.contextPath }/web/Module/personalCen/images/font.jpg" height="92" />
									</div>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan" style="left: 15px;"><em>*</em>法人身份证反面：</span>
									<div class="fl">
										<input type="hidden" id="facardafter1" value="${userIdent.facardafter}" >
										<input type="file" name="pictures" id="facardafter" style="display: none;"  value="${userIdent.facardafter}" onchange="preview(this,'farenImgBackDiv')"/>
										<c:if test="${userIdent.facardafter==null}">	
											<a href="javascript:void(0)" onclick="selectImg('facardafter')"><span>点击上传图片</span></a>
											<div id="farenImgBackDiv" class="comPreview" onclick="selectImg('facardafter')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.facardafter!=null}">	
											<a href="javascript:void(0)"></a>
											<div id="farenImgBackDiv" class="comPreviewShow" onclick="selectImg('facardafter')"><img src="/${userIdent.facardafter}"/></div>
										</c:if>
									
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的法人身份证反面照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
									<div class="exampleDiv fl">
										<span>范例：</span>
										<img src="${pageContext.request.contextPath }/web/Module/personalCen/images/back.jpg" height="92" />
									</div>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan" style="left: 70px;"><em>*</em>委托书：</span>
									<div class="fl">
										<input type="hidden" id="proxy1" value="${userIdent.proxy}" >
										<input type="file" name="pictures" id="proxy" style="display: none;" value="${userIdent.proxy}" onchange="preview(this,'weituoImgDiv')"/>
										
										<c:if test="${userIdent.proxy==null}">	
											<a href="javascript:void(0)" onclick="selectImg('proxy')"><span>点击上传图片</span></a>
											<div id="weituoImgDiv" class="comPreview" onclick="selectImg('proxy')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.proxy!=null}">	
											<a href="javascript:void(0)"></a>
											<div id="weituoImgDiv" class="comPreviewShow" onclick="selectImg('proxy')"><img src="/${userIdent.proxy}"/></div>
										</c:if>
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的委托书照片</p>
										<p class="margTp">b.非法人申请请上传法人委托书</p>
										<p class="margTp">c.文件大小应小于2M</p>
										<p class="margTp">d.支持jpg/png等格式的图片</p>
									</div>
								</div>
								<strong class="comTit marginTitT">合同信息</strong>
								<div class="comMerchantCon">
									<span class="titSpan" style="left: 13px;">合同申请人姓名：</span>
									<input type="text" placeholder="请输入合同申请人姓名" name="contractname" value="${userIdent.contractname}"/>
								</div>
								<div class="comMerchantCon clearfix">
									<span class="titSpan" style="left: 55px;">合同证件：</span>
									<div class="fl">
										<input type="hidden" id="contractpaper1" value="${userIdent.contractpaper}" >
										<input type="file" name="pictures" id="contractpaper" style="display: none;" value="${userIdent.contractpaper}" onchange="preview(this,'contractImgDiv')"/>
										<c:if test="${userIdent.contractpaper==null}">
											<a href="javascript:void(0)" onclick="selectImg('contractpaper')"><span>点击上传图片</span></a>
											<div id="contractImgDiv" class="comPreview" onclick="selectImg('contractpaper')"><img src=""/></div>
										</c:if>
										<c:if test="${userIdent.contractpaper!=null}">
											<a href="javascript:void(0)"></a>
											<div id="contractImgDiv" class="comPreviewShow" onclick="selectImg('contractpaper')"><img src="/${userIdent.contractpaper}"/></div>
										</c:if>
									</div>
									<div class="tipInfo fl">
										<p>a.请上传清晰的合同证件照片</p>
										<p class="margTp">b.文件大小应小于2M</p>
										<p class="margTp">c.支持jpg/png等格式的图片</p>
									</div>
								</div>
								
							</form>
							<c:if test="${userIdent.status!=1}">
								<input class="subBtn" type="button" value="提交资料" onclick="saveIdent()"/>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="../../foot.jsp"%> 
		
		<script src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/layer.js"></script>
		<script type="text/javascript">
			function selectImg(fileInp){
				$("#"+fileInp).trigger("click");
			}
			function preview(file,imgDiv) {//预览图片得到图片base64
			    if (file.files && file.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (evt) {
			            $("#"+imgDiv).show().find("img").attr("src",evt.target.result);
			        }
			        reader.readAsDataURL(file.files[0]);
			    } 
			}
			//onchange="handleFileSelect(this,'companyImgDiv')"
			/* function handleFileSelect() {
				
				var formData=new FormData();
		       for(var i=0;i<$("#handcard")[0].files.length;i++){
		        	formData.append('pictures', $("#handcard")[0].files[i]);
		        }
		        
		        formData.append('pictures', $("#handcard")[0].files[0])
		        console.log(formData.get("pictures"))
		        $.ajax({
					method : 'post',
					url : '${pageContext.request.contextPath }/web/shop/userIdentApi/uploadImg.htm',
					cache : false,
					contentType : false,
					processData : false,
					data : formData,
					success : function(data) {
						console.log(data);

					}
				}) 
		    } */
			
			/* document.querySelector('#handcard').addEventListener('change', handleFileSelect, false); */
			
			
			
			var flag=true;
			function checkCard(){
				 var ID1=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
				 var cardid=$("#cardid").val();
				 if(cardid!=""){
					 if (!ID1.test(cardid)){
						 layer.msg("身份证号格式不正确");
						 flag=false;
						    return false;
						}else{
							flag=true; 
						}
				 }
			}
			function saveIdent(){
				var cardid=$("#cardid").val();
				var handcard=$("#handcard").val();
				var cardfront=$("#cardfront").val();
				var cardafter=$("#cardafter").val();
				var publicaccount=$("#publicaccount").val();
				var licence=$("#licence").val();
				var openlicence=$("#openlicence").val();
				var facarfront=$("#facarfront").val();
				var facardafter=$("#facardafter").val();
				var proxy=$("#proxy").val();
				var contractname=$("#contractname").val();
				var contractpaper=$("#contractpaper").val();
			
				var handcard1=$("#handcard1").val();
				var cardfront1=$("#cardfront1").val();
				var cardafter1=$("#cardafter1").val();

				var licence1=$("#licence1").val();
				var openlicence1=$("#openlicence1").val();
				var facarfront1=$("#facarfront1").val();
				var facardafter1=$("#facardafter1").val();
				var proxy1=$("#proxy1").val();
				var contractpaper1=$("#contractpaper1").val();
				checkCard();
				
				//alert(handcard)
				/* if(flag==false){
					layer.msg("请安照规范填写信息");
					return false;
				} */
				
				if(cardid==""){
					layer.msg("身份证号不能为空");
					return false;
				}
				if(handcard1==""){
					if(handcard==""){
					layer.msg("手持身份证不能为空");
					return false;
					}
				}
				if(cardfront1==""){
					if(cardfront==""){
					layer.msg("身份证正面不能为空");
					return false;
					}
				}
				if(cardafter1==""){
					if(cardafter==""){
						layer.msg("身份证反面不能为空");
						return false;
					}
				}	

				if(publicaccount==""){
					layer.msg("对公账户不能为空");
					return false;
				}
	
				
				if(licence1==""){
					if(licence==""){
						layer.msg("营业执照不能为空");
						return false;
					}
				}
				if(openlicence1==""){
					if(openlicence==""){
						layer.msg("开户许可证不能为空");
						return false;
					}
				}
				if(facarfront1==""){
					if(facarfront==""){
						layer.msg("法人身份证正面不能为空");
						return false;
					}
				}
				if(facardafter1==""){
					if(facardafter==""){
						layer.msg("法人身份证反面不能为空");
						return false;
					}
				}	
				if(proxy1==""){
					if(proxy==""){
						layer.msg("委托书不能为空");
						return false;
					}
				}	
				if(contractname==""){
					layer.msg("合同人姓名不能为空");
					return false;
				}
				if(contractpaper1==""){
					if(contractpaper==""){
						layer.msg("合同证件照不能为空");
						return false;
					}
				}
				$.ajax({
				    type: 'post',  
				    cache: false,
		            contentType: false,
		            processData: false,
		            data: new FormData($("#addIdentForm")[0]),
				    url: "${pageContext.request.contextPath }/web/shop/userIdentApi/addIdent.htm",
				    success: function (data) {	        	
				    	 if(data.result=="ok"){
				    		layer.msg("提交成功");
				    		setTimeout('window.location.href = "${pageContext.request.contextPath}/web/shop/userIdentApi/toIdentJsp.htm"',1500);
				    	 }else{
				    		 layer.msg("提交失败");
				    		 
				    	 }  
				    }
				    });
			}
			
			function message(username){
				mymsg(username);
			}
			
			function mymsg(str){
				$.ajax({
					type:'post',
					data:"username="+str,
					url:'${pageContext.request.contextPath}/web/tuimsgController/getPersonTuimsg.htm',
					success:function(data){
						$("#content").html(data);	
					},
					error:function(data){
					}
				});			
			}
		</script>
	</body>
</html>
