<%@page pageEncoding="utf-8" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="importExcelForm" enctype="multipart/form-data">
             <input type="hidden" id="userId" name="userId"  value="${user.userId}" >
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right">文件</label>
                    <div class="col-sm-9">
                        <input class="form-control" type="file" id="fileexcel" name="file" placeholder="文件" required>
                    </div>
                </div>
			</form>
        </div>
    </div>
</div>
<script>

</script>