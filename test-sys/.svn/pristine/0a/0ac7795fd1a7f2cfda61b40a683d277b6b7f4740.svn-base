<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="type" required="true" type="java.lang.String" %>
<%@attribute name="name" required="false" type="java.lang.String" %>
<%@attribute name="value" required="false" type="java.lang.Long" %>
<%@attribute name="id" required="true" type="java.lang.String" %>
<%@ tag import="java.util.List" %>
<%@ tag import="cn.windy.module.examination.mybatis.model.PaperCreat" %>
<%@ tag import="cn.windy.module.examination.service.cache.creatListCache" %>
<select id="${id}" name="${name}" style="width:100%;">
    <%
        List<PaperCreat> list = creatListCache.findAllSelectTwo();
        for (PaperCreat paperCreat : list) {
            if(paperCreat.getId() == value){
                out.print(String.format("<option value='%s' selected>%s</option>",paperCreat.getId(),paperCreat.getName()));
                continue;
            }
            out.print(String.format("<option value='%s'>%s</option>",paperCreat.getId(),paperCreat.getName()));
        }
    %>
</select>
<script>
    $("#${id}").select2();
</script>