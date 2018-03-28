<%@page pageEncoding="utf-8" %>
<script>
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
    };

    var zNodes = [${nodes}];
    $(document).ready(function(){
        $.fn.zTree.init($("#menuTree"), setting, zNodes);
    });
</script>
<ul id="menuTree" class="ztree"></ul>