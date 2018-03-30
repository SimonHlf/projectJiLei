<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/setting/setting.js"></script>
<div class="btn-group">
    <button type="button" onclick="addSetting()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delSetting()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="editSetting()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchSetting()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
</div>
<div style="margin-top:6px;">
    <form id="searchSettingForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <span class="input-group-addon">按名字查找</span>
                    <input type="text" name="name" value="${setting.name}" class="form-control" placeholder="按名字查找">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">系统设置</span>
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
                        系统名称
                    </th>
                    <th>
                        简名
                    </th>
                    <th>
                        域名
                    </th>
                    <th>
                        是否弹窗
                    </th>
                    <th>
                        是否有组织
                    </th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="setting">
                        <tr>
                            <td>
                                <v:checkbox value="${setting.id}"/>
                            </td>
                            <td>
                                <a onclick="details(${setting.id})">${setting.name}</a>
                            </td>
                            <td>
                                ${setting.shortName}
                            </td>
                            <td>
                                ${setting.domain}
                            </td>
                            <td>
                                <v:item type="add_is_dialog" value="${setting.addIsDialog}"/>
                            </td>
                            <td>
                                <v:item type="org_is_use" value="${setting.orgIsUse}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="setting/list.htm?1=1"></v:pagination>
    </div>
    </div>
</div>