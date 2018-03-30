<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1.0">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="xuanmei/css/common.css">
    <link rel="stylesheet" href="xuanmei/css/index.css">
    <script src="xuanmei/js/jquery-2.1.0.js"></script>
    <title>2017年.寻找帮女郎</title>
    <style>
        .content{
            position: relative;
        }
        header{
            padding-bottom:0 !important;
        }
        header p,header p span{
            font-size:20px !important;
        }
        .msg{
            margin-top:0 !important;
        }
        .signyp{
            padding:0 !important;
            line-height:40px;
            text-align:center;
            font-size:17px;
        }
        .apicbox{
            margin-top:15px !important;
        }

    </style>
</head>
<body>
<div id="worker">
    <!--start-->
    <div class="content">
        <header>
            <p>${xmUsers.id}号<span>
                 <c:forEach var="var1" items="${nameList}">
                     <c:if test="${var1.id==xmUsers.consumer_id}">${var1.realName}</c:if>
                 </c:forEach>
            </span></p>
        </header>
        <!--detail-->
        <div class="msg">
            <!--detail text-->
            <div class="msgtext">
                <p>排名：<span>${xmUsers.attr2}</span></p>
                <p>票数：<span class="piao">${xmUsers.ticket_num}</span><i>票</i></p>
                <p>我的宣言：<em>${xmUsers.me_comment}</em></p>
            </div>
            <!--detail img-->
            <div class="detailimg">
                <c:if test="${not empty xmUsers.attr3}">
                    <img class="apicbox" src="/${xmUsers.attr3}" alt="">
                </c:if>
                <c:if test="${not empty xmUsers.attr4}">
                    <img class="apicbox" src="/${xmUsers.attr4}" alt="">
                </c:if>
                <c:if test="${not empty xmUsers.attr5}">
                   <img class="apicbox" src="/${xmUsers.attr5}" alt="">
                </c:if>
                <c:if test="${not empty xmUsers.attr6}">
                   <img class="apicbox" src="/${xmUsers.attr6}" alt="">
                </c:if>
                <c:if test="${not empty xmUsers.attr7}">
                    <img class="apicbox" src="/${xmUsers.attr7}" alt="">
                </c:if>
                <c:if test="${not empty xmUsers.pic6}">
                    <img class="apicbox" src="/${xmUsers.pic6}" alt="">
                </c:if>
            </div>
        </div>
        <!--sure or back-->
        <div class="choose">
            <form action="vote.htm" method="post" id="form">
                <input type="hidden" name="id" id="id"
                       value="${xmUsers.id}" />
            </form>
            <input class="toher bor_dius" type="button" onclick="save()" value="投票给她">
            <input type="hidden" id="consumer" value="${sessionScope.consumer}">
            <input type="text" id="msg" class="msg" hidden="hidden"  value="${msg}">
            <input type="hidden" id="mess" value="<%=request.getParameter("mess")%>">
            <div class="yesorno">
                <a class="signyp"  onclick="IWantSignUp()">我要报名</a>
                <a href="xmIndex.htm" class="bor_dius">返回首页</a>
            </div>
        </div>
    </div>
    <%--新的弹出窗--%>
    <div class="atip">
        <div class="tips">
            <h3>温馨提示</h3>
            <h5 class="tipstitle"></h5>
            <p>
                <span class="fl nosure"></span>
                <span class="fr sure"></span>
            </p>
        </div>
    </div>
</div>
</body>
<script>
    /*新的弹出窗*/
    function tipFn(tipmsg,bank,atitle){
        $(".atip").show();
        $(".sure").html(tipmsg);
        $(".tipstitle").html(atitle);
        $(".sure").on("touchend",function(){
            window.location.href=bank;
        })
        $(".nosure").on("touchend",function(){
            $(this).parents(".atip").hide();
        })
    }
    function IWantSignUp(){
        var consumer=$("#consumer").val();
        if(consumer==""){
            var aname = "确定";
            var target = "xmIndex.htm";
            var title = "敬请打开微信添加公众号功能，</br>搜索“商家帮服务号”并成功关注，再进行投票操作。";
            tipFn(aname,target,title);
        }else{
            window.location.href='${pageContext.request.contextPath}/weChat/goMsg.htm';
        }
    }

    var userId=$("#id").val();
    function save(){
        var msg=$("#consumer").val();
        var msg1=$("#msg").val();
        if(msg == ""){
            var aname = "确定";
            var target = "xmIndex.htm";
            var title =  "敬请打开微信添加公众号功能，</br>搜索“商家帮服务号”并成功关注，再进行投票操作。";
            tipFn(aname,target,title);
            return false;
        }else{
                if (msg1 == "ok") {
                    var aname = "确定";
                    var target = "xmUsersInfo.htm?id="+userId;
                    var title = "恭喜您投票成功！";
                    tipFn(aname,target,title);
                }else if (msg1 == "no") {
                    $(".sure").html("确定");
                    $(".tipstitle").html("没有投票机会了");
                    $(".sure").on("touchend",function(){
                        $(this).parents(".atip").hide();
                    })
                    $(".nosure").on("touchend",function(){
                        $(this).parents(".atip").hide();
                    })

                }else{
                    $("#form").submit();
                }
        }
    }
    $(function () {
        var msg1=$("#msg").val();
        if (msg1 == "ok") {
            var aname = "确定";
            var target = "xmUsersInfo.htm?id="+userId;
            var title = "恭喜您投票成功！";
            tipFn(aname,target,title);
        }else if (msg1 == "no") {
            $(".atip").show();
            $(".sure").html("确定");
            $(".tipstitle").html("您已经没有投票机会了");
            $(".sure").on("touchend",function(){
                $(this).parents(".atip").hide();
            })
            $(".nosure").on("touchend",function(){
                $(this).parents(".atip").hide();
            })
        }

        var mess=$("#mess").val();
        if(mess!=="null"){
            var aname = "确定";
            var target = "xmIndex.htm";
            var title = "您已经报过名了！";
            tipFn(aname,target,title);
        }
    });
</script>
</html>