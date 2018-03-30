<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-fileupload.min.css"/>
<script type="text/javascript" src="assets/js/bootstrap-fileupload.min.js"></script>
<div class="widget model_widget">
	<div class="widget-body">
         <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="updateAdSlotForm">
                <input type="hidden" id="id" name="id"
                       value="${adSlot.id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">图片名</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="imgName" name="imgName"
                               placeholder="图片名" value="${adSlot.imgName}" required>
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">图片显示位置</label>
                    <div class="col-sm-9">
                        <v:items type="position" id="position" name="position" value="${adSlot.position}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">图片</label>
                    <div class="col-sm-9">
                        <div class="fileupload fileupload-new" data-provides="fileupload">
                            <div class="fileupload-new thumbnail"
                                 style="width: 200px; height: 150px;">
                                <img  src="/${adSlot.imgUrl}"
                                alt=""/>
                                       <!--  src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" -->
                                        
                            </div>
                            <div class="fileupload-preview fileupload-exists thumbnail"
                                 style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                            <div>
 
								<span class="btn btn-default btn-file"> <span
                                        class="fileupload-new"><i class="fa fa-paper-clip"></i>选择图片</span>
									<span class="fileupload-exists"><i class="fa fa-undo"></i>
										替换</span> 上传图片 <input type="file" class="default"
                                                              name="pictures" id="imgs"/>
								</span> <a href="#" class="btn btn-danger fileupload-exists"
                                           data-dismiss="fileupload"><i class="fa fa-trash"></i>
                                         		  删除
                                 </a>
                            </div>
                            <span id="pictureSpan"></span>
                        </div>
                        <div class="tipInfoTxt left1">
							<p>a.&nbsp;尺寸<span style="color:red;">1920*500px(宽*高)</span></p>
							<p>b.&nbsp;图片大小<span style="color:red;">不超过1M</span></p>
						</div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">跳转链接</label>
                    <div class="col-sm-9">
                        <!-- <input type="button" onclick="%%%%()" value="创建Input"/> -->
                        <input class="form-control" id="jumpUrl" name="jumpUrl"
                               placeholder="跳转链接" value="${adSlot.jumpUrl}" required>
                             		 <span style="color: red">在对应商品列表或竞拍商品列表获取商品地址</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">图片顺序</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="sort" name="sort"
                               placeholder="图片顺序" value="${adSlot.sort}" required>
                    </div>
                </div>
                <div class="widget-buttons">
                	<button type="button" onclick="yes1()" class="btn btn-info btn-ok">保存</button>
                	<button type="button" onclick="fanhui()" class="btn btn-default">返回</button>
            	</div>
            </form>
        </div>
    </div>
</div>
 