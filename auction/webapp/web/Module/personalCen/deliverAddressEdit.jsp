<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
		<div class="addInfoHead">
			<strong class="setFixTit">修改收货地址</strong>
			<span class="closeAddWin" onclick="closeFixWin()"></span>
		</div>
		<div class="fixAddForm">
			<div class="fixEditBox">
				<!-- 新增为空 修改为当前地址id -->
				 <form id="adddeliver"> 
				<input type="hidden" id="usaId2">
				<div class="comEditFixBox">
					<em>
						<i>*</i>
						收货人姓名：
					</em>
					<input type="text" name="condigneeName" id="buyer_Name2" class="comInpTxt inpWid1" placeholder="请填写收货人姓名"  value="${consignee.condigneeName}">
					<span id="writeNames2" class="addFixInfos">请输入收货人姓名</span>
					<span id="succWriteNa2" class="comRightIcon"></span>
				</div>
				<div class="comEditFixBox">
					<em>
						<i>*</i>
					</em>
					<div id="distpicker" style="display: inline-block;">
						所<span class="blank"></span>在<span class="blank"></span>地<span class="blank"></span>区：
						<select id="province2"  name="provinceId" onchange="pdsboom12(this.options[this.options.selectedIndex].value)"> 
							<c:forEach items="${provinces}" var="p">
	                            <c:if test="${consignee.provinceId==p.regionid}">
									<option value="${p.regionid}" selected>${p.regionname}</option>
								</c:if>
								<c:if test="${consignee.provinceId!=p.regionid}">
									<option value="${p.regionid}">${p.regionname}</option>
								</c:if>
							</c:forEach>
						</select>
						<select id="city2" name="cityId">
							<c:forEach var="city" items="${citys}">
								<c:if test="${consignee.cityId ==city.regionid }">
									<option value="${city.regionid}" selected>${city.regionname}</option>
								</c:if>
								<c:if test="${consignee.cityId !=city.regionid }">
									<option value="${city.regionid}">${city.regionname}</option>
								</c:if>
							</c:forEach>
	
						</select>
						<select id="district2" name="areaId">
							<c:forEach var="area" items="${areas}">
								<c:if test="${consignee.areaId ==area.regionid }">
									<option value="${area.regionid}" selected>${area.regionname}</option>
								</c:if>
								<c:if test="${consignee.areaId !=area.regionid }">
									<option value="${area.regionid}">${area.regionname}</option>
								</c:if>
							</c:forEach>
					</select>
					</div>
					<span id="districtSpan2" class="addFixInfos"></span>
					<span id="succDistrict2" class="comRightIcon"></span>
				</div>
				<div class="comEditFixBox">
					<em>
						<i>*</i>
						详<span class="blank"></span>细<span class="blank"></span>地<span class="blank"></span>址：
					</em>																
					<input type="text" name="liveAddress" value="${consignee.liveAddress}" id="detailAddress2" class="comInpTxt inpWid2" placeholder="建议您如实填写详细收货地址，例如街道名称、门牌号码" >
					<span id="addressTip2" class="addFixInfos">请输入您的详细地址</span>
					<span id="succAddress2" class="comRightIcon"></span>
				</div>
				<div class="comEditFixBox">
					<em>
						<i>*</i>
						联<span class="blank"></span>系<span class="blank"></span>电<span class="blank"></span>话：
					</em>
					<input type="text" name="telephone" id="telPhone2" class="comInpTxt inpWid1" maxlength="11" placeholder="请填写您的手机号码" value="${consignee.telephone}">
					<span id="phoneTips2" class="addFixInfos">请填写您的手机号码</span>
					<span id="succPhone2" class="comRightIcon"></span>
				</div>
				<input type="hidden" name="id" value="${consignee.id}" id="id">
				</form>
				<a href="javascript:void(0)" class="saveInfo" onclick="editAddress()">保存收货地址</a>
				<a id="cancelUpdate" href="javascript:void(0);" onclick="closeFixWin()">取消</a>
			</div>
		</div>
<script>

$("#city2").change(function (){
	
	 	$("#city2 option[value='pdss2']").remove();
		$("#district2").find("option").remove();
		$.ajax({
			url : "${pageContext.request.contextPath }/web/shop/consigneeApi/selectRegions.htm?parentid=" + $(this).val(), 
			success : function(data) {
				//var data = eval("("+data+")");
				var str="<option value=''>---区---</option>";
				for(var i=0;i<data.length;i++){
					str+="<option value='"+data[i].regionid+"'>"+data[i].regionname+"</option>";
				}
				$("#district2").append(str);
			}
		});
 });

</script>