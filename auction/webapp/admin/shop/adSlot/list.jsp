<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="shop/adSlot/adSlot.js"></script>



<div class="btn-group">
    <button type="button" onclick="addAdSlot()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delAdSlot()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateAdSlot()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
   <!--  <button type="button" onclick="updateAdSlot()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> -->
</div>
<div class="widget">
    <div class="widget-header bordered-bottom bordered-themeprimary">
        <span class="widget-caption themeprimary">
            <i class="widget-icon fa fa-tasks themeprimary"></i>
           广告位列表</span>
    </div>
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;">
                        <v:checkbox/>
                    </th>
                    <th>
                      图片名
                    </th>
                           
                    <th>
                     图片路径
                    </th> 
                           
                    <th>
                     图片顺序
                    </th> 
                    
                           
                    <th>
                图片显示的位置
                    </th> 
              
                    <th>
                    跳转链接
                    </th> 
              
                  <!--  <th>
                      上传更新时间
                    </th>             
         
                     <th>
                      修改时间
                    </th> -->
                 
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="adSlot">
                        <tr>
                            <td>
                                <v:checkbox value="${adSlot.id}"/>
                            </td>
                            <td>
                                ${adSlot.imgName}
                            </td>
                           
                           <td>
                               <img src="/${adSlot.imgUrl}" width="50px" height="50px">
                            </td>
                           
                            <td>
                               ${adSlot.sort}
                            </td>
                           
                            <td>
                            	<c:forEach items="${position}" var="position">
		                            <c:if test="${adSlot.position == position.value}">${position.remark}</c:if>
                            	</c:forEach>
                            </td>
                            
                            <td>
                               ${adSlot.jumpUrl}
                            </td>
                           
                           <%--  <td>
                               ${adSlot.createTime}
                            </td>
                            <td>
                               ${adSlot.updateTime}
                            </td> --%>
                            
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="shop/adSlot/list.htm?1=1"></v:pagination>
    </div>                                                               
    </div>
</div>