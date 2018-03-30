<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget model_widget">
      <div id="horizontal-form">
          <form class="form-horizontal" method="post" id="editHotSearchForm" >
             <input type="hidden" id="id" name="id"  value="${hotSearch.id}" >
              <div class="form-group">
                  <label class="col-sm-2 control-label no-padding-right">搜索词</label>
                  <div class="col-sm-9">
                      <input class="form-control" id="name" name="name" value='<c:out value="${hotSearch.name}" />' placeholder="搜索词" required>
                  </div>
              </div>		
			</form>
      </div>
</div>