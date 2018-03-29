<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title></title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <link rel="stylesheet" href="css/aui-flex.css">
    <link rel="stylesheet" href="css/aui-slide.css">
    <style type="text/css">
        .user-info {
            background-color: #ffffff;
            padding: 10px 0;
        }
        img.avatar {
            display: block;
            margin: 0 auto;
            width: 20%;
        }
        .aui-list .aui-list-header {
            background-color: #ffffff;
            line-height: 1.2rem;
        }
        .aui-list{
            background-image:none !important;
        }
        .aui-list-item{
            border-bottom:1px solid #eee !important;
            background-image:none !important;
        }
        .aui-list-item-input input::-webkit-input-placeholder{
            color:#ccc;
            font-size:0.7rem;
        }
        .aui-iconfont{
            color:#ccc;
            font-size:1.2rem;
        }
    </style>
</head>
<body>
    <section class="aui-content user-info aui-text-center aui-margin-b-15">
        <img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
        <h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i class="aui-iconfont aui-icon-cert aui-text-danger"></i></small></h2>
    </section>

    <section class="aui-content aui-grid aui-margin-b-15">
        <div class="aui-row">
            <div class="aui-col-xs-6 aui-border-r">
                <big class="aui-text-warning">${sessionScope.consumer.balance }<small> 元</small></big>
                <div class="aui-gird-lable aui-font-size-12">优惠券</div>
            </div>
            <div class="aui-col-xs-6 aui-border-r">
                <big class="aui-text-danger">${sessionScope.consumer.insurance }<small> 元</small></big>
                <div class="aui-gird-lable aui-font-size-12">保险金</div>
            </div>
        </div>
    <</section>
    <%--<section class="aui-content">--%>
        <%--<form class="am-form"  method="post"--%>
              <%--action="savePersonal.htm">--%>
            <%--<input type="hidden" value="${sessionScope.consumer.id}" name="consumerId">--%>
            <%--<ul class="aui-list aui-form-list">--%>
                <%--<li class="aui-list-item">--%>
                    <%--<div class="aui-list-item-inner">--%>
                        <%--<div class="aui-list-item-label-icon">--%>
                            <%--<i class="aui-iconfont aui-icon-my"></i>--%>
                        <%--</div>--%>
                        <%--<div class="aui-list-item-input">--%>
                            <%--<input type="text" value="${sessionScope.consumer.account}" name="password1" id="pwd1" placeholder="原密码">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
                 <%--<li class="aui-list-item">--%>
                     <%--<div class="aui-list-item-inner">--%>
                         <%--<div class="aui-list-item-label-icon">--%>
                             <%--<i class="aui-iconfont aui-icon-my"></i>--%>
                         <%--</div>--%>
                         <%--<div class="aui-list-item-input">--%>
                             <%--<input type="text" value="${sessionScope.consumer.account}" name="password2" id="pwd2" placeholder="新密码">--%>
                         <%--</div>--%>
                     <%--</div>--%>
                <%--</li>--%>
                <%--<li class="aui-list-item">--%>
                    <%--<div class="aui-list-item-inner aui-list-item-center aui-list-item-btn">--%>
                        <%--<div class="aui-btn aui-btn-info aui-margin-r-5">确认</div>--%>
                        <%--<div class="aui-btn aui-btn-danger aui-margin-l-5" tapmode onclick="cancelSave()">取消</div>--%>
                    <%--</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</form>--%>
    <%--</section>--%>

    <div>
        <form class="am-form" style="text-align: center" method="post"
              action="savePersonal.htm">
            <input type="hidden" value="${sessionScope.consumer.id}" name="consumerId">
            <div>
                原密码:<input type="text" value="${sessionScope.consumer.account}" name="password1" id="pwd1" placeholder="原密码">
            </div>
            <div>
                新密码:<input type="text" value="${sessionScope.consumer.account}" name="password2" id="pwd2" placeholder="新密码">
            </div>
            <button type="submit" class="am-btn am-btn-primary">确认</button>
            <button type="button" class="am-btn am-btn-default">
                <a href="personal.jsp">取消</a>
            </button>

        </form>
    </div>
    <jsp:include page="nav.jsp"/>
    <script>
    $(document).ready(function(){
    	  $("input").blur(function(){
    		  var id=$("#id").val();
    		  var pwd1=$("#pwd1").val();
    		  var pwd2=$("#pwd2").val();
    		  $.ajax({
    			  method:'post',
    			  url:'weChat/isPwdExist.htm',
    			  data:{
    				  id:id,
    				  password:pwd1,
    			  },
    			  success:function(data){
    				  var data=eval("(" + data + ")");
    				  if(data.state == '400'){
    					  layer.msg(data.msg);
    					  return;
    				  }else if(data.state == '200'){
    					  layer.msg(data.msg);
    					  var mychar = document.getElementById("pass").style.display = "block";
    					  $.ajax({
    						  method:'post',
    						  url:'weChat/savePersonal.htm',
    						  data:{
    							id:id,
    							password:pwd2
    						  },
    						  success:function(data){
    							  layer.msg("修改密码成功");
    						  }
    					  })
    				  }
    			  }
    		  })
    		
    	  });
    	});

    </script>
</body>
</html>