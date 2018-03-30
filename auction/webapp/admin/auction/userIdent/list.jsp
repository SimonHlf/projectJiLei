<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="auction/userIdent/userident.js"></script>
<div class="btn-group">
   <!--  <button type="button" onclick="delRmbProduct()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button> -->
	 用户账号<input id="userName" type="text" style="width: 120px; height: 33px" value="${userName}">
	手机号<input id="telphone" type="text" style="width: 120px; height: 33px" value="${telphone}">	
	审核状态<select id="status">
				<c:if test="${status == null}">
				<option value="">请选择</option>
				<option value="0">未审核</option>
				<option value="1">已通过</option>
				<option value="2">未通过</option>
				</c:if>
				<c:if test="${status == 0}">
				<option value="">请选择</option>
				<option value="0" selected>未审核</option>
				<option value="1">已通过</option>
				<option value="2">未通过</option>
				</c:if>
				<c:if test="${status == 1}">
				<option value="">请选择</option>
				<option value="0">未审核</option>
				<option value="1" selected>已通过</option>
				<option value="2">未通过</option>
				</c:if>
				<c:if test="${status == 2}">
				<option value="">请选择</option>
				<option value="0">未审核</option>
				<option value="1">已通过</option>
				<option value="2" selected>未通过</option>
				</c:if>
	         </select> 
		<button type="button" onclick="searchIdent()"
			class="btn btn-primary">
			<i class="fa fa-search"></i> 查询
		</button> 

</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">商家入驻申请列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>用户账号</th>
                    <th>手机号</th>
                    <th>身份证号</th>
                    <th>申请时间</th>
                    <th>申请状态</th>
                    <th>审核人</th>
                    <th>审核时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="n">
                        <tr>
                            <td><v:checkbox value="${n.id}"/></td>
                            <td>${n.userAccount}</td>
                            <td>${n.telphone}</td>
                            <td>${n.cardid}</td>
                            <td>${n.createtime}</td>
                            <td>
                            <c:if test="${n.status == 0}">
                            <button type="button" class="btn  btn-info">未审核</button>
                            </c:if>
                            <c:if test="${n.status == 1}">
                            <button type="button" class="btn  btn-success">已通过</button>
                            </c:if>
                            <c:if test="${n.status == 2}">
                            <button type="button" class="btn  btn-danger">未通过</button>
                            </c:if>
                            </td>
                            <td>${n.auditorName}</td>
                            <td>${n.audittime}</td>
                            <td>
                            <button type="button" onclick="queryDetail(${n.id})" class="btn btn-primary">查看详情</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="shop/userIdentController/list.htm?userName=${userName}&telphone=${telphone}&status=${status}"></v:pagination>
        </div>
    </div>
</div>