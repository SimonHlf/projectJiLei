<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.layui-layer-page .layui-layer-content{
	overflow-x:hidden;
}
</style>
      <table id="noCheckTable" class="table frontUserTable table-bordered table-striped table-condensed flip-content">
          <thead class="flip-content bordered-palegreen">
          <tr>
              <th width="44px;" style="position:relative;">
                  <input id="sellAll_no" class="comCheckInp" value="-2" onclick="selectAll('noHas')" type="checkbox"/>
              </th>
              <th>考生手机号</th>
              <th>考生姓名</th>
              <th>工号</th>
              <th>所属部门</th>
          </tr>
          </thead>
          <tbody id="noCheckBody">
          <c:forEach items="${notcheckdList}" var="frontUser">
              <tr id="tr_${frontUser.user_id}">
                  <td style="position:relative;">
					<input class="comCheckInp"  name="noCheckBox" type="checkbox" value="${frontUser.user_id}" bs="1"/>
                  </td>
                  <td title="${frontUser.cell_phone}">${frontUser.cell_phone}</td>
                  <td title="${frontUser.nick_name}">${frontUser.nick_name}</td>
                  <td title="${frontUser.attr0}">${frontUser.attr0}</td>
                  <td>${frontUser.orgName}</td>
              </tr>
          </c:forEach>
          </tbody>
      </table>
<script>
$(function(){
	/*$("#noCheckBody tr input").each(function(i){
		$(this).click(function(){
			alert("ceshi")
			alert($("#noCheckBody tr input").eq(i).is(':checked') )
		});
	});*/
});
</script>