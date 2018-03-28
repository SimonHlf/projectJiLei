<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/quesType/disrate.js"></script>
    <div style="float: left;padding: 10px;margin-top: 7px;">
    		<button type="button" onclick="addDisRate()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    		<button type="button" onclick="delDisRate()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    		<button type="button" onclick="updateDisRate()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    </div>
<div class="widget">
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>考试名称</th>
                    <th>所属机构</th>
                    <th>应考人数</th>
                    <th>实考人数</th>
                    <th>未考人数</th>
                    <th>创建时间</th>
                    
                </tr>
                </thead>
                <tbody>
                <%-- <c:forEach items="${list}" var="QuesType"> --%>
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>基础考试</td>
                        <td>人事机构</td>
                        <td>50人</td>
                        <td>46人</td>
                        <td>4人</td>
                        <td>2017-12-15</td>
                    </tr>
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>基础考试</td>
                        <td>人事机构</td>
                        <td>50人</td>
                        <td>46人</td>
                        <td>4人</td>
                        <td>2017-12-15</td>
                    </tr>
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>基础考试</td>
                        <td>人事机构</td>
                        <td>50人</td>
                        <td>46人</td>
                        <td>4人</td>
                        <td>2017-12-15</td>
                    </tr>
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>基础考试</td>
                        <td>人事机构</td>
                        <td>50人</td>
                        <td>46人</td>
                        <td>4人</td>
                        <td>2017-12-15</td>
                    </tr>
                    <tr>
                        <td><v:checkbox value="${QuesType.id}"/></td>
                        <td>基础考试</td>
                        <td>人事机构</td>
                        <td>50人</td>
                        <td>46人</td>
                        <td>4人</td>
                        <td>2017-12-15</td>
                    </tr>
                <%-- </c:forEach> --%>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:pagination page="${page}" url="QuesTypeController/getList.htm?1=1"></v:pagination>
        </div>
    </div>
</div>