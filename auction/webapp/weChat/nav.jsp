<%@ page contentType="text/html;charset=UTF-8"%>
<script src="${pageContext.request.contextPath }/admin/assets/js/jquery-2.0.3.min.js"></script>
<footer id="footer" class="aui-bar aui-bar-tab aui-bar-tab-cl aui-border-t" style="height: 2.5rem">
    <a href="mapKm.htm" class="comTabA aui-bar-tab-item ">
        <input type="hidden" value="1"/>
        <i class="aui-iconfont aui-icon-home"></i>
        <div class="aui-bar-tab-label">周边</div>
    </a>
    <a class="comTabA aui-bar-tab-item" tapmode href="info2.htm">
        <input type="hidden" value="2"/>
        <i class="aui-iconfont aui-icon-menu"></i>
        <div class="aui-bar-tab-label">信息广场</div>
    </a>
    <a href="${pageContext.request.contextPath }/weChat/personal2.htm" class="comTabA aui-bar-tab-item" >
        <input type="hidden" value="3"/>
        <i class="aui-iconfont aui-icon-my"></i>
        <div class="aui-bar-tab-label">我的</div>
    </a>
</footer>