<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/disrelationship/disrelationship.js"></script>
<div class="btn-group">
<!--     <button type="button" onclick="addDisrelationship()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>-->
    <button type="button" onclick="delDisrelationship()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button> 
    <button type="button" onclick="updateDisrelationship()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>

</div>
<div style="margin-top:6px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按账号查找</span>
                    <input type="text" name="name" value="${item.name}" class="form-control" placeholder="按账号查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">分销管理<span style="color: red;" readonly="readonly">(初始数据部分用户未拥有分销关系)</span></span>
    </div>
    <div class="widget-body">
    <div class="row">
        <div class="flip-scroll">
            <c:choose>
                <c:when test="${empty list}">
                    <br>
                    <br>
                    <p align="center">暂无信息</p>
                    <br>
                    <br>
                </c:when>
                <c:otherwise>
                    <table class="table table-bordered table-striped table-condensed flip-content">
                        <thead class="flip-content bordered-palegreen">
                        <tr>
                            <th width="44px;"><v:checkbox/></th>
                            <th>用户名称</th>
                            <th>用户账号</th>
                            <th>上级名称</th>
                            <th>上下级</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="disRelationship">
                            <tr>
                                <td><v:checkbox value="${disRelationship.id}"/></td>
                                <td>${disRelationship.thisNickName}</td>
                                <td>${disRelationship.thisCellPhone}</td>
                                <td>${disRelationship.sNickName}</td>
                                <td><a onclick="superior(${disRelationship.pMark},1)" style="color:#4EC1E7; cursor:pointer;">上级</a>&nbsp;&nbsp;<a onclick="superior(${disRelationship.user_id},0)" style="color:#4EC1E7; cursor:pointer;">下级</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>

            <input type="hidden" id="DisrelationshipPage" value="${page.page}">
            <v:pagination page="${page}" url="disrelationship/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div></div>