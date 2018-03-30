<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/frontuser/frontuser.js"></script>
<div class="btn-group">
    <button type="button" onclick="addUserDisRate()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delDisRate()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateDisRate()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>

</div>
<div style="margin-top:6px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按级别名称查找</span>
                    <input type="text" name="name" value="${disRate.name}" class="form-control" placeholder="按级别名称查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">用户基本信息表</span>
    </div>
    <div class="widget-body">
    <div class="row">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>用户手机号</th>
                    <th>昵称</th>
                    <th>性别</th>
                    <th>出生日期</th>
                    <th>签名</th>
                    <th>头像</th>
                    <th>锁定状态</th>
                    <th>注册时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="frontUser">
                    <tr>
                        <td><v:checkbox value="${frontUser.userId}"/></td>
                        <td title="${frontUser.cellPhone}">${frontUser.cellPhone}</td>
                        <td title="${frontUser.nickName}">${frontUser.nickName}</td>
                        <td>
                        	<c:if test="${frontUser.sex==0}">男</c:if>
                        	<c:if test="${frontUser.sex==1}">女</c:if>
                        </td>
                        <td title="${frontUser.birthday}">${frontUser.birthday}</td>
                        <td title="${frontUser.theSignature}">${frontUser.theSignature}</td>
                        <td><img src="/${frontUser.headPortrait}" style="width: 50px;height: 50px" alt="" onclick="open_(this)"></td>
                        <c:choose>
                            <c:when test="${frontUser.locked == '0'}">
                                <td>未锁定</td>
                            </c:when>
                            <c:otherwise>
                                <td>已锁定</td>
                            </c:otherwise>
                        </c:choose>
                        <td>${frontUser.regTime}</td>
                        <td><a href="javascript:void(0);" onclick="searchItem(${frontUser.userId})">购彩记录</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:pagination page="${page}" url="frontuser/list.htm?1=1"></v:pagination>
        </div></div>
    </div>
</div>