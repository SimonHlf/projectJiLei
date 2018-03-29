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
        .seeimg{
            z-index:999;
        }
        .fanhui,.openback{
            display: inline-block;
            width:30px;
            height:30px;
            background:url("xuanmei/img/fanhui.png") no-repeat;
            background-size:100% 100%;
        }
        .redX{
            color:red;
        }
    </style>
</head>
<body>
<div id="worker">
    <!--start-->
    <div class="content">
        <header class="borderline">
            <a class="back fl close fanhui" href="javaScript:;"></a>
            <p>我要报名</p>
        </header>
        <!--detail msg-->
        <form class="msg" action="msg.htm"  method="post" enctype="multipart/form-data" id="btns">
          <%--<div class="msgbox">
                <label for="names"><span class="redX">*</span>昵称:<input id="names" name="name" type="text" disabled value="${consumer.name}"placeholder="真实姓名"></label>
            </div>--%>
            <div class="msgbox">
                <label for="realName"><span class="redX">*</span>姓名:<input id="realName" name="realName" type="text" value="${consumer.realName}"placeholder="真实姓名"></label>
            </div>
            <div class="msgbox">
                <label for="shool">
                    单位:<input id="shool" name="shool" type="text" placeholder="所在院校或单位">
                </label>
            </div>
            <div class="msgbox">
                <label for="phone"><span class="redX">*</span>电话:<input id="phone" name="phone" onblur="checkMobile(this)"  type="number"value="${consumer.mobile}" placeholder="联系电话"></label>
            </div>
            <div class="msgbox">
                <div class="msgbox">
                    <label for="lang"><span class="redX">*</span>宣言:<input id="lang" name="lang" type="text" placeholder="个人宣言"></label>
                </div>
                <!--  更改的此处代码   图片预览的返回按钮-->
                <div class="atiptext"><label for="lang">上传:</label><input type="button" class="atests" value="最少上传三张图片"/></div>
                <div class="parttwo">
                    <div class="filebox"><input type="file" data="1" title="第一张" class="aupload" id="doc" name="pic_url0" onchange="setImagePreviews(this);" accept="image/*" ></div>
                    <%--<div class="filebox"><input type="file" disabled data="1" id="doc1" title="第二张" name="pic_url2" onchange="setImagePreviews(this);" accept="image/*" ></div>--%>
                    <%--<div class="filebox"><input type="file" disabled data="1" id="doc2" title="第三张" name="pic_url3" onchange="setImagePreviews(this);" accept="image/*" ></div>--%>
                    <%--<div class="filebox"><input type="file" disabled data="1" id="doc3" title="第四张" name="pic_url4" onchange="setImagePreviews(this);" accept="image/*" ></div>--%>
                    <%--<div class="filebox"><input type="file" disabled data="1" id="doc4" title="第五张" name="pic_url5" onchange="setImagePreviews(this);" accept="image/*" ></div>--%>
                    <%--<div class="filebox fboxs" style="display: none"><input type="file"  id="doc7" title="第六张" name="pic_url6"  onchange="setImagePreviews(this);" accept="image/*" ></div>--%>
                </div>
                <%--<div class="atiptext"><label for="lang">上传:</label>&nbsp;&nbsp;&nbsp;&nbsp;最少上传三张图片</div>--%>

                <div class="upload">
                    <input class="surebtn bor_dius" type="submit" value="提交资料">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="seeimg">
    <header class="imgdetail">
        <p><span class="openback"></span><span class="back fr deleat">删除</span></p>
    </header>
    <div class="showimg">
        <img src="" alt="">
    </div>
</div>
<div class="tipbalck">最少上传3张图片</div>
</div>
</body>
<script src="xuanmei/js/jquery-2.1.0.js"></script>
<script>

    function checkMobile(that){
        var reg = /^1[34578]\d{9}$/;
//        var sMobile = document.getElementById("phone");
        if(!reg.test(that.value)){
            $(".tipbalck").text("请输入正确的手机号码");
            $(".tipbalck").show();
            var timer = setTimeout(function(){
                $(".tipbalck").hide();
            },2000);
            that.focus();
        }
    }

    $(".close").on("touchend",function(){
        window.location.href="xmIndex.htm";
    })
    var formData = new FormData();
    var imgarr = [];
    var n=1;
    var nums = "";
    var arrnums = [];
    function setImagePreviews(avalue){
        var docObj = document.getElementById("doc");
        var fileList = avalue.files;
        var imgs="";
        console.log(avalue.files[0]);
        imgs+='<img class="imgbgss" src="'+window.URL.createObjectURL(avalue.files[0])+'" data="'+window.URL.createObjectURL(avalue.files[0])+'" datatype="0"/>'
        $(avalue).parent(".filebox").append(imgs);
//

            var lens = $(".imgbgss").length;

            nums = "pic_url"+lens;
            //console.log(lens)

            if($(".filebox input[type='file']").length<7){
                arrnums.push(lens);
                inputupbox = "";
                inputupbox+='<div class="filebox"><input type="file" class="aupload" data="1" title="第一张" id="doc" name='+nums+' onchange="setImagePreviews(this);" accept="image/*" ></div>'
                $(".parttwo").append(inputupbox);
            }

        //打开预览图片
        $(".imgbgss").on("touchend",function(){
            $(this).attr("datatype","1");
            var len = $(".imgbgss").length;
            var index=$(this).index();
            var numcount = index+1;
            $(".seeimg").show();
            $(".close").hide();
            $(".seeimg img").attr("src",$(this).attr("data"));
        });
        //删除图片
        $(".deleat").on("touchend",function(){
            $(".seeimg").hide();
            $(".close").show();
//            if($(".imgbgss").length<6) {
//                $(".fboxs").show();
//            }
            if($(avalue).parent(".filebox").find(".imgbgss").attr("datatype")==1){
                $(avalue).parent(".filebox").remove();
                var alen = parseInt($(".imgbgss").length);
                var inputList = document.querySelectorAll(".aupload");
                for(var i=0;i<alen+1;i++){
                    console.log(i);
                    inputList[i].name="pic_url"+i;
                }
            };
        })
        //关闭预览图片
        $(".openback").on("touchend",function(){
            $(".imgbgss").attr("datatype","0");
            $(".seeimg").hide();
            $(".close").show();
        });
    }

    $(".surebtn").on("touchend",function(){
        console.log(JSON.stringify(imgarr));
        var lens = $(".imgbgss").length;
        if($("#realName").val()==""||$("#shool").val()==""||$("#phone").val()==""||$("#lang").val()==""){
            $(".tipbalck").text("请将内容填写完整！");
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
        }
    });


</script>
</html>