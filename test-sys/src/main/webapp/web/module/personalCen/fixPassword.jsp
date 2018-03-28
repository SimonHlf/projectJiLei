<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<form action="" id="savePasswordForm">
		<div class="comInpDiv auto">
			<span class="fl passSpan">原密码：</span>
			<input type="password" id="password" class="comInfoInpTxt fl" placeholder="请输入原密码" name="password">
		</div>
		<div class="comInpDiv auto">
			<span class="fl passSpan">新密码：</span>
			<input type="password" id="onepassword" class="comInfoInpTxt fl"  placeholder="请输入新密码" name="newPassword">
		</div>
		<div class="comInpDiv auto">
			<span class="fl passSpan_1">确认新密码：</span>
			<input type="password"  id="twopassword" class="comInfoInpTxt fl" placeholder="请再次输入新密码" name="twoPassword">
		</div>
	</form>
	<div class="saveFormInfo_1">
		<a class="comSaveBtn" href="javascript:savePassword()">保存</a>
	</div>
	<script type="text/javascript">
		$(function() {
			checkHeight();
		});
	</script>
</body>