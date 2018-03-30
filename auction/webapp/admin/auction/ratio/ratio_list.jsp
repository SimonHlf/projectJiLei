<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="auction/ratio/ratio.js"></script>
<div class="btn-group">
    <button type="button" onclick="addRatio()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delRatio()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editRatio()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">比例列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>比例名称</th>
                    <th>类型</th>
                    <th>人民币</th>
                    <th>积分</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="ratio">
                        <tr>
                            <td><v:checkbox value="${ratio.id}"/></td>
                            <td>${ratio.name}</td>
                            <td>
	                            <c:if test="${ratio.type==0}">兑换比例</c:if>
	                            <c:if test="${ratio.type==1}">积分比例</c:if>
                            </td>
                            <td>${ratio.rmb}</td>
                            <td>${ratio.ratio}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="ratioController/getAll.htm?1=1"></v:pagination>
        </div>
    </div>
</div>