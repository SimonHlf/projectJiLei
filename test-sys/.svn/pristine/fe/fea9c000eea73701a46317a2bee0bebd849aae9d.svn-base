<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="type" required="true" type="java.lang.String" %>
<%@attribute name="name" required="false" type="java.lang.String" %>
<%@attribute name="value" required="false" type="java.lang.String" %>
<%@attribute name="id" required="true" type="java.lang.String" %>
<%@ tag import="cn.windy.module.admin.hibernate.model.Item" %>
<%@ tag import="cn.windy.module.admin.service.cache.ItemCache" %>
<%@ tag import="java.util.List" %>
<select id="${id}" name="${name}" style="width:100%;">
<%
    List<Item> list = ItemCache.get(type);
    for (Item item : list) {
    	if(item.getCode().equals(value)){
    		out.print(String.format("<option value='%s' selected>%s</option>",item.getValue(),item.getRemark()));
    		continue; 
    	}
        out.print(String.format("<option value='%s'>%s</option>",item.getValue(),item.getRemark()));
    }
%>
</select>
<script>
    $("#${id}").select2();
</script>