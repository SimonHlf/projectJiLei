<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>${setting.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <jsp:include page="assets/inc_css.jsp"></jsp:include>
</head>
<body>
<%@include file="assets/loading.jsp"%>
<div class="navbar">
    <div class="navbar-inner">
        <div class="navbar-container">
            <div class="navbar-header pull-left">
                <a href="#" class="navbar-brand">
                    <h1>${setting.name}</h1>
                </a>
            </div>

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="collapse-icon fa fa-bars"></i>
            </div>
            <%@include file="assets/top_left.jsp"%>
        </div>
    </div>
</div>
<div class="main-container container-fluid">
    <div class="page-container">
        <div class="page-sidebar" id="sidebar">
           <!--  <div class="sidebar-header-wrapper">
                <input type="text" class="searchinput" /> <i
                    class="searchicon fa fa-search"></i>
                <div class="searchhelper">直接查询菜单</div>
            </div> -->
            <%@include file="assets/left_nav.jsp"%>
        </div>

        <div class="page-content">
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i> <a href="javascript:void(0)">首页</a></li>
                    <li class="active" id="breadcrumbName"></li>
                </ul>
            </div>
            <div class="page-body">
                <div class="row" id="mainContent">
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="assets/inc_js.jsp"></jsp:include>
</body>
</html>
