<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="aid" required="true" type="java.lang.Long"%>
<%@attribute name="id" required="false" type="java.lang.Long"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@attribute name="list" required="true" type="java.util.List"%>
<%@attribute name="vlist" required="false" type="java.util.List"%>
<%@ tag import="cn.windy.module.auction.model.AttributeValue"%>
<%@ tag import="cn.windy.module.auction.model.ProductAttrDetail"%>
<%@ tag import="cn.windy.util.spring.SpringUtil"%>
<%@ tag import="java.util.List"%>
<%
	List<AttributeValue> gtlist = list;
	if (vlist != null) {
		List<ProductAttrDetail> v = vlist;
		for (AttributeValue item : gtlist) {
			if (item.getAttrId().equals(aid)) {
				out.print(String.format("<div class='radio'><label> <input type='radio' name='%s' value='%s'",
						name, item.getId()));
				for (ProductAttrDetail value : v) {
					if (value.getValueId().equals(item.getId())) {
						out.print(String.format("checked"));
					}
				}
				out.print(String.format("> <span class='text'>%s</span> </label></div>", item.getValueName()));
			}
		}
	} else {
		for (AttributeValue item : gtlist) {
			if (item.getAttrId().equals(aid)) {
				out.print(String.format("<div class='radio'><label> <input type='radio' name='%s' value='%s'",
						name, item.getId()));
				out.print(String.format("> <span class='text'>%s</span> </label></div>", item.getValueName()));
			}

		}

	}
%>
