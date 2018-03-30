<%@page pageEncoding="utf-8" %>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addDisrelationshipForm">
            	<input type="hidden" name="id" value="${DisRelationShip.id }">
                <div >
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">用户Id</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="userId" name="userId" value="${DisRelationShip.userId }" placeholder="用户Id" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">标识</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="mark" name="mark" placeholder="标识" value="${DisRelationShip.mark }" required>
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">上级ID</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="pMark" name="pMark" value="${DisRelationShip.pMark }" placeholder="上级ID" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">称号</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="name" value="${DisRelationShip.name }" placeholder="称号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">类型</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="type" name="type" onkeyup="value=value.replace(/[^\d.]/g,'')" value="${DisRelationShip.type }" placeholder="类型">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">描述</label>
                        <div class="col-sm-9">
                            <input class="form-control" id="shipDescribe" value="${DisRelationShip.shipDescribe }" name="shipDescribe" placeholder="描述">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
