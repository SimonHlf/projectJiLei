<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/frontuser/frontuser.js"></script>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">用户下注记录表</span>
    </div>
    <div class="widget-body">
    <div class="row">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th>时间</th>
                    <th>彩票期数</th>
                    <th>游戏类型</th>
                    <th>游戏玩法</th>
                    <th>投注结果</th>
                    <th>投注金额</th>
                    <th>是否中奖</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listDto}" var="list">
                    <tr>
                        <td>${list.creatTime}</td>
                        <td>${list.pNum}</td>
                        <td>
                        	<c:if test="${list.type==0}">重庆时时彩</c:if>
                        	<c:if test="${list.type==1}">腾讯分分彩</c:if>
                        </td>
                        <td>${list.paly}</td>
                        <td>${list.result}</td>
                        <td>${list.money}</td>
                        <td>
                        	<c:if test="${list.isWin==0 }">已中奖</c:if>
                        	<c:if test="${list.isWin==1 }">未中奖</c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="frontuser/detailedList.htm?1=1&userid=${userid }"></v:pagination>
        </div></div>
    </div>
</div>