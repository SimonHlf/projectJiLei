<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="page" required="true" type="cn.windy.util.Pagination"%>
<%@attribute name="url" required="true" type="java.lang.String" %>
<%@attribute name="menuName" required="false" type="java.lang.String" %>
<div id="pagination"></div>
<script>
    layui.config({
        base: '/assets/layui/lay/modules/'
    });
    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage;
        laypage.render({
            elem: 'pagination'
            , count: ${page.total}
            , curr:${page.page}
            , limit:${page.pageSize}
            ,jump: function (obj,first) {
                var curr = obj.curr;
                if(!first)
                    ajaxLoad('${url}&page='+curr,'${menuName}')
            }
        });
    });
</script>