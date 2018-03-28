<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<div class="widget" id="table">
    <div class="widget-header  with-footer">
        <span class="widget-caption">
            <i class="fa fa-list"></i>
            新闻专题</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;">
                        <v:checkbox/>
                    </th>
                    <th>
                        名称
                    </th>
                    <th>
                        描述
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="special">
                        <tr>
                            <td>
                                <v:checkbox value="${special.id}"/>
                            </td>
                            <td>
                                ${special.name}
                            </td>
                            <td>
                                ${special.remark}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="news/special/findByName.htm?1=1&name=${name }"></v:pagination>
    </div>
    </div>
</div>