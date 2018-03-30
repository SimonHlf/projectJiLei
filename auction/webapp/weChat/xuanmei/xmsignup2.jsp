<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1.0">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="css/common.css">
    <title>2017年度最美校花</title>
    <style>
        .borderline p{
            width:95%;
            text-align:center;
        }
        .close{
            font-size: 23px;
            line-height: 25px;
        }
        .seeimg{
            z-index:999;
        }
    </style>
</head>
<body>
<div id="worker">
    <!--start-->
    <div class="content">
        <header class="borderline">
            <a class="back fl close">&lt</a>
            <p>我要报名</p>
        </header>
        <!--detail msg-->
        <form class="msg" name="" actionz=""  method="">
            <div class="msgbox">
                <label for="names">姓名:<input id="names" type="text" placeholder="请填写您的真实姓名"></label>
            </div>
            <div class="msgbox">
                <label for="shool">学校:<input id="shool" type="text" placeholder="请填写您所在的院校"></label>
            </div>
            <div class="msgbox">
                <label for="phone">电话:<input id="phone" type="text" placeholder="请填写您的联系电话"></label>
            </div>
            <div class="msgbox">
                <div class="msgbox">
                    <label for="lang">宣言:<input id="lang" type="text" placeholder="请填写您的个人宣言"></label>
                </div>
                <div class="msgbox lastbox">
                    <label for="">上传:<div class="filebox"><input type="file" id="doc" placeholder="请填写您的个人宣言" multiple="multiple" onchange="setImagePreviews();" accept="image/*" ></div><p class="tips">请上传本人真实生活照，最少3张</p></label>
                </div>
                <div class="upload">
                    <h3></h3>
                    <div class="uploadimg">
                        <!--  <img class="imgbg" data="img/1.png" src="img/1.png"/> -->
                    </div>
                    <!--submit btn-->
                    <input class="surebtn bor_dius" type="" value="提交资料">
                </div>
        </form>
    </div>
</div>
<div class="seeimg">
    <header class="imgdetail">
        <p><span class="openback">&lt&nbsp&nbsp<em class="count"></em>/<em class="countlist"></em></span><span class="back fr deleat">删除</span></p>
    </header>
    <div class="showimg">
        <img src="" alt="">
    </div>
</div>
<div class="tipbalck">最少上传三张图片</div>
</div>
</body>
<script src="js/jquery-2.1.0.js"></script>
<script src="dist/lrz.bundle.js"></script>
<script>

    $(".back").on("touchend",function(){
        window.location.href="index.html";
    })
    var formData = new FormData();
    var imgarr = [];
    function setImagePreviews(avalue){
        var docObj = document.getElementById("doc");
        var fileList = docObj.files;
        var imgs=""
        for (var i = 0; i < fileList.length; i++) {

            imgs+='<img class="imgbg" src="'+window.URL.createObjectURL(docObj.files[i])+'" data="'+window.URL.createObjectURL(docObj.files[i])+'"/>'

            //图片压缩
            lrz(fileList[i], {width: 640})
                .then(function (rst) {
                    imgarr.push(rst.base64.split(",")[1]);

                })
        }

        $(".uploadimg").append(imgs);
        //打开预览图片
        $(".imgbg").on("touchend",function(){
            var len = $(".imgbg").length;
            var index=$(this).index();
            var numcount = index+1;
            $(".seeimg").show();
            $(".close").hide();
            $(".countlist").text(len);//一共几张图片
            $(".count").text(numcount);//第几张图片
            $(".seeimg img").attr("src",$(this).attr("data"));
        });
        //删除图片
        $(".deleat").on("touchend",function(){
            var imgnums = $(this).parents(".imgdetail").find(".count").text()*1;
            $(".seeimg").hide();
            var countlist = $(".imgbg").length-1;
            console.log(countlist);
            $(".countlist").text(countlist);
            $(".uploadimg").find(".imgbg").eq(imgnums-1).remove();
        })
        //关闭预览图片
        $(".openback").on("touchend",function(){
            $(".seeimg").hide();
            $(".close").show();
        });
    }

    $(".surebtn").on("touchend",function(){
        console.log(JSON.stringify(imgarr));
        var lens = $(".imgbg").length;
        if($("#names").val()==""||$("#shool").val()==""||$("#phone").val()==""||$("#lang").val()==""){
            $(".tipbalck").text("haha");
            $(".tipbalck").show();
            var timer = setTimeout(function(){
                $(".tipbalck").hide();
            },2000);
            return false;
        }else if(lens<3){
            $(".tipbalck").show();
            var timer = setTimeout(function(){
                $(".tipbalck").hide();
            },2000);
            return false;
        }else{
            var url = "http://192.168.1.169:8080/windy/weChat/msg2.htm";
            $.ajax({
                type:'get',
                dataType:'json',
                data:{
                    pic_urls:JSON.stringify(imgarr)
                },
                url:url,
                success:function(data){
                    alert("上传成功");
                },
                error: function() {
                    alert("网络异常");
                }
            });

        }
    });
</script>
</html>