<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">

</style>
<form action="" class="clearfix" id="WebUpdateFrontUserForm">
    <input type="hidden" name="userId" value="${frontUser.userId}">
    <div class="leftInfoDiv clearfix fl">
        <div class="comInpDiv">
            <span class="fl">姓名：</span>
            <input type="text" value="${frontUser.nickName}" disabled class="comInfoInpTxt fl">
        </div>
        <div class="comInpDiv">
            <span class="fl">工号：</span>
            <input type="text" value="${frontUser.attr0}" disabled class="comInfoInpTxt fl">
        </div>
        <div class="comInpDiv">
            <span class="fl">性别：</span>
            <label class="comInfoLabel" for="male">
					<span class="radioSpan">
						<b></b>
					</span>
                <em>男</em>
                <input id="male" class="sexRadio" onclick="selSex(this)" type="radio" value="1" name="sex">
            </label>
            <label class="comInfoLabel" for="female">
                <span class="radioSpan"></span>
                <em>女</em>
                <input id="female" class="sexRadio" onclick="selSex(this)" type="radio" value="0" name="sex">
            </label>
        </div>


        <div class="comInpDiv">
            <span class="phoneSpan fl">手机号：</span>
            <input type="text" id="cellPhone" name="cellPhone" value="${frontUser.cellPhone}" class="comInfoInpTxt fl"
                   placeholder="请输入手机号">
        </div>
    </div>
    <div class="rightInfoDiv fl">
        <div class="selImgBtn">
            <input type="file" id="file" accept="image/gif,image/bmp,image/jpeg,image/jpg,image/png,image/svg"
                   name="headImage" onchange="preview(this)"/>
        </div>
        <c:choose>
            <c:when test="${empty frontUser.headPortrait}">
                <img id="perHeadImg"
                     src="${pageContext.request.contextPath}/web/module/personalCen/image/mourentouxiang.jpg"
                     style="width:120px;height:120px"/>
            </c:when>
            <c:otherwise>
                <img id="perHeadImg" src="/${frontUser.headPortrait}" style="width:120px;height:120px"/>
            </c:otherwise>
        </c:choose>
        <div id="headImgDiv">
            <img src="" style="width:120px;height:120px;display: none"/>
        </div>
        <p class="tipInfo">请上传以下格式的图片：jpg、jpeg、png、bmp、gif</p>
    </div>
</form>
<div class="saveFormInfo">
    <a class="comSaveBtn" href="javascript:savePersonalInfo()">保存</a>
</div>
<script type="text/javascript">
    var sex = '${frontUser.sex}';
    $(function () {
        checkHeight();
        $(".sexRadio").parent().find('b').remove();
        $("input[name='sex'][value='" + sex + "']").attr("checked", true).parent().find('span').append('<b></b>');
    })

    function selSex(obj) {
        $(".sexRadio").parent().find('b').remove();
        $(obj).parent().find('span').append('<b></b>');
        $(".sexRadio").remove("checked");
        $(obj).attr("checked", true);
    }

    function preview(file) {//预览图片得到图片base64
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                $("#headImgDiv img").show().attr("src", evt.target.result);
            }
            reader.readAsDataURL(file.files[0]);
        } else {
            //prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
    }
</script>