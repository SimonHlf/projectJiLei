<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1.0">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="xuanmei/css/common.css">
    <script>
        var webview = plus.webview.currentWebview();
        plus.key.addEventListener('backbutton', function() {
            webview.canBack(function(e) {
                if(e.canBack) {
                    //webview.back();
                } else {
                    webview.close();
                }
            })
        });
    </script>
    <title>2017年.寻找帮女郎</title>
    <style>
        .borderline p{
            width:95%;
            text-align:center;
        }
        .close{
            font-size: 26px;
            line-height: 25px;
        }
        .parttwo{
            overflow: auto !important;;
            height:auto !important;
        }
        em{
            font-size: 16px;
        }
        .fanhui,.openback{
            display: inline-block;
            width:30px;
            height:30px;
            background:url("xuanmei/img/fanhui.png") no-repeat;
            background-size:100% 100%;
        }

        #logo{
            width: 150px;
            height: 150px;
            margin-left:73px;
        }
        .title-icon {
            color: #29b86a;
            padding:10px 0;
            text-indent:5%;
        }
        .table{
            width:100%;

        }
        .table tbody tr{
            width:100%;
            height:35px;
            border:1px solid #29b86a !important;

        }
        .jilu tr th{
            font-size:16px;
        }
        .jilu tr th,tbody tr td{
            width:33%;
            height:35px;
            text-align:center;

        }
        tbody tr td{
            font-size:14px;
        }
        .apicbox{
            margin-top:15px;
        }
        .seeimg{
            z-index:999;
        }
        .parttwo{
            width:100%;
            padding-left:0 !important;
        }
        .aimg{
            margin-right:2%;
        }
        .filebox{
            width:47%;
            height:35px;
            background:url(xuanmei/img/xiugai.png) no-repeat;
            background-position: 0px 0px;
        }
        .aimg{
             margin-top:15px;
         }
        .xiugai{
            width:100%;
        }

    </style>
</head>
<body>
<div id="worker">
    <!--start-->
    <div class="content">
        <header class="borderline">
            <a class="back fl close fanhui" href="javascript:;"></a>
            <p>个人中心</p>
        </header>
        <div class="msgtext">
            <p>姓名：
                 <span>
                     <c:forEach var="var1" items="${nameList}">
                         <c:if test="${var1.id==xmUser.consumer_id}">${var1.realName}</c:if>
                     </c:forEach>
                 </span>
            </p>
            <p>排名：<span>${xmUser.id}</span></p>
            <p>票数：<span>${xmUser.ticket_num}</span><i>票</i></p>
            <p>我的宣言：<em>${xmUser.me_comment}</em></p>
        </div>
        <div class="msg">
            <!--detail msg-->
            <form class="msg" action="updatePersonMess.htm"  method="post" enctype="multipart/form-data" id="btns">
                <input type="hidden" name="id" value="${xmUser.id}">
                <!--  更改的此处代码   图片预览的返回按钮-->
                <div class="parttwo">
                    <c:if test="${not empty xmUser.attr3}">
                        <div class="aimg">
                                <img class="xiugai"  src="/${xmUser.attr3}" alt="" datatype="0" data="/${xmUser.attr3}">
                        </div>
                        <!--  修改图片 -->
                        <div class="filebox">
                            <input type="file" name="pic_url0"  onchange="setImagePreviews(this);" accept="image/*" >
                        </div>
                    </c:if>
                    <c:if test="${not empty xmUser.attr4}">
                        <div class="aimg">
                            <!--  tupian -->
                                <img class="xiugai"  src="/${xmUser.attr4}" alt="" datatype="0" data="/${xmUser.attr4}">
                        </div>
                        <div class="filebox">
                            <input type="file" name="pic_url1" onchange="setImagePreviews(this);" accept="image/*" >
                        </div>
                    </c:if>
                    <c:if test="${not empty xmUser.attr5}">
                        <div class="aimg">
                                <img class="xiugai"  src="/${xmUser.attr5}" alt="" datatype="0" data="/${xmUser.attr5}">
                        </div>
                        <div class="filebox">
                            <input type="file" name="pic_url2"   onchange="setImagePreviews(this);" accept="image/*" >
                        </div>
                    </c:if>
                    <c:if test="${not empty xmUser.attr6}">
                        <div class="aimg">
                                <img class="xiugai"  src="/${xmUser.attr6}" alt="" datatype="0" data="/${xmUser.attr6}">
                        </div>
                        <div class="filebox">
                            <input type="file" name="pic_url3"  onchange="setImagePreviews(this);" accept="image/*" >
                        </div>
                    </c:if>
                    <c:if test="${not empty xmUser.attr7}">
                        <div class="aimg">
                                <img class="xiugai"  src="/${xmUser.attr7}" alt="" datatype="0" data="/${xmUser.attr7}">
                        </div>
                        <div class="filebox">
                            <input type="file" name="pic_url4"  onchange="setImagePreviews(this);" accept="image/*" >
                        </div>
                    </c:if>
                    <c:if test="${not empty xmUser.pic6}">
                        <div class="aimg">
                                <img class="xiugai"  src="/${xmUser.pic6}" alt="" datatype="0" data="/${xmUser.pic6}">
                        </div>
                        <div class="filebox">
                            <input type="file" name="pic_url5"  onchange="setImagePreviews(this);" accept="image/*" >
                        </div>
                    </c:if>
                </div>
                <!--submit btn-->
                <input class="surebtn bor_dius" type="submit"  value="确认修改">
            </form>
            <div class="seeimg">
                <header class="imgdetail">
                    <p><span class="openback"></span></p>
                </header>
                <div class="showimg">
                    <img src="" alt="">
                </div>
            </div>
            <div class="tipbalck">最少上传三张图片</div>
        </div>
        </div>
        <p class="title-icon">投票记录</p>
        <table class="table">
            <thead class="jilu">
            <th>投票者姓名</th>
            <th>微信昵称</th>
            <th>投票时间</th>
            </thead>
            <tbody>
            <c:forEach items="${ticketLog}" var="var" varStatus="vs">
                <tr>
                    <td>
                        <c:forEach var="var1" items="${nameList}">
                            <c:if test="${var1.id==var.addUser}">
                                <c:choose>
                                    <c:when test="${not empty var1.realName}">${var1.realName}</c:when>
                                    <c:otherwise>未知</c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <c:forEach var="var1" items="${nameList}">
                            <c:if test="${var1.id==var.addUser}">${var1.name}</c:if>
                        </c:forEach>
                    </td>
                    <td>${var.addTime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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
</div>
<input type="hidden"  id="upmes" value="<%=request.getParameter("upmes")%>">
</body>
<script src="xuanmei/js/jquery-2.1.0.js"></script>
<script>

    $(".close").on("touchend",function(){
        window.location.href="xmIndex.htm?page=1";
    })

    function setImagePreviews(avalue){
        var fileList = avalue.files;
        var imgs="";
        console.log(avalue.files[0]);
        imgs+='<img class="xiugai" src="'+window.URL.createObjectURL(avalue.files[0])+'" data="'+window.URL.createObjectURL(avalue.files[0])+'" datatype="0"/>' ;
        $(avalue).parent(".filebox").prev(".aimg").html("")
        $(avalue).parent(".filebox").prev(".aimg").append(imgs);
        /*xiupic();*/
    }
   /* xiupic();
    function xiupic(){
        //打开预览图片
        $(".xiugai").on("touchend",function(){
            $(this).attr("datatype","1");
            var len = $(".xiugai").length;
            var index=$(this).index();
            var numcount = index+1;
            $(".seeimg").show();
            $(".close").hide();
            $(".seeimg img").attr("src",$(this).attr("data"));
        });
        //关闭预览图片
        $(".openback").on("touchend",function(){
            $(".xiugai").attr("datatype","0");
            $(".seeimg").hide();
            $(".close").show();
        });
    }*/

</script>
<script>
    $(function () {
        var  upmes=$("#upmes").val();
        if(upmes=="ok"){
            var aname = "确定";
            var target = "tomyVoteRecord.htm";
            var title = "修改成功！";
            tipFn(aname,target,title);
        }
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
    });
</script>
</html>