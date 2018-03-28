<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="examination/Statistics/statistics.js"></script>
<script>
    var zTreeObj;
    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: 0
            },
            key: {
                url: "###"
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                if(treeNode.pid == 0){
                    ajaxLoad('statistics/therealTest.htm','考试应考未考统计',this);
                } else {
                    $("#menuTable").load("statistics/therealTestTbody.htm?orgId=" + treeNode.id);
                }
            },
        }
    };
    var nodes = ${nodes};
    zTreeObj = $.fn.zTree.init($("#menuTree"), setting, nodes);
</script>
<script>
    $(function(){
        var dropDown = '${dropDown}';
        $("#dropDown option").each(function(){
            if(dropDown == $(this).val()){
                $(this).attr("selected",true);
            }
        })
    })
</script>

<div class="row">
    <div class="clearfix" style="width: 100%;">
        <div style="float: left; margin-top: 3px;">
            <div class=" input-group" style="float:left;margin-left:25px;">
                <select name="dropDown" id="dropDown">
                    <option value="0">本月</option>
                    <option value="2">本季度</option>
                    <option value="5">半年</option>
                    <option value="11">一年</option>
                </select>
            </div>
            <button type="button" style="float: left;margin:0 20px 0 15px;" onclick="testResults(1,'statistics/therealTest.htm')" class="btn btn-success"><i class="fa fa-search"></i> 查询
            </button>
        </div>
        <div class="form-group" style="float: left;margin-top: 3px;">
            <div class=" input-group " style="float: left;">
                开始时间: <input type="date" value="${startTime}" id="startTime">
                结束时间: <input type="date" value="${endTime}" id="endTime">
            </div>
            <button type="button" style="float: left; margin:0 20px 0 15px;" onclick="testResults(2,'statistics/therealTest.htm')"  class="btn btn-success">
                <i class="fa fa-search"></i> 查询
            </button>
        </div>
        <div style="float: left;margin-top: 3px;">
            <c:choose>
                <c:when test="${empty endTime}">
                    <button type="button" onclick="importTherealTest(${dropDown})" class="btn btn-primary">
                        <i class="fa fa-download"></i> 导出 Excel
                    </button>
                </c:when>
                <c:otherwise>
                    <button type="button" onclick="importTherealTest('','${startTime}','${endTime}')" class="btn btn-primary">
                        <i class="fa fa-download"></i> 导出 Excel
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="widget-body clearfix">
        <div class="col-lg-2 col-sm-2 col-xs-2">
            <ul id="menuTree" class="ztree"></ul>
        </div>
        <div class="flip-scroll col-lg-10 col-sm-10 col-xs-10" id="menuTable">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>考试名称</th>
                    <th>试卷名称</th>
                    <th>所属部门</th>
                    <th>应考</th>
                    <th>实考</th>
                    <th>未考</th>
                    <th>及格人数</th>
                    <th>不及格人数</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="therealTest">
                    <tr>
                        <td><v:checkbox value="${therealTest.id}"/></td>
                        <td title="${therealTest.exam_name}">${therealTest.exam_name}</td>
                        <td title="${therealTest.creatName}">${therealTest.creatName}</td>
                        <td title="${therealTest.orgName}">${therealTest.orgName}</td>
                        <td title="${therealTest.TotalNumber}"><a href="javascript:TherealDetails(1,${therealTest.id},2)">${therealTest.TotalNumber}</a></td>
                        <td title="${therealTest.ActualTOTAL}"><a href="javascript:TherealDetails(2,${therealTest.id},2)">${therealTest.ActualTOTAL}</a></td>
                        <td title="<fmt:formatNumber value="${therealTest.TotalNumber - therealTest.ActualTOTAL.intValue() }"/>">
                            <a href="javascript:TherealDetails(3,${therealTest.id},2)"><fmt:formatNumber value="${therealTest.TotalNumber - therealTest.ActualTOTAL.intValue() }"/></a></td>
                        <td title="${therealTest.passPeople}"><a href="javascript:TherealDetails(4,${therealTest.id},2)">${therealTest.passPeople}</a></td>
                        <td title="${therealTest.failPeople}"><a href="javascript:TherealDetails(5,${therealTest.id},2)">${therealTest.failPeople}</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="thereaPage" value="${page.page}">
            <v:pagination page="${page}" url="statistics/therealTest.htm?1=1&cmd=${cmd}&startTime=${startTime}&endTime=${endTime}&dropDown=${dropDown}"></v:pagination>
        </div>
    </div>
</div>



<%--

<div class="widget">
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>考试名称</th>
                    <th>试卷名称</th>
                    <th>应考</th>
                    <th>实考</th>
                    <th>未考</th>
                    <th>及格人数</th>
                    <th>不及格人数</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="therealTest">
                    <tr>
                        <td><v:checkbox value="${therealTest.id}"/></td>
                        <td title="${therealTest.exam_name}">${therealTest.exam_name}</td>
                        <td title="${therealTest.creatName}">${therealTest.creatName}</td>
                        <td title="${therealTest.TotalNumber}"><a href="javascript:TherealDetails(1,${therealTest.id},2)">${therealTest.TotalNumber}</a></td>
                        <td title="${therealTest.ActualTOTAL}"><a href="javascript:TherealDetails(2,${therealTest.id},2)">${therealTest.ActualTOTAL}</a></td>
                        <td title="<fmt:formatNumber value="${therealTest.TotalNumber - therealTest.ActualTOTAL.intValue() }"/>">
                            <a href="javascript:TherealDetails(3,${therealTest.id},2)"><fmt:formatNumber value="${therealTest.TotalNumber - therealTest.ActualTOTAL.intValue() }"/></a></td>
                        <td title="${therealTest.passPeople}"><a href="javascript:TherealDetails(4,${therealTest.id},2)">${therealTest.passPeople}</a></td>
                        <td title="${therealTest.failPeople}"><a href="javascript:TherealDetails(5,${therealTest.id},2)">${therealTest.failPeople}</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="hidden" id="thereaPage" value="${page.page}">
            <v:pagination page="${page}" url="statistics/therealTest.htm?1=1&cmd=${cmd}&startTime=${startTime}&endTime=${endTime}&dropDown=${dropDown}"></v:pagination>
        </div>
    </div>
</div>--%>
