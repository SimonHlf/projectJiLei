<%@ page pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/web/Module/account/css/authorizationLogin.css"/>
    <script src="${pageContext.request.contextPath}/web/js/jquery-1.7.2.min.js" type="text/javascript"
            charset="utf-8"></script>
</head>
<body>
<%@ include file="../../head.jsp" %>
<div class="authorLoginCon">
    <div class="innerAuthor w1100">
        <div class="authorNav">
            <ul>
                <li class="active"><span class="hasAccSp"></span><b>已有玉商通账号，请绑定</b></li>
                <li><span class="noAccSp"></span>没有玉商通账号，请完善资料</li>
            </ul>
        </div>
        <div class="authorCon">
            <div class="qqAcc">
                <img src="${image}"/>
                <p> Hi, ${nickname},欢迎来到玉商通 ~</p>
            </div>
            <!-- 有账号 -->
            <div class="innerAuthorCon" style="display: block;">
                <form method="post" action="${pageContext.request.contextPath}/authLoginRelate.htm" id="logFrom">
                    <div class="comAuthorCon">
                        <span class="comInpTit">玉商通账号：</span>
                        <input type="text" placeholder="请输入玉商通账号" name="useraccount"/>
                    </div>
                    <div class="comAuthorCon">
                        <span class="comInpTit">输<span class="oneBlank"></span>入<span class="oneBlank"></span>密<span
                                class="oneBlank"></span>码：</span>
                        <input type="password" placeholder="请输入密码" name="password"/>
                    </div>
                    <%-- <div class="comAuthorCon">
                         <span class="comInpTit">验<span class="twoBlank"></span>证<span class="twoBlank"></span>码：</span>
                         <input type="text" placeholder="请输入验证码" name="vercodeInp" />
                         <img src="images/image.jpg" />
                     </div>--%>
                    <input type="submit" class="subBtn" id="authLogBtn" value="立即绑定"/>
                </form>
            </div>
            <!-- 无账号 注册 -->
            <div class="innerAuthorCon">
                <form method="post" id="regForm">
                    <div class="comAuthorCon">
                        <span class="comInpTit">用<span class="twoBlank"></span>户<span class="twoBlank"></span>名：</span>
                        <input type="text" placeholder="请输入用户名" id="account" onblur="getUserName()" name="useraccount"/>
                    </div>
                    <div class="comAuthorCon">
                        <span class="comInpTit">设<span class="oneBlank"></span>置<span class="oneBlank"></span>密<span
                                class="oneBlank"></span>码：</span>
                        <input type="password" placeholder="请输入设置密码" id="password" name="password"/>
                    </div>
                    <div class="comAuthorCon">
                        <span class="comInpTit">确<span class="oneBlank"></span>认<span class="oneBlank"></span>密<span
                                class="oneBlank"></span>码：</span>
                        <input type="password" placeholder="请输入确认密码" id="confirmPass" name="confirmPass"/>
                    </div>
                    <div class="comAuthorCon">
                        <span class="comInpTit">手<span class="oneBlank"></span>机<span class="oneBlank"></span>号<span
                                class="oneBlank"></span>码：</span>
                        <input type="text" placeholder="请输入手机号码" id="phone" name="phone"/>
                    </div>
                    <%-- <div class="comAuthorCon">
                         <span class="comInpTit">验<span class="twoBlank"></span>证<span class="twoBlank"></span>码：</span>
                         <input type="text" placeholder="请输入验证码" name="vercodeInp_reg"/>
                         <img src="images/image.jpg"/>
                     </div>--%>
                    <div class="comAuthorCon">
                        <span class="comInpTit">手机验证码：</span>
                        <input type="text" placeholder="请输入手机验证码" id="code" name="vercode"/>
                        <%--<input type="button" placeholder="请输入验证码" name="vercodeInp" />--%>
                        <img src="web/images/image.jpg" onclick="phoneCode()" id="yanyan"/>
                        <%--<a href="javascript:void(0)" onclick="phoneCode()" id="yanyan">获取验证码</a>--%>
                    </div>
                    <input type="button" class="subBtn" id="authRegBtn" value="立即注册" onclick="zhuce()"/>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="../../foot.jsp" %>
<script type="text/javascript">
    $(function () {
        $(".authorNav li").each(function (i) {
            $(this).click(function () {
                $(".authorNav li").removeClass("active");
                $(".innerAuthorCon").hide();
                $(this).addClass("active");
                $(".innerAuthorCon").eq(i).show();
            });
        });

        $('#authLogBtn').click(function () {
            var u = $('#logFrom:input[name="useraccount"]').val();
            var p = $('#logFrom:input[name="password"]').val();
            if (u.trim() === '' || p.trim() === '') {
                return false;
            }
            $('#logFrom').submit();
        })
    });

    var flag = true;
    var useraccount = '';
    var password = '';
    var phone = '';

    /* $(".navList").click(function() {
        var n = $(this).index();
        $(".navList").removeClass("active").eq(n).addClass("active");
        $(".form_list").hide().eq(n).show();
    }) */

    function phoneCode() {
        var phone = $("#phone").val();
        if (phone == '') {
            alert("请填写手机号")
            return;
        }
        $.ajax({
            type: 'post',
            data: {
                "mobile": phone
            },
            url: '${pageContext.request.contextPath}/web/shop/userLoginApi/getValidateCode.htm',
            success: function (data) {
                // data = eval("(" + data + ")");
                if (data.result == "fail") {
                    flag = false;
                    alert(data.msg);
                }
                if (data.result == "ok") {
                    flag = true;
                    alert(data.msg);
                    var aObj = $(".yanyan");
                    alert($(".yanyan").text())
                    aObj.text("倒计时60秒");
                    $(".yanyan").removeAttr("onclick");

                    var num = 60;
                    var clear = setInterval(function () {
                        num--;
                        aObj.val("倒计时" + num + "秒");
                        if (num == 0) {
                            clearInterval(clear);
                            aObj.val("发送验证码");
                            $(".yanyan").attr("onclick", "phoneCode()");
                        }
                    }, 1000);
                }
            }
        });
    }

    function getCellPhone(str) {
        $.ajax({
            type: 'post',
            data: {
                "mobile": str
            },
            url: '${pageContext.request.contextPath}/web/shop/userLoginApi/getCellPhone',
            success: function (data) {
                // data = eval("(" + data + ")");
                if (data.result == "fail") {
                    flag = false;
                    $("#phonemsg").html(data.msg);
                    $("#phonemsg").css("color", "red");
                }
                if (data.result == "ok") {
                    flag = true;
                    $("#phonemsg").html(data.msg);
                    $("#phonemsg").css("color", "green");
                }
            }
        });
    }


    function getUserName() {
        var account = $("#account").val();
        $.ajax({
            type: 'post',
            data: {
                "account": account
            },
            url: '${pageContext.request.contextPath}/web/shop/userLoginApi/getAccount.htm',
            success: function (data) {
                // data = eval("(" + data + ")");
                if (data.result == "fail") {
                    flag = false;
                    $("#account").html(data.msg);
                    $("#account").css("color", "red");
                }
                if (data.result == "ok") {
                    flag = true;
                    $("#account").html(data.msg);
                    $("#account").css("color", "green");
                }
            }
        });
    }


    function makesurePass() {
        var password = $("#pass1").val();
        var pass = $("#pass11").val();
        if (password != pass) {
            layer.msg("两次输入密码不一致");
        }
    }

    function zhuce() {
        //if (flag == false) {
        //	layer.msg('提交失败，请按照规范填写信息')
        //	return;
        //}

        var password = $("#password").val();
        var pass = $("#confirmPass").val();
        if (password != pass) {
            layer.msg("两次输入密码不一致");
            return;
        }

        var useraccount = $("#account").val();

        var code = $("#code").val();
        var phone = $("#phone").val();
        /*if (useraccount == '' || password == '' || code == ''
                || phone == '') {
            layer.msg("请将信息填写完整");
            return;
        }*/

        $.ajax({
            type: 'post',
            data: {
                "useraccount": useraccount,
                "password": password,
                "code": code,
                "phone": phone
            },
            url: '${pageContext.request.contextPath}/web/shop/userLoginApi/userZhuCe.htm',
            success: function (data) {
                // data = eval("(" + data + ")");
                if (data.result == "fail") {
                    alert(data.msg);
                }
                if (data.result == "ok") {
                    alert("注册成功");
                    $('.authorNav li:eq(0)').click();
                }
            }
        });
    }

    function checkPass() {
        var password1 = $("#pass1").val();
        var pass = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
        if (password1 != null) {
            if (!pass.test(password1)) {
                $("#passmsg1").html("格式不对");
                flag = false;
            }
            if (pass.test(password1)) {
                $("#passmsg1").html("");
                flag = true;
            }
        }
    }
</script>
</body>
</html>

