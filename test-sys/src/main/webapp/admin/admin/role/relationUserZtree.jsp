<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script>

    var zTreeObj;
    var setting = {
        data : {
            simpleData : {
                enable : true,
                idKey : "id",
                pIdKey : "pid",
                rootPId : 0
            },
            key:{
                url:"###"
            }
        },
        callback : {
            onClick : function(event, treeId, treeNode) {
                $("#menuTable").load("role/relationUser.htm?orgId="+treeNode.id + "&rid="+${rid});
            },
        }
    };
    var nodes = ${nodes};
    $(function(){
        zTreeObj = $.fn.zTree.init($("#menuTree"), setting, nodes);
    })
</script>
<div class="widget">
    <div class="">
        <div class="row">
            <div class="col-lg-2 col-sm-2 col-xs-2">
                <ul id="menuTree" class="ztree"></ul>
            </div>
            <div class="flip-scroll col-lg-10 col-sm-10 col-xs-10" id="menuTable">

            </div>
        </div>

    </div>
</div>