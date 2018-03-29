<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0"/>
    <title>商家帮-个人中心</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/aui.css" />
    <link rel="stylesheet" href="css/aui-flex.css">
    <link rel="stylesheet" href="css/aui-slide.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_480287_5u4llsv3yhvholxr.css">
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
            piPeiIndex();
        }
        function showFixNewWinInfo(infoTxt){
            if(moveFlag){
                if(infoTxt == "bsInfo"){//修改个人资料
                    window.location.href = "edit.jsp";
                }else if(infoTxt == "balMang"){//余额管理
                    window.location.href = "balance.jsp";
                }else if(infoTxt == "insur"){//保险金管理
                    window.location.href = "insurance.jsp";
                }else if(infoTxt == "purHis"){//消费记录查看
                    window.location.href = "${pageContext.request.contextPath }/weChat/expenseInfoList.htm?consumerId=${sessionScope.consumer.id}";
                }/* else if(infoTxt == "xmei"){//选美活动
                    window.location.href = "${pageContext.request.contextPath }/weChat/xmIndex.htm";
                } */ else if(infoTxt == "apply"){ //申请成为商户中心
                    window.location.href = "applyMerchant.jsp";
                }else if(infoTxt == "goExpenInfo"){//跳转至消费记录
                	 window.location.href = "expenseInfoList.htm?expenseInfoKind=3&&consumerId=${sessionScope.consumer.id}";
                }else{//merChant 商户中心
                    window.location.href = "getDanNews.htm";
                }
            }
        }
    </script>
</head>
<body>
    <div id="wrapBox">
        <div id="wrapScroll">
            <input type="hidden" id="navFlag" value="${navFlag}">
            <section class="aui-content user-info aui-text-center aui-margin-b-15">
                <img src="${sessionScope.consumer.pic }" class="avatar aui-img-round">
                <h2 class="aui-margin-t-15">${sessionScope.consumer.name }<small><i class="aui-iconfont aui-icon-cert aui-text-danger"></i></small></h2>
            </section>

            <section class="aui-content aui-grid aui-margin-b-15">
                <div class="aui-row">
                    <div class="aui-col-xs-6 aui-border-r" tapmode onclick="showFixNewWinInfo('goExpenInfo')">
                        <big class="aui-text-warning">${sessionScope.consumer.cash }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">优惠券余额</div>
                    </div>
                    <div class="aui-col-xs-6 aui-border-r">
                        <big class="aui-text-danger">${sessionScope.consumer.insurance }<small> 元</small></big>
                        <div class="aui-gird-lable aui-font-size-12">保险金</div>
                    </div>
                </div>
            </section>
            <section class="aui-content">
                <ul class="aui-list aui-list-in aui-margin-b-15">
                    <li class="aui-list-item">
                        <div class="aui-list-item-label-icon">
                            <i class="aui-iconfont aui-icon-my aui-text-info"></i>
                        </div>
                        <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('bsInfo')">
                            <div class="aui-list-item-title">基本资料维护</div>
                        </div>
                    </li>
                    <li class="aui-list-item">
                        <div class="aui-list-item-label-icon">
                            <i class="iconfont icon-yue aui-text-success"></i>
                        </div>
                        <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('balMang')">
                            <div class="aui-list-item-title">余额管理</div>
                        </div>
                    </li>
                    <li class="aui-list-item">
                        <div class="aui-list-item-label-icon">
                            <i class="iconfont icon-baoxian aui-text-danger"></i>
                        </div>
                        <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('insur')">
                            <div class="aui-list-item-title">保险金管理</div>
                        </div>
                    </li>
                    <li class="aui-list-item">
                        <div class="aui-list-item-label-icon">
                            <i class="iconfont icon-xiaofeijilu aui-text-info"></i>
                        </div>
                        <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('purHis')">
                            <div class="aui-list-item-title">消费记录查看</div>
                        </div>
                    </li>
                   <!--   <li class="aui-list-item">
                        <div class="aui-list-item-label-icon">
                            <i class="iconfont icon-xiaofeijilu aui-text-info"></i>
                        </div>
                        <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('xmei')">
                            <div class="aui-list-item-title">选美活动</div>
                        </div>
                    </li> -->
                </ul>
                
                <c:if test="${sessionScope.consumer.attr1 != '1' }">
                <c:if test="${type == '1' || type == '2'}">
                    <ul class="aui-list aui-list-in">
                        <li class="aui-list-item">
                            <div class="aui-list-item-label-icon">
                                <i class="iconfont icon-shanghu aui-text-danger"></i>
                            </div>
                            <c:if test="${type == '1' }">
                                <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('apply')">
                                    <div class="aui-list-item-title">申请成为商户</div>
                                </div>
                            </c:if>
                            <c:if test="${type == '2' }">
                                <div class="aui-list-item-inner aui-list-item-arrow" tapmode onclick="showFixNewWinInfo('merChant')">
                                    <div class="aui-list-item-title">商户中心</div>
                                </div>
                            </c:if>
                        </li>
                    </ul>
                </c:if>
                </c:if>
                <c:if test="${sessionScope.consumer.attr1 == '1' }">
                  <ul class="aui-list aui-list-in">
                        <li class="aui-list-item">
                            <div class="aui-list-item-label-icon">
                                <i class="aui-iconfont aui-icon-cart aui-text-info"></i>
                            </div>
                                <div class="aui-list-item-inner aui-list-item-arrow" tapmode>
                                    <div class="aui-list-item-title">商户申请中...</div>
                                </div>
                        </li>
                    </ul>
                </c:if>
            </section>
        </div>
    </div>
    <jsp:include page="nav.jsp"/>
</body>
</html>