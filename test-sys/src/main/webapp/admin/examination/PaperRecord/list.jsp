<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/PaperRecord/paperRecord.js"></script>
<!-- <link href="assets/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" /> -->
<SCRIPT>
	var zTreeObj;
	var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : 0
			},
	    key:{
	    	url:"###"
	    }
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				/* if(treeNode.pid==0){
					$("#menuTable").load("paperRecordController/getOne.htm?insId=" + treeNode.id);
					
				}else{ */
					$("#menuTableAndQuesTypeList").load("paperRecordController/getUser.htm?insId=" + treeNode.id+"&level="+treeNode.level);	
				/* } */
				
				
			},
		}
	};
	var nodes = ${nodes};
	
	/* $(document).ready(function() { */
		zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
	/* }); */
</SCRIPT>
<script src="examination/PaperRecord/paperRecord.js"></script>
<div class="btn-group">
    <!-- <button type="button" onclick="addDisRate()" class="btn btn-info"><i class="fa fa-plus"></i> 添加</button>
    <button type="button" onclick="delDisRate()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
    <button type="button" onclick="updateDisRate()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
    <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button> -->

</div>
    <div style="margin-top:6px;margin-top: 0px;">
        <form id="searchItemForm" method="post">
            <%-- <div class="row">
                <div class="form-group col-lg-4" style="width: 230px;">
                    <div class=" input-group">
                        <span class="input-group-addon">按级姓名查找</span>
                        <input type="text" name="name"  class="form-control" placeholder="按姓名查找">
                    </div>
                </div>
                <button type="button" onclick="searchItem()" class="btn btn-success"><i class="fa fa-search"></i> 查询</button>
            </div> --%>
        </form>
    </div>
<div class="widget">
    <!-- <div class="widget-header bordered-bottom bordered-themeprimary">
        <i class="widget-icon fa fa-tasks themeprimary"></i>
        <span class="widget-caption themeprimary">考生考试记录</span>
    </div> -->
    <div class="widget-body">
    	<div class="row">
    		<div class="clearfix" style="width:16%;float:left;margin-left:5px;">
                <label>部门目录</label>
                <ul id="treeDemo" class="ztree"></ul>
            </div>

			<div id="menuTableAndQuesTypeList" style="width:83%;float:left;">
				<div id="menuTable" style="float: left; width:16%;"></div>
				<div id="quesTypeList"
					style="float: left; padding: 10px; width:83%;">
					<div class="flip-scroll">
						<table
							class="table table-bordered table-striped table-condensed flip-content">
							<thead class="flip-content bordered-palegreen">
								<tr>
									<th width="44px;"><v:checkbox /></th>
									<th>考生姓名</th>
									<th>考生工号</th>
									<th>考试名称</th>
									<th>所属部门</th>
									<th>试卷名称</th>
									<th>考试时间</th>
									<th>试卷总分</th>
									<th>考生得分</th>
									<th>详情</th>
									<th>导出word</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="userRecord">
									<tr>
										<td><v:checkbox value="${userRecord.id}" /></td>
										<td>${userRecord.nick_name}</td>
										<td>${userRecord.attr0}</td>
										<td>${userRecord.exam_name}</td>
										<td>${userRecord.orgName}</td>
										<td>${userRecord.creatName}</td>
										<td>${userRecord.creatTime}</td>
										<td>${userRecord.attr5}分</td>
										<td>${userRecord.fen}分</td>
										<td><a href="javascript:details(${userRecord.id})">查看</a></td>
										<td><a href="javascript:daochu(${userRecord.id})">导出word</a></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
						<input type="hidden" id="disRatePage" value="${page.page}">
						<v:papers page="${page}"
							url="paperRecordController/getDetail.htm?1=1?userId=${userId}"></v:papers>
					</div>
				</div>
			</div>

		</div>
        
    </div>
</div>
<!--  <script src="assets/zTree_v3/js/jquery.ztree.all.js"></script> -->