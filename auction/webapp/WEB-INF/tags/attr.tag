<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="aid" required="false" type="java.lang.Long"%>
<%@attribute name="type" required="true" type="java.lang.Boolean"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@ tag import="cn.windy.module.auction.service.IAttributeService"%>
<%@ tag import="cn.windy.module.auction.model.Attribute"%>
<%@ tag import="cn.windy.util.spring.SpringUtil"%>
<%@ tag import="java.util.List"%>
<%
	IAttributeService pcs = SpringUtil.getBean("attributeService");
	List<Attribute> list = pcs.findAll(null,null,null);
	if(type){
		if(aid==null){
			out.print(String.format("<select name='%s'>", name));
		    for (Attribute a : list) {
			    out.print(String.format("<option value='%s'  ", a.getId()));
			    out.print(String.format(">%s</option>", a.getAttrName()));
		}
		    out.print("</select>");
		}else{
			out.print(String.format("<select name='%s'>", name));
			for (Attribute a : list) {
				out.print(String.format("<option value='%s'  ", a.getId()));
	   		    if(a.getId().equals(aid)){
				   out.print(String.format("selected='selected'"));
			 }
				out.print(String.format(">%s</option>", a.getAttrName()));
			}
			out.print("</select>");
		}
	}
	else{
		if(aid!=null){
			for (Attribute a : list) {
				 if (a.getId().equals(aid)) {
					 out.print(a.getAttrName());
					 break;
				}
		}
	}
	}

%>