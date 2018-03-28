<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>
  		<div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>考生姓名</th>
                    <th>考生工号</th>
                    <th>考试名称</th>
                    <th>所属部门</th>
                    <th>试卷名称</th>
                    <th>考试时间</th>
                    <th>试卷总分</th>
                    <th>考生得分</th>
          			<th>详情</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="userRecord">
                    <tr>
                        <td><v:checkbox value="${userRecord.id}"/></td>
                        <td>${userRecord.nick_name}</td>
                        <td>${userRecord.userAttr0}</td>
                        <td>${userRecord.exam_name}</td>
                        <td>${userRecord.orgName}</td>
                        <td>${userRecord.creatName}</td>
                        <td>${userRecord.creatTime}</td>
                        <td>${userRecord.attr5}分</td>
                        <td>${userRecord.fen}分</td>
                         <td><a href="javascript:details(${userRecord.id})">查看</a></td>
                    </tr>
                    
                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:papers page="${page}" url="paperRecordController/getOne.htm?1=1"></v:papers>
        </div>
    
