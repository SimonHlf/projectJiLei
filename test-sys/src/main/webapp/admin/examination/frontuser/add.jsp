<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/assets/css/bootstrap-fileupload.min.css" /> --%>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addFrontUser">
                <div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生手机号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="cellPhone" maxlength="11" onblur="cell(this);" name="cellPhone" placeholder="考生手机号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生姓名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="nickName" name="nickName" placeholder="考生姓名" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生工号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="attr0" name="attr0" placeholder="考生工号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">性别</label>
                        <div class="col-sm-9">
                            <v:items type="sex" id="sex" name="sex"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">出生日期</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="date" id="birthday" name="birthday" placeholder="出生日期">
                        </div>
                    </div>

                   <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">图片</label>
                        <div class="col-md-10" style="    left: 0px;">
                            <!-- 上传图片 -->
                            <input type="file" class="default" name="headImages" id="imgs" placeholder="图片"/>
                            <span id="pictureSpan"></span>
                        </div>
                    </div>--%>
                   <%-- <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-sm-9">
                            <select name="orgId" id="orgId">
                                <option>--请选择机构--</option>
                                <c:forEach items="${windyOrgList}" var="windyOrg">
                                    <option value="${windyOrg.id}">${windyOrg.name}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>--%>
               <%--     <div class="widget-buttons">
                        <button type="button" onclick="yes()" class="btn btn-info btn-ok"> 确认</button>
                        <button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button>
                    </div>--%>

                </div>
            </form>
        </div>
    </div>

</div>
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/assets/js/bootstrap-fileupload.min.js"></script> --%>
<!-- <script type="text/javascript">
function yes(){
alert("sssss");
/* $.ajax({
type:"post",
url:"frontuser/add.htm",
data:new FormData($("#addDisRateForm")[0]),
success:function(result){
result=eval("("+result+")");
if(result.result=='true'){
alert("添加成功");
loadHtml('frontuser/list.htm');
}else if(result.result=='pictureErroe'){
alert("图片格式错误")
}
}
}) */

}
function fanhui(){
loadHtml('frontuser/list.htm');
}
</script> -->
	