<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="UTF-8">
	<title>${productInfo.name }竞拍商品详情</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/web/Module/auctionProDetail/css/auctionProDetail.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/layui/css/layui.css">
</head>

<body>
		<%@ include file="../../head.jsp"%> 
		<div class="auctionDetail w1100">
			<!-- 面包屑 -->
			<p class="smNavP"><a href="${pageContext.request.contextPath}/web/productInfoWeb/list.htm">竞拍专区</a>&gt;<a href="">和田玉</a></p>
			<div class="detailAuc clearfix">
				<div class="detailAuc_left fl">
					<div class="topAcution clearfix">
						<!-- 左侧产品图 -->
						<div class="leftProImg">
							<div id="preview" class="spec-preview"> 
								<span class="jqzoom">
									<img jqimg="${pageContext.request.contextPath}/web/images/big1.jpg" src="${pageContext.request.contextPath}/web/images/small1.jpg" alt="">
								</span> 
							</div>
							<!-- 缩略图 -->
							<div class="spec-scroll"> 
								<a class="prev">&lt;</a> 
								<a class="next">&gt;</a>
						      	<div class="items">
						      		<ul>
						      			<c:forEach items="${pritureLB}" var="lb">
						      				<li><img bimg="/${lb.picture}" src="/${lb.smallPicture}" onmousemove="preview(this);"></li>
						      			</c:forEach> 
						      		</ul>
						      	</div>
						   </div>
						</div>
						<!-- 右侧信息 -->
						<div class="rightProInfo fr">
							<div class="proTit clearfix">
								<div class="leftProTit fl clearfix">
									<p class="tiitP">${productInfo.name }</p>
									<div class="auctingTxt fl" id="pm">正在拍卖<span></span></div>
									<p class="countDown fl" id="types">
										<span>距结束：</span>
										<span id="countDown"><em>07</em>时<em>25</em>分<em>18</em>秒</span>
									</p>
								</div>
								<%-- <div class="setClock fr" onclick="sztx(${setup.id});"> --%>
								<div class="setClock fr">
									<c:if test="${flag!=1 }">
										<c:choose>
											<c:when test="${remind==0 }">
												<a href="javascript:void(0)"  onclick="reminding(${productInfo.id },${upId })">
													<img src="${pageContext.request.contextPath}/web/Module/auctionProDetail/images/clock.png"/>
													<span>设置提醒</span>
												</a>
											</c:when>
											<c:otherwise> 
												<a href="javascript:void(0)"  onclick="setRemind()">
													<img src="${pageContext.request.contextPath}/web/Module/auctionProDetail/images/clock.png"/>
													<span>设置提醒</span>
												</a>
											</c:otherwise>
										</c:choose> 
									</c:if>
								</div>
							</div>
							<div class="paimaiCon" id="pmcj" >
								<p class="nowPricP">当前价<strong>${nowPrice }</strong><span></span></p>
								<p>底<span class="oneBlank"></span>价<strong>${setup.startPrice }</strong>积分</p>
								<p class="nowPricP">出价<input type="text" value="${offer }" id="price"></p>
								<button onclick="plus(${setup.ladder })">+${setup.ladder }</button>
								<button onclick="reduce(${setup.ladder })">-${setup.ladder }</button>
								<div class="applyAcu">
									<c:if test="${isZJP==1 }">
										<c:choose>
											<c:when test="${bondType==1 }">
												<a href="javascript:void(0)" onclick="offer(${setup.startPrice },${setup.ladder },${setup.id });"><span></span>出价</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:void(0)" onclick="Bond();"><span></span>交保证金</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</div>
								<a class="buyHis" onclick="viewHisRecord()" href="javascript:void(0)">出价记录&gt;&gt;</a>
							</div>
							<div class="tipInfo">
								<ul>
									<li><span>${signUpCount }</span>人报名<em></em></li>
									<li class="setClockLi"><span>${remindSize }</span>人设置提醒<em></em></li>
									<li><span>${setup.pageView }</span>次围观</li>
								</ul>
							</div>
							<div class="detailInfo">
								<ul class="clearfix">
									<li>起拍价：${setup.startPrice }积分</li>
									<li>加价幅度：${setup.ladder }积分</li>
									<li>保证金：${setup.bond }积分</li>
									<li>佣<span class="oneBlanks"></span>金：无</li>
									<li>延时周期：无</li>
									<li>保留价：无</li>
								</ul>
							</div>
							<!-- <p class="sendAucComp">送拍机构：</p> -->
							<!-- <p class="specServe">特色服务：<span><em></em>假一赔三</span><span><em class="secEm"></em>鉴定证书</span></p> -->
						</div>
					</div>
					<div class="echartsDiv clearfix">
						<!-- 历史出价记录 -->
						<div style="width:400px;height:300px;float:left;" id="main1"></div>
						<!-- 本次出价记录 -->
						<div style="width:400px;height:300px;float:left;" id="main" ></div>
					</div> 
					<!-- 竞拍商品详情 -->
					<div class="detailAuctionCon">
						<div class="topAucDetailNav">
							<ul class="clearfix">
								<li class="active"><a href="#1F">拍品描述</a></li>
								<li><a href="#2F" id="hisRecord">出价记录(${size })</a></li>
								<li><a href="#3F">服务保障</a></li>
								<li><a href="#4F">保证金须知</a></li>
							</ul>
						</div>
						<div class="botAucDetailCon">
							<div class="wenxinTip">
								<strong>友情提醒：</strong>
								<p>1.真伪：上拍机构的企业相关资质已审核，但拍品介绍（包括图片、文字、视频等）以及拍品资质文件（来源证明、鉴定证书等）均由机构自行发布并上传，所有上拍的拍品由送拍机构自行承担相应担保责任；</p>
								<p>2.退换货：拍卖拍品不同于普通网购商品，多数属于孤品，消费者通过竞价方式购买拍品，一旦售出将影响拍品价值，“7天退货”服务为卖家可选服务保障，不强制送拍机构提供，竞拍前请充分考虑。</p>
							</div>
							<div class="aucBanner">
								<a href=""><img src="${pageContext.request.contextPath}/web/Module/auctionProDetail/images/aucBanner.jpg" /></a>
							</div>
							<!-- 拍品描述 -->
							<div class="comAucDetailCon paipinDescPart">
								<div id="1F" class="comBigAucTit">
									<div class="bigTitTxt">拍品描述</div>
									<div class="bigTitLine"></div>
								</div>
								<div class="comInnerAucDetail">
									<!-- 拍品介绍 -->
									<div class="innerPaiPinDesc">
										<div class="comSmAucTit">
											<div class="smTitTxt">拍品介绍</div>
											<div class="smTitLine"></div>
										</div>
										<p>${product.describes }</p>
									</div>
									<!-- 拍品属性信息 -->
									<div class="innerPaiPinInfo">
										<div class="comSmAucTit">
											<div class="smTitTxt">拍品信息</div>
											<div class="smTitLine"></div>
										</div>
										<!-- table -->
										<table align="center" border="0"  cellpadding="0" cellspacing="0">
											<tr>
												<td class="titTd" width="104" align="center">产地</td>
												<td class="conTd" width="280">${product.origin }</td>
												<td class="titTd" width="104" align="center">重量</td>
												<td class="conTd" width="280">${product.weight }</td>
											</tr>
											<tr>
												<td class="titTd" width="104" align="center">尺寸</td>
												<td class="conTd" width="280" colspan="3">${product.size }</td>
											</tr>
											<tr>
												<td class="titTd" width="104" align="center">证书机构名称</td>
												<td class="conTd" width="280" colspan="3">${product.organization }</td>
											</tr>
											<tr>
												<td class="titTd" width="104" align="center">证书机构网站</td>
												<td class="conTd" width="280" colspan="3">${product.website }</td>
											</tr>
											<tr>
												<td class="titTd" width="104" align="center">证书编号</td>
												<td class="conTd" width="280" colspan="3">${product.certifi }</td>
											</tr>
											<tr>
												<td class="titTd" width="104" align="center">产品简介</td>
												<td class="conTd" width="280" colspan="3">${product.describes }</td>
											</tr> 
										</table>
									</div>
									<!-- 拍品详图 -->
									<div class="innerPaiPinImg">
										<div class="comSmAucTit">
											<div class="smTitTxt">拍品展示</div>
											<div class="smTitLine"></div>
										</div>
										<div class="paiPinImg">
											<c:forEach items="${pritureList }" var="list">
												<img src="/${list.picture}" />
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<!-- 出价记录 -->
							<div class="comAucDetailCon chujiaHisPart">
								<div id="2F" class="comBigAucTit">
									<div class="bigTitTxt">出价记录</div>
									<div class="bigTitLine"></div>
								</div>
								<div class="listHisRecord">
									<div class="hisRecordNav">
										<ul class="clearfix">
											<li class="comRecWid1">状态</li>
											<li class="comRecWid1">价格</li>
											<li class="comRecWid2">竞拍人</li>
											<li class="comRecWid3">时间</li>
											<li class="comRecWid4">操作</li>
										</ul>
									</div>
									<div class="hisRecordCon">
										<ul class="clearfix"  id="hisUl" >
											<c:forEach items="${list }" var="list" varStatus="status">
												<li class="clearfix">
													<c:choose>
														<c:when test="${status.count==1 }">
															<p class="comRecWid1">
																<span>领先</span>
															</p>
														</c:when>
														<c:otherwise>
															<p class="comRecWid1">
																<span style="color:#999;">出局</span>
															</p>
														</c:otherwise>
													</c:choose>
													<p class="comRecWid1"><span>¥${list.offer}</span></p>
													<p class="comRecWid2">${list.name }</p>
													<p class="comRecWid3">${list.createTime }</p>
													<p class="comRecWid4">
														<c:if test="${list.bidder==userInfo.id }">
															<c:choose>
																<c:when test="${list.status==2 }">
																	已撤回
																</c:when>
																<c:otherwise>
																	<c:if test="${flag!=1 }">
																		<a href="javascript:void(0)" onclick="ch(${list.id},${setup.id });" id="ch_${list.id }">撤回</a>
																	</c:if>
																</c:otherwise>
															</c:choose>
														</c:if>
														<c:if test="${isZJP==0 }">
															<c:if test="${flag!=1 }">
																<c:if test="${list.status!=2 }">
																	<a href="javascript:void(0)" onclick="cj(${list.id},1,${productInfo.id },${upId })">成交</a>
																</c:if>
															</c:if>
														</c:if>
													</p>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div id="hisPage" style="padding-left:20%"></div>

								</div>

							</div>
							<!-- 服务保障 -->
							<div class="comAucDetailCon servicePart">
								<div id="3F" class="comBigAucTit">
									<div class="bigTitTxt">服务保障</div>
									<div class="bigTitLine"></div>
								</div>
								<div class="serviceCon">
									<strong class="bigServiceTit">一、服务承若</strong>
									<p class="smServiceTit">A、商家承诺</p>
									<p class="serviceConP">1.卖家承诺所发拍品如实描述。</p>
									<p class="serviceConP">2.卖家成交不卖，卖家应将保证金退一赔一给竞买成功人。</p>
									<p class="serviceConP">3.竞拍成功后，拍品全国包邮(港澳台除外)。其中拍品重50斤以上（大件家具30斤）或面积大于2个平方不包邮，二手车、房地产、运输设备、不动产、明星见面会等也不包邮。</p>
									<p class="smServiceTit">B. 拍卖行承诺</p>
									<p class="serviceConP">友情提示:根据中华人民共和国法律，拍卖行具有合法的拍卖经营主体资格，在中华人民共和国法律和政策允许的范围内，组织和开展拍卖活动。凡参加拍卖行组织、开展的文物、网络竞投拍卖、艺术品等收藏品拍卖活动的委托人、竞买人、买受人和其他相关各方均视为同意且应遵守《中华人民共和国拍卖法》。</p>
									<p class="serviceConP">1. 依据《中华人民共和国拍卖法》的规定，拍卖行承诺如实描述拍品。</p>
									<p class="serviceConP">2.拍卖行成交不卖，拍卖行应将保证金退一赔一向竞买成功人。</p>
									<p class="serviceConP">3.关于拍卖行佣金收取：依据《中华人民共和国拍卖法》的规定，竞买人在竞拍成功后，需根据拍卖行约定（商品页面描述佣金额），缴纳约定比例、数额的佣金。</p>
									<p class="serviceConP">4.关于运费：由竞买成功人承担，以拍卖行实际商品描述运费为准。（如：贵重商品额外保险费用需要由竞买成功人承担）。</p>
									<strong class="bigServiceTit margTit">二、竞拍活动基础服务</strong>
									<p class="serviceConP">1.如实描述承诺：卖家承诺如实描述，一旦发现描述不符的拍品，买家可在交易成功后指定期限内向平台投诉卖家。</p>
									<p class="serviceConP">2.保证金保障：卖家入驻竞拍平台需缴纳较高的经营保证金，买家维权有保障。</p>
									<strong class="bigServiceTit margTit">三、拍卖行特色服务</strong>
									<p class="smServiceTit">A. 不支持7天无理由退货</p>
									<p class="serviceConP">拍卖拍品不同于普通网购商品，多数属于孤品或者数量较少，消费者通过竞价方式购买拍品，一旦售出将影响拍品价值，不支持7天无理由退货。</p>
									<p class="smServiceTit">B. 支持线下预览</p>
									<p class="serviceConP">送拍机构如支持线下预览是指其公司已选定场地预展拍品，竞买人可在竞拍结束前，亲自或委托他人查看竞拍品实物；如竞拍者未到现场鉴赏，视默认为该竞拍品的实际属性。</p>
									<p class="smServiceTit">C. 关于鉴定证书</p>
									<p class="serviceConP">若拍卖行选择提供鉴定证书，即卖家承诺所发布的拍品已取得省级以上鉴定证书或作者本人出具的书面鉴定文本，反之即不提供。</p>
								</div>
							</div>
							<!-- 保证金须知 -->
							<div class="comAucDetailCon baozhengjinPart">
								<div id="4F" class="comBigAucTit">
									<div class="bigTitTxt">保证金须知</div>
									<div class="bigTitLine"></div>
								</div>
								<div class="serviceCon">
									<strong class="bigServiceTit">一、保证金的缴纳：</strong>
									<p class="serviceConP">保证金是竞拍人参加竞拍的凭证，如用户有意参加相关商品竞拍活动，则须缴纳卖家设置的参与竞拍活动的保证金。</p>
									<p class="smServiceTit">缴纳次数：</p>
									<p class="serviceConP">如参加升价拍，每个商品的竞拍只需要缴纳一次保证金；</p>
									<p class="serviceConP">如参加降价拍，每出价一次都需要缴纳一次保证金，并且每次出价只可以竞拍一件拍品。</p>
									<strong class="bigServiceTit margTit">二、保证金的返还：</strong>
									<p class="smServiceTit">在符合以下条件时将原路退还用户保证金：</p>
									<p class="serviceConP">1.用户未成功竞拍商品：例如在竞拍过程中始终未出价、在竞拍过程中放弃加价等情况；</p>
									<p class="serviceConP">2.用户竞拍成功后，商家主动关闭交易或未履约发货或因商家其他原因导致交易未完成的；</p>
									<p class="serviceConP">竞拍结束后，系统会自动在1-15个工作日内将款项内退还到支付账号中，如您缴纳的竞拍保证金符合退还条件，但是系统未予退还，您可以联系京东客服400-606-5500，我们会尽快帮您处理。</p>
									<strong class="bigServiceTit margTit">三、保证金的扣除：</strong>
									<p class="serviceConP">1.在升价拍竞拍成功之时起的72小时内未按照成交价格支付拍品货款的；在降价拍竞拍成功之时起的24小时内未按照成交价格支付拍品货款的。</p>
									<p class="serviceConP">2.在竞拍成功且付款后，竞拍人申请退款（卖家提供7天无理由退货服务的除外）。</p>
									<p class="serviceConP">如因卖家原因导致竞拍人不付款，竞拍人可在交易关闭的15天内联系京东客服400-606-5500，逾期保证金申诉不给予受理。</p>
									<strong class="bigServiceTit margTit">四、保证金抵货款：</strong>
									<p class="serviceConP">用户竞拍成功后，用户缴纳的保证金将自动转化为部分成交款，在用户缴纳完毕除保证金外的剩余成交款及拍卖佣金后，由京东将保证金、剩余成交款和拍卖佣金统一结算给送拍机构 。</p>
									<strong class="bigServiceTit margTit">五、违约责任成交不卖的违约赔偿：：</strong>
									<p class="serviceConP">用户竞拍成功并支付成交款后，如因送拍机构原因出现了“成交不卖”的违规行为，包括但不限于关闭交易或未履约发货，送拍机构应为用户办理退款，同时，用户还将获得由送拍机构提供的金额为所缴纳保证金金额一倍的违约金作为赔偿。退款、赔偿及法律责任的追究，由送拍机构线下与用户自行联系完成。所涉款项不通过京东平台支付，京东平台亦不对此承担任何义务与法律责任。</p>
									<p class="serviceConP"><img src="${pageContext.request.contextPath}/web/Module/auctionProDetail/images/baozhengjin.jpg"/></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="sideAuction fr">
					<div class="innerSide">
						<div class="smMod">
							<strong>推荐好货</strong>
						</div>
						<div class="goodProList">
							<ul>
								<c:forEach items="${tjList }" var="list">
									<li>
										<div class="proImg">
											<img src="${pageContext.request.contextPath}/web/Module/auctionArea/images/haohuo.jpg"/>
											<p class="proTit1">
												<a href="${pageContext.request.contextPath}/web/productInfoWeb/detail.htm?id=${list.id}&upId=${list.setUpId}">${list.name }</a>
											</p>
										</div>
										<p class="nowPrice">当前价：<span>¥${list.moneyNow }</span></p>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>			
				<!-- 待拍展品 -->
				<div class="waitAuction fl w1100">
					<p class="waitTit">待拍展品</p>
					<div class="waitProList">
						<div class="comTri leftTri"></div>
						<div class="comTri rightTri"></div>
						<div class="listWaitAuc">
							<ul class="clearfix">
								<c:forEach items="${hList }" var="list">
									<li>
										<div class="waitAucImg">
											<img src="${pageContext.request.contextPath}/web/Module/auctionArea/images/waitAuc.jpg"/>
											<p class="aucTit"><a href="">${list.name }</a></p>
										</div>
										<p class="nowPrice1">当前价：<span>¥${list.moneyNow }</span></p>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div> 
		</div>
		<%@ include file="../../foot.jsp"%> 
		<div class="layer"></div>
		<!-- 设置提醒 -->
		<div class="setTipWin">
			<div class="tipTit">设置提醒<span class="closeSp" onclick="cancelRemind()"></span></div>
			<div class="setTipCon">
				<div class="innerSetTitCon">
					<p class="innerTit"><span class="tipIcon"></span>提醒时间</p>
					<div class="clearfix">
						<label class="setLabel">
							<input type="text" id="startTime" value="${remindTime }" onclick="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm',minDate:'${start }',maxDate:'${end}'})" name="setTimeInp" />
							<!-- <span>开拍前5分钟提醒</span>
							<p class="timeP">03月20号 09:30</p> -->
						</label>
						<!-- <label class="setLabel">
							<input type="checkbox" name="setTimeInp" />
							<span>结束前30分钟提醒</span>
							<p class="timeP">03月31号 10:30</p>
						</label> -->
					</div>
				</div>
				<div class="innerSetTitCon noBorBot">
					<p class="innerTit"><span class="tipIcon1"></span>提醒方式</p>
					<p class="phoneTxt">
						<span>手机短信提醒</span>
						<span class="margLr">手机号码：
							<input name="phone" id="phone1" type="text" value="${userInfo.phone }">
						</span> 
						<!-- <a href="">修改&gt;</a> -->
					<p>
					<p class="phoneTxt margT">已设置的提醒可以在“<a href="${pageContext.request.contextPath}/web/remind/myRemind.htm">我的拍卖-我的提醒</a>”中找到</p>
				</div>
				<div class="btnDiv">
					<c:choose>
						<c:when test="${remind==0 }">
							<!-- 修改 -->
							<button class="sureBtn" onclick="sztx(${setup.id},1)">确定</button>
						</c:when>
						<c:otherwise>
							<!-- 新增 -->
							<button class="sureBtn" onclick="sztx(${setup.id},0)">确定</button>
						</c:otherwise>
					</c:choose>
					<button class="cancelBtn" onclick="cancelRemind()">取消</button>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/web/js/jquery.jqzoom.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/web/js/base.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/echarts/echarts.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/js/charts/chartjs/Chart.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/js/charts/chartjs/chartjs-init.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/admin/assets/layui/layui.js" type="text/javascript" charset="utf-8"></script> 
		<script src="${pageContext.request.contextPath }/web/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
		
			function setRemind(){
				if(userInfo==null || userInfo==''){
					//alert("请先进行登录");
					location.href='${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm';
				}else{
					$(".layer").show();
					$(".setTipWin").show();
				}
			}
			function cancelRemind(){
				$(".layer").hide();
				$(".setTipWin").hide();
			}
		
		 	var flag = '${flag}';
			var serverTime = '${time}'; //服务器时间，毫秒数 
			var type = '${type}';
			var startTime = '${startTime}';
			$(function(){
				smFixedNav();
				if(type==0){
					var dateTime = new Date(); 
					 var difference = dateTime.getTime() - serverTime; //客户端与服务器时间偏移量 
					 setInterval(function(){ 
						if(flag==1){
							 $("#pmcj").html("拍卖已成交");
						     $("#pm").html("拍卖结束");
						     var str = "已结束！"; 
						     $("#countDown").html(str); 
						}else{
							var endTime = new Date(parseInt('${endTime}')); 
							var nowTime = new Date(); 
						    var nMS=endTime.getTime() - nowTime.getTime() + difference; 
						    var myD=Math.floor(nMS/(1000 * 60 * 60 * 24)); //天 
						    var myH=Math.floor(nMS/(1000*60*60)) % 24; //小时 
						    var myM=Math.floor(nMS/(1000*60)) % 60; //分钟 
						    var myS=Math.floor(nMS/1000) % 60; //秒 
						    var myMS=Math.floor(nMS/100) % 10; //拆分秒 
						    if(myD>= 0){ 
						      var str = "<em>"+myD+"</em>天<em>"+myH+"</em>小时<em>"+myM+"</em>分<em>"+myS+"</em>.<em>"+myMS+"</em>秒"; 
						    }else{ 
						      $("#pmcj").html("拍卖已成交");
						      $("#pm").html("拍卖结束");
						      var str = "已结束！";  
						    } 
						    $("#countDown").html(str); 
						}
					  }, 100); //每个0.1秒执行一次 
				}else{
					var str = "<span>开始时间:</span>"+startTime;
					$("#pm").html("等待拍卖");
					$("#types").html(str);
				}
				var myChart = echarts.init(document.getElementById('main'));
				var option = {
					title: {
			            text: '本次出价记录'
			        },
			        tooltip: {
			            trigger: 'axis'
			        },
				    xAxis: {
				        type: 'category',
				        data: ${thisTime}
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [{
				    	data: ${thisCJ},
				        type: 'line'
				    }]
				};
				myChart.setOption(option);
			});
			
			$(function(){
				var myChart1 = echarts.init(document.getElementById('main1'));
				var option1 = {
					title: {
			            text: '历史出价记录'
			        },
			        tooltip: {
			            trigger: 'axis'
			        },
				    xAxis: {
				        type: 'category',
				        data: ${hisTime}
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [{
				    	data: ${history},
				        type: 'line'
				    }]
				};
				myChart1.setOption(option1);
                //出价记录分页加载
                layui.use(['laypage', 'layer'], function(){
                    var laypage = layui.laypage,
                        layer = layui.layer;
                    laypage.render({
                        elem: 'hisPage' ,
                        theme:'#c7171e',
                        limit:'${hisLimit}',
                        count: '${size}',
                        layout: [ 'prev', 'page', 'next', 'skip'],
                        jump: function(obj,first){
                            if(!first){
                                var p=obj.curr;
                                var l=obj.limit;
                                var id='${upId}';
                                $.getJSON('hisLog.htm',{page:p,pageSize:l,id:id},function (data) {
                                    // data=eval(data);
                                    var h = '';
                                    var s;
                                    for(var i=0;i<data.length;i++){
                                        s=(i===0&&p===1);
                                        h=h+'<li class="clearfix">' +
                                            '<p class="comRecWid1"><span '+(s?'':' style="color:#999;" ')+'>'+(s?'领先':'出局')+'</span></p>' +
                                            '<p class="comRecWid1"><span>¥'+data[i].offer.toFixed(2)+'</span></p>' +
                                            '<p class="comRecWid2">'+data[i].bidder+'</p>' +
                                            '<p class="comRecWid3">'+data[i].createTime+'</p>' +
                                            '<p class="comRecWid4"></p>' +
                                            '</li>'
                                    }
                                    $('#hisUl').html(h)
									$('#hisRecord').click()
                                })
                            }
                        }
                    });
                })
			})
			function smFixedNav(){
				$(window).scroll(function(){
					var scrollTop = $(window).scrollTop();
					if(scrollTop >= 913){
						$(".topAucDetailNav").removeClass("posRel").addClass('posFixed');
					}else{
						$(".topAucDetailNav").removeClass("posFixed").addClass('posRel');
					}
					//滚动到标杆位置,左侧导航加active
					$('.comAucDetailCon').each(function(i){
						var wst =  $(window).scrollTop() //
						if($('.comAucDetailCon').eq(i).offset().top <= wst){
							$('.topAucDetailNav li').removeClass('active');
						 	$('.topAucDetailNav li').eq(i).addClass('active');
						}
					});
			
				});
				$('.topAucDetailNav li').click(function(){
					$(this).addClass('active').siblings().removeClass('active');
					//var _i=$(this).index();
					//$('body, html').animate({scrollTop:$('.comAucDetailCon').eq(_i).offset().top},480);
				});
			}
			//查看出价记录
			function viewHisRecord(){
				var priceScrollTop = $(".chujiaHisPart").offset().top;
				$('body, html').animate({scrollTop:priceScrollTop},500);
			}
			var userInfo = '${userInfo}';
			//交保证金
			function Bond(){
				if(userInfo==null || userInfo==''){
					location.href='${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm';
					//alert("请先进行登录");	
				}else{
					if(confirm("确定交保证金吗?")){
						 $.ajax({
					         method:'post',
					         url:'bond.htm',  
					         data:{bond:'${setup.bond }',id:'${setup.id}',productId:'${productInfo.id}'},
					         success:function (data) {
					         	if(data==1){
					         		layer.msg("积分不足");
					         	}else{
					         		layer.msg("保证金缴纳成功");	
					         		location.href="detail.htm?id="+'${productInfo.id}&upId=${setup.id}';
					         	}
					         }
					     })
					}
				}
			}
			
			//出价
			function offer(num,ladder,setup){
				$.ajax({
			         method:'post',
			         url:'notIsOver.htm',  
			         data:{auctionId:'${productInfo.id}',setUpId:setup},
			         success:function (data) {
			        	 if(data==0){
			        		 layer.msg("拍卖已结束，不能出价");
			        		 return;
			        	 }else if(data==2){
			        		 layer.msg("出现异常，请联系客服");
			        	 }else{
			        		 var price = parseInt($("#price").val());
			 				if(price<num){
			 					layer.msg("出价不能低于起拍价");
			 					return;
			 				}else{
			 					if(eval(price-num)%ladder!=0){
			 						layer.msg("出价必须是加价幅度的倍数");
			 						return;	
			 					}else{
			 						$.ajax({
			 					         method:'post',
			 					         url:'offer.htm',  
			 					         data:{offer:price,status:0,auctionId:'${productInfo.id}',setUpId:setup},
			 					         success:function (data) {
			 					        	 if(data==0){
			 					        		layer.msg("出价成功");
			 					        		 location.href="detail.htm?id="+'${productInfo.id}'+"&upId="+setup;
			 					        	 }else if(data==2){
			 					        		layer.msg("积分不足");
			 					        	 }else if(data==3){
			 					        		layer.msg("出价时间不在拍卖时间内");
			 					        	 }else{
			 					        		layer.msg("出现异常，请联系客服");
			 					        	 }
			 					         }
			 					     })
			 					}
			 				}
			        	 }
			         }
			     })
			}
			
			//减
			function reduce(num){
				var price = parseInt($("#price").val());
				if(eval(price-num)<0){
					layer.msg("不能再减了，已经没有了");
					return
				}
				$("#price").val(eval(price-num));
			}
			
			//加
			function plus(num){
				var price = parseInt($("#price").val());
				$("#price").val(eval(price+num));
			}
			
			function ch(id,setup){
				$.ajax({
			         method:'post',
			         url:'notIsOver.htm',  
			         data:{auctionId:'${productInfo.id}',setUpId:setup},
			         success:function (data) {
			        	 if(data==0){
			        		 layer.msg("拍卖已结束，不能撤销");
			        	 }else if(data==2){
			        		 layer.msg("出现异常，请联系客服");
			        	 }else{
			        		 $.ajax({
						         method:'post',
						         url:'withdraw.htm',  
						         data:{id:id},
						         success:function (data) {
						        	 if(data==0){
						        		 layer.msg("撤回成功");
						        		 $("#ch_"+id).html("已撤回");
						        	 }else {
						        		 layer.msg("撤回失败，请联系客服");
						        	 }
						         }
						     })
			        	 }
			         }
				})
			}
			
			function sztx(id,flag){
				if(userInfo==null || userInfo==''){
					//alert("请先进行登录");
					location.href='${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm';
				}else{
					var start = $("#startTime").val();
					var phone = $("#phone1").val();
					alert(phone)
					if(start==''){
						layer.msg("时间不能为空");
						return;
					}
					if(phone==''){
						layer.msg("手机号不能为空");
						return ;
					}
					var reg=/^1[3|4|5|7|8][0-9]{9}$/;
				    if(!reg.test(phone)){
				       layer.msg("手机号格式错误");
				       $("#phone").focus();
				       return;
				    }
				    if(flag == 0){
				    	$.ajax({
					         method:'post',
					         url:'remind.htm',  
					         data:{id:id,start:start,phone:phone},
					         success:function (data) {
					        	 if(data==0){
					        		 layer.msg("消息提醒设置成功");
					        		 location.href="detail.htm?id="+'${productInfo.id}'+"&upId="+id+"&cmd=4";
					        	 }
					         }
					     })
				    }else{
				    	var remindId = '${remindId}';
				    	$.ajax({
					         method:'post',
					         url:'remindEdit.htm',  
					         data:{id:id,start:start,phone:phone,remindId:remindId},
					         success:function (data) {
					        	 if(data==0){
					        		 layer.msg("消息提醒设置成功");
					        		 location.href="detail.htm?id="+'${productInfo.id}'+"&upId="+id+"&cmd=4";
					        	 }
					         }
					     })
				    }
				}
			}
			
			function cj(id,flag,pid,upId){
				
				$.ajax({
			         method:'post',
			         url:'business.htm',
			         data:{id:id,flag:flag},
			         success:function (data) {
			        	 if(data==0){
			        		 layer.msg("成交成功，即将刷新页面");
			        		 location.href="detail.htm?id="+pid+"&upId="+upId+"&cmd=4";
			        	 }else{
			        		 layer.msg("出现异常，请联系客服");
			        	 }
			         }
			     });
			}
			
			function reminding(pid,upId){
				if(userInfo==null || userInfo==''){
					//alert("请先进行登录");
					location.href='${pageContext.request.contextPath}/web/shop/userLoginApi/getLoginJsp.htm';
				}else{
					$(".layer").show();
					$(".setTipWin").show();
				}
				/*$.ajax({
			         method:'post',
			         url:'reminding.htm',
			         data:{upId:upId},
			         success:function (data) {
			        	 if(data==0){
			        		 layer.msg("取消成功");
			        		 location.href="detail.htm?id="+pid+"&upId="+upId+"&cmd=4";
			        	 }else{
			        		 layer.msg("出现异常，请联系客服");
			        	 }
			         }
			     });*/
			}
		</script>
	</body>