<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/disrelationship/disrelationship.js"></script>
<div class="btn-group">

 <%--       <button type="button" onclick="addDisrelationship()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
        <button type="button" onclick="delDisrelationship()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
        <button type="button" onclick="updateDisrelationship()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
        <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
--%>

</div>
<div style="margin-top:0px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4" style="width: 200px;">
                <div class=" input-group">
                    <!-- <span class="input-group-addon">按名字查找</span> -->
                    <input type="text" name="name" value="${item.name}" class="form-control" placeholder="按名字查找">
                </div>
            </div>
            <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
        </div>
    </form>
</div>
<div class="widget">
    <!-- <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">试卷统计分析报表</span>
    </div> -->
    <div class="widget-body">
        <div class="flip-scroll">
            <%--<c:choose>--%>
                <%--<c:when test="${empty list}">--%>
                    <%--<br>--%>
                    <%--<br>--%>
                    <%--<p align="center">暂无信息</p>--%>
                    <%--<br>--%>
                    <%--<br>--%>
                <%--</c:when>
                <c:otherwise>--%>
                    <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content bordered-palegreen">
                        <tr>
                            <th width="44px;"><v:checkbox/></th>
                            <th>试卷名称</th>
                            <th>所属机构</th>
                            <th>所属分类</th>
                            <th>查看详情</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="disRelationship">
                            <tr>
                                <td><v:checkbox value=""/></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><!-- 查看详情 --></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><v:checkbox value=""/></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><a href="${pageContext.request.contextPath}/admin/examination/paperAnalysis/detailPaperAnalysis.jsp"><!-- 查看详情 --></a> </td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <v:pagination page="${page}" url="disrelationship/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div>