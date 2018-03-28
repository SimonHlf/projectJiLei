<%@page pageEncoding="utf-8"%>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="widget model_widget">
	<div class="widget-body">
		<div id="horizontal-form">
			<form class="form-horizontal" method="post" id="addFrontUser">
				<div>
				
					 <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生手机号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="cellPhone" name="cellPhone" placeholder="考生手机号" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考生姓名</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="nickName" name="nickName" placeholder="考生姓名" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">性别</label>
                        <div class="col-sm-9">
                              <v:items type="sex" id="sex" name="sex"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">出生日期</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="birthday" name="birthday" placeholder="出生日期">
                        </div>
                    </div>
                    <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">图片</label>
						<div class="col-md-10" style="    left: 0px;">
						<!-- 上传图片 --> <input type="file" class="default"name="headImages" id="imgs" placeholder="图片" />
						<span id="pictureSpan"></span>
						</div>
					</div>
					<div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                        <div class="col-md-10">
                        	<select name="orgId" id="orgId">
                        		<option>--请选择机构--</option>
                        		<c:forEach items="${windyOrgList}" var="windyOrg">
                        			<option value="${windyOrg.id}">${windyOrg.name}</option>
                        		</c:forEach>
                        	</select>
                            
                        </div>
                    	</div>
				</div>
			</form>
		</div>
	</div>
</div>

