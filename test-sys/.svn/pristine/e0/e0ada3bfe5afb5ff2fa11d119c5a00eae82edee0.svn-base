<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="admin/org/org.js"></script>
<script>
    var zTreeObj;
    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: 0
            },
            key: {
                url: "###"
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                $("#menuTable").load("org/tbody.htm?orgId="+treeNode.id+"&level="+treeNode.level);
            },
        }
    };
    var nodes = ${nodes};

    $(document).ready(function () {
        zTreeObj = $.fn.zTree.init($("#menuTree"), setting, nodes);
    });
</script>
<div class="btn-group">
	<div style="margin-top:3px;float: left;padding: 5px">
        <form id="searchOrgForm" method="post">
	        <div class="row">
	            <div class="form-group col-lg-4" style="width: 230px;">
	                <div class=" input-group">
	                    <input type="text" name="name" value="${org.name}" class="form-control" placeholder="按名称查找">
	                </div>
	            </div>
	          </div>
	    </form>
    </div>
    <div style="float: left;padding: 5px;margin-top: 3px;">
	    <button type="button" onclick="searchOrg()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
	    <button type="button" onclick="addOrg()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
		<button type="button" onclick="delOrg()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
		<button type="button" onclick="editOrg()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
<!-- 		<button type="button" onclick="onHelp()" class="btn btn-warning"><i class="fa fa-question"></i> 操作说明</button> -->
	</div>
</div>

<div class="widget">
    <div class="widget-body">
        <div class="row">
            <div class="col-lg-2 col-sm-2 col-xs-2">
                <ul id="menuTree" class="ztree"></ul>
            </div>
            <div class="flip-scroll col-lg-10 col-sm-10 col-xs-10" id="menuTable">
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
                    <c:forEach items="${list}" var="org">
                        <tr>
                            <td>
                                <v:checkbox value="${org.id}"/>
                            </td>
                            <td>
                               <a onclick="details(${org.id})"> ${org.name}</a>
                            </td>
                            <td>
                                    ${org.remark}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <v:pagination page="${page}" url="org/list.htm?1=1"></v:pagination>
            </div>
        </div>
    </div>
</div>