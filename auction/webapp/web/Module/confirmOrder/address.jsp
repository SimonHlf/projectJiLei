<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${consignees}" var="c">
							<li>
								<label for="addInp1">
									<p>${c.provinceName}${c.cityName}${c.areaName}${c.liveAddress}(<span>${c.condigneeName}</span>&nbsp;收)${c.telephone}</p>
									
									<c:if test="${c.defaultStatus == 1 }">
										<input type="hidden" name="condigneeName" id="condigneeName" value="${c.condigneeName}"/>
										<input type="hidden" name="phone" id="phone" value="${c.telephone}"/>
										<input type="hidden" name="address" id="address" value="${c.provinceName}${c.cityName}${c.areaName}${c.liveAddress}"/>
									<span class="radiusSpan selActSpan"><em></em></span>
									</c:if>
									<c:if test="${c.defaultStatus != 1 }">
										<span class="radiusSpan"><em></em></span>
									</c:if>
									<input type="radio" id="addInp1" class="addressInp" name="addressInp" />
								</label>
								
								<c:if test="${c.defaultStatus == 1 }">
									<div class="setAdd fl">
										<span class="defaultAdd">默认地址</span>
											<a class="setAddBtn" href="javascript:toEditAddress('${c.id}','${type}')">修改地址</a>
									</div>
								</c:if>
								<c:if test="${c.defaultStatus != 1 }">
									<div class="setAdd noDefaultAdd fl">
									
									<a class="setAddBtn" href="javascript:defaultAddress('${c.id}','${type}')">设置为默认地址</a>
								</div>
								</c:if>
								
							</li>
						</c:forEach>	