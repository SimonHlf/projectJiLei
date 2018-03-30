<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<div class="comInnerDiv">
					<span>姓<em></em>名：</span>
					<input type="text" class="comTxtInp" id="roName" value="${regionOperator.name }" placeholder="请输入用户姓名"/>
				</div>
				<div class="comInnerDiv">
					<span>用户编号：</span>
					<input type="text" class="comTxtInp" id="roNum" value="${regionOperator.num }" placeholder="请输入用户编号"/>
				</div>
				<div class="comInnerDiv">
					<span>分成比例：</span>
					<input type="text" class="comTxtInp" id="roAdmin" value="${regionOperator.proportionAdmin }" placeholder="请设置分成比例"/>
				</div>
				<div class="comInnerDiv">
					<div class="comFlInner">
						<span>运营设置：</span>
						<label>
							<c:if test="${regionOperator.powerOne == '1' }">
								<span class="selAct"><em></em></span>
								<input ontouchend="setStatusEdit(this)" id="roOne" class="checkInp" type="checkbox" checked value="${regionOperator.powerOne }"/>
							</c:if>
							<c:if test="${regionOperator.powerOne == '0' }">
                               <span><em></em></span>	
                               <input ontouchend="setStatusEdit(this)" id="roOne" class="checkInp" type="checkbox" value="${regionOperator.powerOne }"/>							
							</c:if>
						</label>
					</div>
					<div class="comFlInner">
						<span>设备管理：</span>
						<label>
							<c:if test="${regionOperator.powerTwo == '1' }">
								<span class="selAct"><em></em></span>
								<input ontouchend="setStatusEdit(this)" id="roTwo" class="checkInp" type="checkbox" checked value="${regionOperator.powerTwo }"/>
							</c:if>
							<c:if test="${regionOperator.powerTwo == '0' }">
	                            <span><em></em></span>			
	                            <input ontouchend="setStatusEdit(this)" id="roTwo" class="checkInp" type="checkbox" value="${regionOperator.powerTwo }"/>					
							</c:if>
						</label>
					</div>
					<div class="comFlInner">
						<span>注册账户：</span>
						<label>
							<c:if test="${regionOperator.powerThree == '1' }">
								<span class="selAct"><em></em></span>
								<input ontouchend="setStatusEdit(this)" id="roThree" class="checkInp" type="checkbox" checked value="${regionOperator.powerThree }"/>
							</c:if>
							<c:if test="${regionOperator.powerThree == '0' }">
                               <span><em></em></span>	
                               <input ontouchend="setStatusEdit(this)" id="roThree" class="checkInp" type="checkbox" value="${regionOperator.powerThree }"/>							
							</c:if>
						</label>
					</div>
					<div class="comFlInner">
						<span>运营统计：</span>
						<label>
							<c:if test="${regionOperator.powerFour == '1' }">
								<span class="selAct"><em></em></span>
								<input ontouchend="setStatusEdit(this)" id="roFour" class="checkInp" type="checkbox" checked value="${regionOperator.powerFour }"/>
							</c:if>
							<c:if test="${regionOperator.powerFour == '0' }">
                               <span><em></em></span>
                               <input ontouchend="setStatusEdit(this)" id="roFour" class="checkInp" type="checkbox" value="${regionOperator.powerFour }"/>					
							</c:if>
							
						</label>
					</div>
					<div class="comFlInner">
						<span>费率查看：</span>
						<label>
							<c:if test="${regionOperator.powerFive == '1' }">
								<span class="selAct"><em></em></span>
								<input ontouchend="setStatusEdit(this)" id="roFive" class="checkInp" type="checkbox" checked value="${regionOperator.powerFive }"/>
							</c:if>
							<c:if test="${regionOperator.powerFive == '0' }">
                               <span><em></em></span>	
                               <input ontouchend="setStatusEdit(this)" id="roFive" class="checkInp" type="checkbox" value="${regionOperator.powerFive }"/>							
							</c:if>
						</label>
					</div>
				</div>
				<div class="addTwoBtnDiv fl">
				<input type="hidden" id="adminValue" value="${adminValue}">
					<button class="comTwoBtns tBt_cancel" onclick="closeAlert($('.operationSetDiv'))">取消</button>
					<button class="comTwoBtns tBt_sure" onclick="editRegionOperator(${regionOperator.id})">保存</button>
				</div>
