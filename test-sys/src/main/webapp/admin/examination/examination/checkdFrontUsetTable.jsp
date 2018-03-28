<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.layui-layer-page .layui-layer-content{
	overflow-x:hidden;
}
</style>
        <table id="checkedTable" class="table frontUserTable table-bordered table-striped table-condensed flip-content">
            <thead class="flip-content bordered-palegreen">
	            <tr>
	                <th width="44px;" style="position:relative;"><input value="-2" id="sellAll_has" class="comCheckInp" onclick="selectAll('has')" type="checkbox"/></th>
	                <th>考生手机号</th>
	                <th>考生姓名</th>
	                <th>工号</th>
	                <th>所属部门</th>
	            </tr>
            </thead>
            <tbody id="checkTobody">
            	<c:forEach items="${checkdList}" var="frontUser">
	                <tr id="tr_${frontUser.user_id}">
	                    <td style="position:relative;">
							<input class="comCheckInp" name="hasCheckBox" type="checkbox" value="${frontUser.user_id}" bs="1"/>
	                        <%--<c:choose>
	                            <c:when test="${empty examId}">
	                                <v:checkbox value="${frontUser.user_id}" />
	                            </c:when>
	                            <c:otherwise>
	                                <c:choose>
	                                    <c:when test="${frontUser.isCheckd != 0}">
	                                       <input class="comCheckInp" name="hasCheckBox" type="checkbox" value="${frontUser.user_id}" bs="1"/>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <input class="comCheckInp" name="hasCheckBox" type="checkbox" value="${frontUser.user_id}" bs="0"/>
	                                    </c:otherwise>
	                                </c:choose>
	                            </c:otherwise>
	                        </c:choose>--%>
	                    </td>
	                    <td title="${frontUser.cell_phone}">${frontUser.cell_phone}</td>
	                    <td title="${frontUser.nick_name}">${frontUser.nick_name}</td>
	                    <td title="${frontUser.attr0}">${frontUser.attr0}</td>
	                    <td>${frontUser.orgName}</td>
	                </tr>
	            </c:forEach>

            </tbody>
        </table>
