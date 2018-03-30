<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<html lang="zh-cn"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0,maximum-scale=1.0">
<meta name="renderer" content="webkit">
<link rel="stylesheet" href="xuanmei/css/common.css">
<link rel="stylesheet" href="xuanmei/css/index.css">
<link rel="stylesheet" href="xuanmei/layui-v2.2.45/layui/css/layui.css"  media="all">
<script src="xuanmei/js/jquery-2.1.0.js"></script>
<script src="xuanmei/layui-v2.2.45/layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
       .rule li p{
           font-size: 14px;
           display: inline-block;
       }
       .listnone{
           position: relative;
           padding-top: 8px;
       }
       #searchXmUsersForm1{
           position: absolute;
           top:8px;
           right:16px;
           z-index:999;
           width:25px;
           height:25px;

       }
        #shuaxin{
            position: absolute;
            top:89px;
            right:0;
            z-index:999;
            display: block;
            width:25px;
            height:25px;
            margin-right:17px;
            background:url("xuanmei/img/refresh.png") no-repeat;
            background-size:100% 100%;
        }
        .searchbutton{
            width:100% !important;
            height:100% !important;
            background:url("xuanmei/img/refresh.png") no-repeat !important;
            background-size:100% 100% !important;
        }
        .imgbox .clearfix a{
            height:100px;
        }
        .imglist .imgbox{
            height:auto !important;
        }
        .zanwu{
            text-align: center;
            color: #999;
            padding: 30px;
            font-size: 16px;
        }
       .header{
           position: relative;
       }
        #personCenter{
           display: block;
            width:28px;
            height:28px;
            background:url("xuanmei/img/usercenter.png") no-repeat;
            background-size:100% 100%;
            position: absolute;
            top: 34px;
            left: 90px;
        }
        .aimgpics{
            width:100%;
            height:35px;
            border:1px solid #29b86a;
            margin-bottom:15px;
        }
       .aimgpics a{
           display: inline-block;
           width:20%;
           height:100%;
           text-align: center;
           line-height:35px;
           font-size:14px;
           color:#29b86a;
           float:left;
           border-right:1px solid #29b86a;
       }
       .currentss{
           color:#666 !important;
       }
       .aimgpics a:last-child{
           border-right:none;
       }
    </style>
<title>2017年.寻找帮女郎</title>
</head>
<body>
    <div id="worker">
      <!--start index-->
      <div class="headerbg">
        <div class="content">
          <!--index header-->
          <header class="header">
            <a class="signyp" onclick="IWantSignUp()">我要报名</a>
            <a id="personCenter" onclick="personCenter()"></a>
          </header>
        </div>
      </div>
      <!--index num  rst-->
      <div class="numrst">
        <a href="javascript:;"> 
           <p>
               <c:choose>
                   <c:when test="${not empty sign_num}">${sign_num}</c:when>
                   <c:otherwise><span>0</span></c:otherwise>
               </c:choose>
           </p>
           <p>已报名</p>
        </a>
        <a href="javascript:;">
           <p>
               <c:choose>
                   <c:when test="${not empty ticket_num}">${ticket_num}</c:when>
                   <c:otherwise><span>0</span></c:otherwise>
               </c:choose>
           </p>
           <p>投票数</p>
        </a>
        <a href="javascript:;">
            <p>
            <c:choose>
                <c:when test="${not empty fangwen_num}">
                    <fmt:formatNumber value="${fangwen_num}" type="currency" pattern="0"/>
                </c:when>
                <c:otherwise><span>0</span></c:otherwise>
            </c:choose>
            </p>
            <p>访问数</p>
        </a>
      </div>
      <!--index msg  list-->
      <div class="content part2">
      <!--index rule-->
        <ul class="imglist">
          <li class="listborder" data="0">
            <a class="title-icon" href="javascript:;"><i class="icon-index rule-icon"></i>参赛须知<em class="fr icons"></em></a>
            <ol class="rule impor">
                <c:forEach items="${xmRules}"  var="rule" varStatus="vs">
                    <c:if test="${rule.type=='0'}">
                        <li><i class="dian"></i>${rule.comments}</li>
                    </c:if>
                </c:forEach>
            </ol>
          </li>
         <li class="listborder" data="0">
            <a class="title-icon" href="javascript:;"><i class="icon-index time-icon"></i>活动须知<em class="fr icons"></em></a>
            <ol class="rule">
              <li><i class="dian"></i>活动名称：<span>焦作商家帮“帮女郎”月份形象代言人选拔活动</span></li>
              <li><i class="dian"></i>主题：<span>寻找“帮女郎”</span></li>
              <li><i class="dian"></i>活动内容：<span>线上投票评选人气封面女神---"帮女郎"，用于制作海报，活动封面形象代言
人，在热门商圈、步行街广场大屏做形象展示！只要你身边有你心目中的“校
花""女神""佳人"，都可以踊跃推荐。</span></li>
              <li><i class="dian"></i>活动口号：<span>寻找你身边的"完美"女孩  打造焦作"封面女神" </span></li>
              <li><i class="dian"></i>奖项设置：
                  <span>
                 一等奖：iPad 一台，个性写真一套；
                 二等奖：价值1268元烫染套餐，个性写真一套；
                 三等奖：个性写真一套。
                 </span>
              </li>
            </ol>
          </li>
          <li class="listnone" data="3">
            <a class="title-icon" href="javascript:;"><i class="icon-index show-icon"></i>选手风采</a>
              <form method="post" id="searchXmUsersForm1">
                  <input type="hidden" placeholder="请输入选手编号" class="search" name="id">
                  <button class="searchbtn bor_dius searchbutton" onclick="searchXmUsers()"></button>
              </form>
          </li>
          <li>
              <form method="post" id="searchXmUsersForm">
                  <input type="text" placeholder="请输入选手编号" class="search" name="id">
                  <button class="searchbtn bor_dius" onclick="searchXmUsers()">搜索</button>
              </form>

          </li>
        </ul>
        <div class="imglist">
         <!--index img-->
          <ul class="imgbox" id="imgslists">
              <c:choose>
                  <c:when test="${not empty xmUsersList }">
                      <c:forEach items="${xmUsersList}"  var="users" varStatus="vs">
                          <c:if test="${(vs.index)<=5}">
                          <li>
                              <a href="${pageContext.request.contextPath}/weChat/findUsersById.htm?id=${users.id}">
                                  <img src="/${users.attr3}" alt=""  onclick="open_(this)">
                                  <p>${users.id}号<span class="paiming fr">排名:<em class="numone" id="UsersSort">${users.attr2}</em></span></p>
                                  <p>票数：<span  class="numone">${users.ticket_num}</span>票</p>
                              </a>
                              <p class="bor_dius option"> <a href="${pageContext.request.contextPath}/weChat/findUsersById.htm?id=${users.id}" >投票</a></p>
                          </li>
                          </c:if>
                      </c:forEach>
                  </c:when>
                  <c:otherwise>
                      <p class="zanwu">没有相关数据！</p>
                  </c:otherwise>
              </c:choose>
          </ul>
            <div class="aimgpics">
              <a href="xmIndex.htm?page=1">首&nbsp;&nbsp;页</a>
                <c:choose>
                    <c:when test="${Page.page==1}">
                        <a href="JavaScript:;">上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="xmIndex.htm?page=${Page.page-1}">上一页</a>
                    </c:otherwise>
                </c:choose>
                  <a class="currentss" href="JavaScript:;">第&nbsp;${Page.page}&nbsp;页</a>
                <c:choose>
                    <c:when test="${Page.page==Page.pageTotal}">
                        <a href="JavaScript:;">下一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="xmIndex.htm?page=${Page.page+1}">下一页</a>
                    </c:otherwise>
                </c:choose>
               <a href="xmIndex.htm?page=${Page.pageTotal}">尾&nbsp;&nbsp;页</a>
            </div>
          <ul class="imglist">
          <li class="listborder" data="0">
            <a class="title-icon" href="javascript:;"><i class="icon-index option-icon"></i>网络投票细则<em class="fr icons"></em></a>
            <ol class="rule">
              <li><span>1、投票时间为12月11日—12月25日。</span></li>
              <li><span>2、扫描二维码关注“商家帮服务号”，“帮女郎月份形象代言人选拔活动”，进入投票系统，按提示进行投票。（注：活动结束前取消关注投票无效。）</span></li>
              <li><span>3、为防止弄虚作假，每个id最多每天只能投1票。</span></li>
              <li><span>4、网络投票一律免费。</span></li>
              <li><span>5、网络评选结果发布时间：2017年12月26日，具体事宜可关注我们微信服务号获取最新动态！</span></li>
            </ol>
          </li>
         <li class="listborder" data="0">
            <a class="title-icon" href="javascript:;"><i class="icon-index own-icon"></i>获奖规则<em class="fr icons"></em></a>
            <ol class="rule">
                <c:forEach items="${xmRules}"  var="rule" varStatus="vs">
                    <c:if test="${rule.type=='1'}">
                        <li><i class="dian"></i>${rule.comments}</li>
                    </c:if>
                </c:forEach>
            </ol>
          </li>
         <li class="listborder imporheader" data="0">
            <a class="title-icon" href="javascript:;"><i class="icon-index zhuyi-icon"></i>注意事项<em class="fr icons"></em></a>
            <ol class="rule impor">
              <li>1、同一人不可使用多个微信号重复报名，如发现重复报名，经查证后，保留得票数最高的参赛照片。</li>
              <li>2、如遇两个人或多人使用同一张照片，将视为一人参赛，按一个名额颁发奖品。</li>
              <li>3、如遇两个人或多人在同一张照片中，我们将视为一人参赛，按1个名额颁发奖品。</li>
              <li>4、本次活动初赛由微信好友投票决出名次，工作人员将实时监测投票数据变化，发现投票作弊者，直接取消本次活动资格。</li>
              <li>5、颁奖时间为2017年12月30日。具体事宜可关注我们微信公众号，获取最新活动动态。</li>
              <li>6、如有任何疑问，可通过以下方式与我们联系：<br/>
                  联系电话：0391-2750622<br/>
                  邮箱：jzsjbxxjs@163.com<br/>
              </li>
              <li>7、本活动最终解释权归焦作市商家帮信息技术有限公司所有。</li>
            </ol>
          </li>
        </ul>
        </div>
      </div>
        <div class="footer"></div>
    </div>
<input type="hidden" id="consumer" value="${sessionScope.consumer}">
    <input type="hidden" id="msg" value="<%=request.getParameter("msg")%>">
 <input type="hidden" id="idmsg" value="<%=request.getParameter("idmsg")%>">
    <input type="hidden" id="size" value="<%=request.getParameter("size")%>">
    <input type="hidden" id="count" value="${count}">

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
</body>
<script>

    function open_(obj){
        layer.open({
            type: 1,
            shade: false,
            title: false,
            content: "<img src='"+$(obj).attr("src")+"' style='width:300px;height:300px;'/>"
        });
    }

   function search1(){
       $.ajax({
           method : 'post',
           url : 'xmIndex.htm',
           cache : false,
           contentType : false,
           processData : false,
           data : new FormData($("#searchXmUsersForm")[0]),
           success : function(data) {
               loadHtml(data);
           }
       });
   }
 //点击显示隐藏
  $(".listborder").click(function(){
console.log($(this).attr("data"));
      if($(this).attr("data")==3){
          return false;
      }else{
          if($(this).attr("data")==0){
              $(this).children(".rule").show();
              $(this).find("em").css({
                  "background":"url('xuanmei/img/close.png') no-repeat",
                  "background-size":"100% 69%"
              });
              $(this).attr("data",1);
          }else{
              $(this).children(".rule").hide();
              $(this).find("em").css({
                  "background":"url('xuanmei/img/open.png') no-repeat",
                  "background-size":"100% 69%"
              });
              $(this).attr("data",0);
          }
      }
  });

 function searchXmUsers() {
     $.ajax({
         method : 'post',
         url : 'xmIndex.htm',
         cache : false,
         contentType : false,
         processData : false,
         data : new FormData($("#searchXmUsersForm")[0]),
         success : function(data) {
             loadHtml(data);
         }
     });
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


 function IWantSignUp(){
     var consumer=$("#consumer").val();
     if(consumer==""){
//         var aname = "确定";
//         var target = "xmIndex.htm";
//         var title = "敬请打开微信添加公众号功能，</br>搜索“商家帮服务号”并成功关注，再进行投票操作。";
//         tipFn(aname,target,title);
         $(".atip").show();
         $(".sure").html("确定");
         $(".tipstitle").html("敬请打开微信添加公众号功能，</br>搜索“商家帮服务号”并成功关注，再进行投票操作。");
         $(".sure").on("touchend",function(){
             $(this).parents(".atip").hide();
         })
         $(".nosure").on("touchend",function(){
             $(this).parents(".atip").hide();
         })

    }else{
        window.location.href='${pageContext.request.contextPath}/weChat/goMsg.htm';
    }
 }

   function personCenter(){
       var consumer=$("#consumer").val();
       if(consumer==""){
           $(".atip").show();
           $(".sure").html("确定");
           $(".tipstitle").html("敬请打开微信添加公众号功能，</br>搜索“商家帮服务号”并成功关注，再进行投票操作。");
           $(".sure").on("touchend",function(){
               $(this).parents(".atip").hide();
           })
           $(".nosure").on("touchend",function(){
               $(this).parents(".atip").hide();
           })
       }else{
           window.location.href='${pageContext.request.contextPath}/weChat/tomyVoteRecord.htm';
       }
   }

    $(function () {
        var msg=$("#msg").val();
        if(msg!=="null"){
            var aname = "确定";
            var target = "xmIndex.htm";
            var title = "您已经报过名了！";
            tipFn(aname,target,title);
        }
        var idmsg=$("#idmsg").val();
        if(idmsg!=="null"){
            var aname = "确定";
            var target = "xmIndex.htm";
            var title = "报名成功，您的参赛编号是："+idmsg;
            tipFn(aname,target,title);
        }

        var size=$("#size").val();
        if(size=="0"){
            var aname = "确定";
            var target = "xmIndex.htm";
            var title = "抱歉，你还没有参加选美活动！";
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
    })
</script>
</html>