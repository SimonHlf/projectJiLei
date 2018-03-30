
<%@tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="aid" required="false" type="java.lang.String"%>
<%@ tag import="cn.windy.module.auction.model.EvaluationTag"%>
<%@ tag import="cn.windy.module.auction.service.IEvaluationTagService"%>
<%@ tag import="cn.windy.util.spring.SpringUtil"%>
<%@ tag import="java.util.List"%>
<%
	IEvaluationTagService bs = SpringUtil.getBean("evaluationtagService");
	List<EvaluationTag> atlist = bs.findAll();
	if (aid != null) {
		String[] idlist = aid.split(",");
		for (EvaluationTag item : atlist) {
			out.print(String.format("<label> <input type='checkbox' value='%s'", item.getId()));
			for (String id : idlist) {
				if (Integer.valueOf(id).equals(item.getId())) {
					out.print(String.format("checked='checked'"));
				}
			}
			out.print(String.format("> <span class='text'>%s</span></label>", item.getTagName()));
		}
	} else {
		for (EvaluationTag item : atlist) {
			out.print(String.format("<label> <input type='checkbox' value='%s'", item.getId()));
			out.print(String.format("> <span class='text'>%s</span></label>", item.getTagName()));
		}
	}
%>