<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="aboutUs/cooperation/cooperation.js"></script>
<div class="btn-group">
    <button type="button" onclick="addItem()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delItem()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editItem()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
</div>
<div style="margin-top:6px;">
    <form id="searchItemForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按名称查找</span>
                    <input type="text" name="name" value="" class="form-control" placeholder="按名称查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">合作伙伴列表</span>
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
                        链接
                    </th>
                    <th>
                        图片
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="cooperation">
                        <tr>
                            <td>
                                <v:checkbox value="${cooperation.id}"/>
                            </td>
                            <td>
                               <a onclick="details(${cooperation.id})">${cooperation.name}</a>
                            </td>
                               <td>
                                <a href="${cooperation.url}" >${cooperation.url}</a>
                            </td>
                            <td>
                            	<img src="/${cooperation.image}" width="50px" height="50px">
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="companybasic/cooperation/list.htm?1=1"></v:pagination>
    </div>
    </div>
</div>