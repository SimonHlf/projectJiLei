<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="" id="BatchImportExcelForm">
    <input id="lefile" type="file" name="file" readonly style="display: none;height: 32px;">
    <div class="input-append fl">
        <input id="photoCover" name="file" class="input-large" type="text"
               style="height: 30px;"> <a class="btn" onclick="$('input[id=lefile]').click();">选择试题文件</a>
    </div>
    &nbsp;
    <button type="button" onclick="downloadTemplateQuesType()" class="btn btn-primary">
        <i class="fa fa-download"></i> 下载模板
    </button>
    <%--<button type="button" onclick="" class="btn btn-primary fl">
        <i class="fa fa-pencil"></i> 导入
    </button>--%>

</form>
<script>
    $('input[id=lefile]').change(function() {
        $('#photoCover').val($(this).val());
    });

</script>