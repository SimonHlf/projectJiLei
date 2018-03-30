<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="aid" required="false" type="java.lang.String"%>
<%@ tag import="cn.windy.module.auction.model.ServiceTag"%>
<%@ tag import="cn.windy.module.auction.service.IServiceTagService"%>
<%@ tag import="cn.windy.util.spring.SpringUtil"%>
<%@ tag import="java.util.List"%>
<%
IServiceTagService iss = SpringUtil.getBean("serviceTagService");
	List<ServiceTag> atlist = iss.findAll();
	if (aid != null) {
		String[] idlist = aid.split(",");
		for (ServiceTag item : atlist) {
			out.print(String.format("<label> <input type='checkbox' value='%s'", item.getId()));
			for (String id : idlist) {
				if (Long.valueOf(id).equals(item.getId())) {
					out.print(String.format("checked='checked'"));
				}
			}
			out.print(String.format("> <span class='text'>%s</span></label>", item.getName()));
		}
	} else {
		for (ServiceTag item : atlist) {
			out.print(String.format("<label> <input type='checkbox' value='%s'", item.getId()));
			out.print(String.format("> <span class='text'>%s</span></label>", item.getName()));
		}
	}
%>
