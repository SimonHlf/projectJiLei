<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="news/news/news.js"></script>
<link href="assets/css/news.css" rel="stylesheet"/>
<center>
    <div class="wide">
        <h1>${news.title }</h1>
        <br> <br>
        <p>${news.content }</p>
    </div>
    <br> <br>
    <div class="commentbox">
        <form class="form-horizontal" method="post" id="addReviewForm">
            <input type="hidden" id="newsId" name="newsId" value="${news.id }">
			<textarea id="content" name="content" class="commentarea"
                      placeholder="请写下您的评论" required></textarea>
        </form>
        <button class="getcomment btn btn-block" onclick="AddReview()">评论</button>
    </div>
    <div class="reviewarea">
        <h3>评论区</h3>
        <br> <br>
        <c:forEach items="${nlist }" var="ReviewName">
            <br>
            <span class="leftshift">${ReviewName.name }</span>
            <span class="rightshift">${ReviewName.createTime }</span>
            <br>
            <div>${ReviewName.content }</div>
            (${ReviewName.thumbsNum})<a onclick="zanon(${ReviewName.id},${ReviewName.createBy })">
            <img src="assets/img/zan.png" width="22px" height="25px"
                 style="margin-right: -520px"></a>
            <a class="rightshift" href="#" id="aa" onclick="huidiv(${ReviewName.id})">回复</a>
			<span class="rightshift"><a><img src="assets/img/cai.png"
                                             width="22px" height="25px"></a> </span>

            <div class="commentbox"
                 style="display: none; height: auto !important; height: 200px; min-height: 60px;"
                 id="${ReviewName.id}">
                <form class="form-horizontal" method="post" id="addReviewForm">
                    <input type="hidden" id="newsId" name="newsId" value="${news.id }">
					<textarea id="content" name="content" class="commentarea"
                              placeholder="请写下您的回复" required></textarea>
                </form>
                <button class="getcomment btn btn-block" onclick="AddReview()">回复</button>
            </div>

            <div class="Replycs">
                <span class="leftshift">xxx回复${ReviewName.name }</span> <span
                    class="rightshift">时间</span> <br>
                <div>回复内容</div>
            </div>
            <hr
                    style="border: none; border-top: 1px solid #DCDCDC; width: 650px;"/>
        </c:forEach>
    </div>
</center>
<script>
    function huidiv(did) {
        var inputEl = document.getElementById('aa'),
                btnEl = document.getElementById(did);
        inputEl.onfocus = function () {
            btnEl.style.display = '';
        }
        inputEl.onblur = function () {
            btnEl.style.display = 'none';
        }
    }
</script>