<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="aboutUs/companybasic/company.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css" />
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="editCompanyForms">
                <input type="hidden" name="id" value="${company.id}">
                <div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">公司名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="name" maxlength="100" name="name" value="${company.name}" placeholder="公司名称" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">公司英文名称</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="engName" maxlength="120" name="engName" value="${company.engName}" placeholder="公司英文名称" required>
                    </div>
                </div>

                <%-- <div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">登陆输入框前logo</label>
                    <div class="col-md-9">
                        <!-- div1 -->
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                            <div class="fileupload-new thumbnail"
                                 style="width: 200px; height: 150px;">
                                <img src="/${company.logo}" alt="" />
                            </div>
                            <div class="fileupload-preview fileupload-exists thumbnail"
                                 style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                            <div>
								<span class="btn btn-default btn-file">
                                    <span class="fileupload-new">
                                    <i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>替换</span> <!-- 上传图片 -->
                                    <input type="file" accept="image/gif,image/bmp,image/jpeg,image/jpg,image/png,image/svg" class="default" name="headImage" id="imgs" />
								</span>
                                <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">
                                    <i class="fa fa-trash"></i>
                                删除
                                </a>
                            </div>
                            <span id="pictureSpan" style="color:red">提示:登陆输入框前logo大小在 100*100 像素之间</span>
                        </div>
                    </div>
                </div> --%>
				<div class="form-group">
					  <label class="col-sm-2 control-label no-padding-right">LOGO</label>
					<div class="col-sm-9">
					<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail"
								style="width: 200px; height: 150px;">
								<c:if test="${company.logo==null || company.logo=='' }">
									<img
										src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
										alt="" />
								</c:if>
								<c:if test="${company.logo!=null || company.logo!='' }">
									<img src="/${company.logo }" alt="" />
								</c:if>
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail"
								style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
							<div>
								<span class="btn btn-default btn-file"> <span
									class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>
										替换</span> 上传图片 <input type="file" class="default"
									name="headImage" id="imgs" />
								</span> <a href="#" class="btn btn-danger fileupload-exists"
									data-dismiss="fileupload"><i class="fa fa-trash"></i>
								删除 </a>
							</div>
							<span id="pictureSpan"></span> 
						</div>
					</div>
				</div> 
                 <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">公司地址</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="address" name="address" maxlength="100" value="${company.address}" placeholder="公司地址" required>
                    </div>
                </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">公司邮编</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="code" name="code" value="${company.code}" maxlength="6" onkeyup='this.value=this.value.replace(/\D/gi,"")' placeholder="公司邮编" required>
                        </div>
                    </div>
    
				
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">公司电话</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="phone" name="phone" value="${company.phone}" placeholder="公司电话" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">固定电话</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="telephone" name="telephone" value="${company.telephone}"  placeholder="固定电话" required>
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">企业邮箱</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="email" name="email" value="${company.email}" placeholder="企业邮箱" required>
                    </div>
                </div>
               <%--  <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">经度</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="latitude" name="latitude" value="${company.latitude}" placeholder="经度" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">纬度</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="longitude" name="longitude" value="${company.longitude}" placeholder="维度" required>
                    </div>
                </div> --%>
                <div class="widget-buttons">
                		<button type="button" onclick="yes()" class="btn btn-info btn-ok">确认修改</button>
                		<!-- <button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button> -->
            	  </div>
			</div>
            </form>
        </div>
    </div>
</div>
