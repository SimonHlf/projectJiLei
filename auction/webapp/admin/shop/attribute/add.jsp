<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addAttributeForm" enctype="multipart/form-data">
				<input type="hidden" id="cid" name="cid" value="${pCategory.id}">
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">类别</label>
					<div class="col-sm-9">
						<input class="form-control" id="cname" name="cname" readonly="readonly" value="${pCategory.shopTypeName}"
							required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label no-padding-right">名字</label>
					<div class="col-sm-9">
						<input class="form-control" id="attrName" name="attrName" placeholder="名字"
							required>
					</div>
				</div>
					<%-- <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">类别</label>
						<div class="col-sm-9">
							<select name="categoryId1" id="s1"
								onchange="sc(this.options[this.options.selectedIndex].value)">
								<option>一级分类</option>
								<c:forEach var="c" items="${pc}">
									<option value="${c.id}">${c.shopTypeName}</option>
								</c:forEach>
							</select> <select id="s2" name="cid">
							</select>
						</div>
					</div> --%>
					
              <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">状态</label>
                    <div class="col-sm-4">
                        <v:items type="status" id="status" name="status"/>
                    </div>
                </div> 
				
			</form>
		</div>
	</div>
</div>

