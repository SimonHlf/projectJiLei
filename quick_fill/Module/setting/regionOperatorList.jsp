<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div id="regionOperatorList">
			<div class="setInfo">分成及管理员设置</div>
			<div class="percentDiv">
				<p>厂商分成比例<span>${firm }</span><input type="hidden" id="firmInp" value="${firm }"/></p>
				<p>运营商分成比例<input type="text" id="opeInp" value="${ope }"/></p>
			</div>
			<div class="mainPercentSet clearfix">
				<!-- nav -->
				<div class="clearfix">
					<div class="nameSet fl">姓名</div>
					<div class="numSet fl">用户编号</div>
					<div class="detailSet fl">
						<ul class="clearfix">
							<li>
								<p>运营</p>
								<p>设置</p>
							</li>
							<li>
								<p>设备</p>
								<p>管理</p>
							</li>
							<li>
								<p>注册</p>
								<p>账户</p>
							</li>
							<li>
								<p>运营</p>
								<p>统计</p>
							</li>
							<li>
								<p>费率</p>
								<p>查看</p>
							</li>
							<li>
								<p>分成</p>
								<p>比例</p>
							</li>
						</ul>
					</div>
					<div ontouchend="showOperSetFixDiv('operationSetDiv','')" class="addSet onlyAdd fl"><b></b></div>
				</div>
				<div class="listSetDiv clearfix">
					<ul>
						<c:forEach items="${regionOperatorList}" var="ro">
							<li class="userSetLi clearfix">
								<p class="nameSet fl">${ro.name }</p>
								<p class="numSet fl">${ro.num }</p>
								<p class="detailSet fl">
									<label>
										<c:if test="${ro.powerOne == '1' }">
											<span class="selAct"><em></em></span>
										</c:if>
										<c:if test="${ro.powerOne == '0' }">
		                                	<span><em></em></span>								
										</c:if>
	 									<input class="checkInp" type="checkbox" disabled/>
									</label>
									<label>
										<c:if test="${ro.powerTwo == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerTwo == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerTwo }" disabled/>
									</label>
									<label for="">
											<c:if test="${ro.powerThree == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerThree == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerThree }" disabled/>
									</label>
									<label>
											<c:if test="${ro.powerFour == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerFour == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerFour }" disabled/>
									</label>
									<label>
											<c:if test="${ro.powerFive == '1' }">
									<span class="selAct"><em></em></span>
									</c:if>
									<c:if test="${ro.powerFive == '0' }">
	                                <span><em></em></span>								
									</c:if>
										<input class="checkInp" type="checkbox" value="${ro.powerFive }" disabled/>
									</label>
									<label>
										<input class="perInpTxt" type="text" value="${ro.proportionAdmin }" disabled/>
									</label>
								</p>
								<p ontouchend="showSetLayer(${ro.id })" class="addSet fl"><span></span></p>
								<!-- 设置 -->
								<div id="setNowLayer_${ro.id}" class="setNowLayer">
									<!--  div onclick="showEdit(${ro.id})"><em class="editIcon"></em><span></span>修改</div-->
									<div ontouchend="showOperSetFixDiv('operationEditDiv',${ro.id})"><em class="editIcon"></em><span></span>修改</div>
									<!-- <div ontouchend="comEditShowAlert('delfirm')"><em class="delIcon"></em><span></span>删除</div> -->
									<div ontouchend="delRegionOperator(${ro.id})"><em class="delIcon"></em><span></span>删除</div>
									<div ontouchend="cancelSet(${ro.id })"><em class="cancelIcon"></em>取消</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="buttonDiv">
				<button ontouchend="saveBilv()">确认修改</button>
			</div>
			</div>