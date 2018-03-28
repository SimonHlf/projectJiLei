<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="type" required="true" type="java.lang.String" %>
<%@attribute name="value" required="true" type="java.lang.String" %>
<%@ tag import="cn.windy.module.admin.hibernate.model.Item" %>
<%@ tag import="cn.windy.module.admin.service.cache.ItemCache" %>
<%@ tag import="java.util.List" %>
<%
    List<Item> list = ItemCache.get(type);
    for (Item item : list) {
        if(item.getValue().equals(value)){
            out.print(item.getRemark());
            break;
        }
    }
%>