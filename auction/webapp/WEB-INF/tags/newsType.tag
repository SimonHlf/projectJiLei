<%-- <%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="vid" required="true" type="java.lang.Long" %>
<%@attribute name="id" required="true" type="java.lang.String" %>
<%@ tag import="java.util.List" %>
<%@ tag import="cn.windy.module.news.hibernate.model.NewsType" %>
<%@ tag import="cn.windy.module.news.service.cache.NewsTypeCache" %>
<select id="${id}" name="${id}" style="width:100%;">
<%
    List<NewsType> list = NewsTypeCache.get();
    for (NewsType type : list) {
    	if(type.getId() == vid){
    		out.print(String.format("<option value='%s' selected>%s</option>",type.getId()+"",type.getName()));
    		continue; 
    	}
        out.print(String.format("<option value='%s'>%s</option>",type.getId()+"",type.getName()));
    }
%>
</select>
<script>
    $("#${id}").select2();
</script> --%>