<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/footer/footer.js"></script>



<div class="btn-group">
    <button type="button" onclick="addAuction()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delAuction()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateAuction()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">底部管理</span>
    </div>
    <div class="widget-body">
    	 <div class="row">
	    	<div class="col-lg-2 col-sm-2 col-xs-2">
	                <ul id="menuTree" class="ztree"></ul>
	            </div>
	            <script>
	                var zNodes = [${nodes}];
	                $(document).ready(function(){
	                    $.fn.zTree.init($("#menuTree"), setting, zNodes);
	                });
	            </script>
	        	<div class="flip-scroll col-lg-10 col-sm-10 col-xs-10" id="menuTable">
	            <table class="table table-bordered table-striped table-condensed flip-content">
	                <thead class="flip-content bordered-palegreen">
	                <tr>
	                    <th width="44px;"><v:checkbox/></th>
	                    <th>模块名</th>
	                    <th>链接地址</th> 
	                    <!-- <th>父类</th>  -->
	                </tr>
	                </thead>
	                <tbody id="footer">
	                    <c:forEach items="${list}" var="footer">
	                        <tr>
	                            <td><v:checkbox value="${footer.id}"/></td>
	                            <td>
	                            	<c:out value=" ${footer.modelName}" />
	                            </td>
	                            <td>
	                            	<c:out value="${footer.hrefs }" />
	                            </td>
	                           <%--  <td>${footer.attr0 }</td> --%>
	                        </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	            <v:pagination page="${page}" url="auction/footer/list.htm?1=1&pid=${pid }"></v:pagination>
	   		</div>     
	   	</div>                                                          
    </div>
</div>