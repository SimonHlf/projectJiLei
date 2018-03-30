<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="contactway/credit.js"></script>
<script>
function activeNotice(id){
	$.ajax({
		type : "post",
		url : "shop/contact/setActiveNotice.htm",
		async : false,
		dataType:"json",
		data:{id:id},
		success : function(data){
			if(data == "1"){
				layer.msg("启用成功");
			}else{
				layer.alert("设置失败",{skin: "layui-layer-molv"});
			}
		}
	});
}
function disActiveNotice(id){
	$.ajax({
		type : "post",
		url : "shop/contact/disActiveNotice.htm",
		async : false,
		dataType:"json",
		data:{id:id},
		success : function(data){
			if(data == "1"){
				layer.msg("禁用成功");
			}else{
				layer.alert("设置失败",{skin: "layui-layer-molv"});
			}
		}
	});
}
</script>
<div class="btn-group">
     <button type="button" onclick="addCredit()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button> 
    <button type="button" onclick="delCredit()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
     <button type="button" onclick="editCredit()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button> 
    <!-- <button type="button" onclick="searchCredit()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> -->

</div>
<div style="margin-top:6px;">
    <form id="searchCreditForm" method="post">
        <div class="row">
            <div class="form-group col-lg-4">
                <div class=" input-group">
                    <%-- <span class="input-group-addon">按联系号查找</span>
                    <input type="text" name="contactNuma" value="${contactNuma}" class="form-control" placeholder="按联系号查找"> --%>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">联系方式及充值方式</span>
    </div>
    <div class="widget-body">
    <div class="row">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>类型</th>
                    <th>类型内容</th>
                    <th>状态</th>
                     <th>时间</th>
                     <th>是否启用</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="credit">
                    <tr>
                        <td><v:checkbox value="${credit.id}"/></td>
                         <td>
	                        <c:if test="${credit.type==0 }">QQ1</c:if>
	                        <c:if test="${credit.type==1 }">QQ2</c:if>
	                        <c:if test="${credit.type==2 }">微信1</c:if>
	                        <c:if test="${credit.type==3 }">微信2</c:if>
	                        <c:if test="${credit.type==4 }">二维码</c:if>
	                        <c:if test="${credit.type==5 }">二维码介绍</c:if>
                        </td>	
   						<td>
   							<c:choose>
   								<c:when test="${credit.type==4 }">
   									<img  width="50px" height="30px" src="/${credit.contactNuma} ">
   								</c:when>
   								<c:otherwise>
   									${credit.contactNuma}
   								</c:otherwise>
   							</c:choose>
   						</td>
                        <td>
                        <c:if test="${credit.isOpen==0 }">未启用</c:if>
                        <c:if test="${credit.isOpen==1 }">已启用</c:if>
                        </td>
                        <td>${credit.updateTime}</td>
                        
                        <td>
                        <button class="btn btn-success" onclick="activeNotice(${credit.id});">启用</button>
	                    <button class="btn btn-danger" onclick="disActiveNotice(${credit.id});">禁用</button>
                        </td>
                        
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="disRatePage" value="${page.page}">
            <v:pagination page="${page}" url="shop/contact/list.htm?1=1"></v:pagination>
        </div>
    </div>
    </div>
</div>