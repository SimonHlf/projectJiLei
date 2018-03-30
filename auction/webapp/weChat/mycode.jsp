<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>商家帮-我的二维码</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <link rel="stylesheet" href="css/aui-flex.css">
    <script src="js/iscroll.js"></script>
    <script src="js/comScroll.js"></script>
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
        #wrapBox{
			width: 100%;
			position:relative;
			overflow: hidden;
		}
		#wrapScroll{
			width:100%;
			position:absolute;
			left:0;
			top:0px;
			-webkit-tap-highlight-color:rgba(0,0,0,0);
		}
    </style>
    <script type="text/javascript">
        window.onload = function(){
            wrapScroll();
        }
    </script>
</head>
<body>
    <div id="wrapBox">
        <div id="wrapScroll">
            <section class="aui-content user-info aui-text-center aui-margin-b-15">
                <img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
                <h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i class="aui-iconfont aui-icon-cert aui-text-danger"></i></small></h2>
            </section>

            <section class="aui-content aui-grid aui-margin-b-15">
                <div class="aui-row">
                    <div class="aui-col-xs-4 aui-border-r">
                        <big class="aui-text-warning">${sessionScope.consumer.balance }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">现金余额</div>
                    </div>
                    <div class="aui-col-xs-4 aui-border-r">
                        <big class="aui-text-danger">${sessionScope.consumer.cash }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
                    </div>
                    <div class="aui-col-xs-4 aui-border-r">
                        <big class="aui-text-danger">${sessionScope.consumer.insurance }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">保险金</div>
                    </div>
                </div>
            </section>

            <center>
                <%
                cn.windy.module.sfb.hibernate.model.Consumer consumer = (cn.windy.module.sfb.hibernate.model.Consumer)session.getAttribute("consumer");
                String path = cn.windy.util.QRCodeUtil.getCode(consumer.getId().intValue(),request.getRealPath("/images/"));
                %>
                <img src="../images/<%=path%>"/>
            </center>
        </div>
    </div>
    <jsp:include page="nav.jsp"/>
</body>
</html>