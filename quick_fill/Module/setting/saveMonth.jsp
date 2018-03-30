<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<div class="monthlyPay">
					收费标准<input type="number" id="money" value="${month.money }">元/月&nbsp;每月限制<input type="number" id="num" value="${month.num }">次
				</div>