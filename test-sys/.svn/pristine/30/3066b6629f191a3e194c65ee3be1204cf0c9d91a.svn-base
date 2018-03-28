<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/disrate/disrate.js"></script>
<div class="btn-group">
    <button type="button" onclick="addDisRate()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
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
        <span class="widget-caption themeprimary">分销率设置表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>级别名称</th>
                    <th>类型</th>
                    <th>费率值</th>
                    <th>描述</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="disRate">
                    <tr>
                        <td><v:checkbox value="${disRate.id}"/></td>
                        <td>${disRate.name}</td>
                        <td>${disRate.type}</td>
                        <td>${disRate.rateValue}</td>
                        <td>${disRate.rateDescribe}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:pagination page="${page}" url="disrate/list.htm?1=1"></v:pagination>
        </div>
    </div>
</div>