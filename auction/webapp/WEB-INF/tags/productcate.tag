<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="aid" required="false" type="java.lang.Integer" %>
<%@attribute name="type" required="true" type="java.lang.Boolean"%>
<%@attribute name="name" required="false" type="java.lang.String"%>
<%@ tag import="cn.windy.module.auction.service.IProductCategoryService" %>
<%@ tag import="cn.windy.module.auction.model.ProductCategory"%>
<%@ tag import="cn.windy.util.spring.SpringUtil"%>
<%@ tag import="java.util.List" %>
<%
	IProductCategoryService  pcs=SpringUtil.getBean("productCategoryService");
          List<ProductCategory> list= pcs.selectAllCategory();
      	if(type){
    		if(aid==null){
    			out.print(String.format("<select name='%s'>", name));
    		    for (ProductCategory a : list) {
    			    out.print(String.format("<option value='%s'  ", a.getId()));
    			    out.print(String.format(">%s</option>", a.getShopTypeName()));
    		}
    		    out.print("</select>");
    		}else{
    			out.print(String.format("<select name='%s'>", name));
    			for (ProductCategory a : list) {
    				out.print(String.format("<option value='%s'  ", a.getId()));
    	   		    if(a.getId()==aid){
    				   out.print(String.format("selected='selected'"));
    			 }
    				out.print(String.format(">%s</option>", a.getShopTypeName()));
    			}
    			out.print("</select>");
    		}
    	}
    	else{
    		if(aid!=null){
    			for (ProductCategory a : list) {
    				 if (a.getId().equals(aid)) {
    					 out.print(a.getShopTypeName());
    					 break;
    				}
    		}
    	}
    	}
%>
