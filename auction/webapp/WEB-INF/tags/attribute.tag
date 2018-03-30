
<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="aid" required="false" type="java.lang.String"%>
<%@attribute name="cid" required="true" type="java.lang.Integer"%>
<%@ tag import="cn.windy.module.auction.model.Attribute"%>
<%@ tag import="cn.windy.module.auction.service.IAttributeService"%>
<%@ tag import="cn.windy.util.spring.SpringUtil"%>
<%@ tag import="java.util.List"%>
<%
	IAttributeService bs = SpringUtil.getBean("attributeService");
	List<Attribute> atlist = bs.findByCid(cid);
	if (aid != null) {
		String[] idlist = aid.split(",");
		for (Attribute item : atlist) {
			out.print(String.format("<label> <input type='checkbox' value='%s'", item.getId()));
			for (String id : idlist) {
				if (Long.valueOf(id).equals(item.getId())) {
					out.print(String.format("checked='checked'"));
				}
			}
			out.print(String.format("> <span class='text'>%s</span></label>", item.getAttrName()));
		}
	} else {
		for (Attribute item : atlist) {
			out.print(String.format("<label> <input type='checkbox' value='%s'", item.getId()));
			out.print(String.format("> <span class='text'>%s</span></label>", item.getAttrName()));
		}
	}
%>