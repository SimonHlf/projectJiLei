<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/Statistics/statistics.js"></script>

<div style="margin-top:6px;margin-top: 0px; float: left;padding: 10px;width: 320px;">
    <div class="row">
        <div class="form-group col-lg-4" style="padding-right: 10px;">
            <div class=" input-group ">
                <select name="dropDown" id="dropDown">
                    <option value="0">本月</option>
                    <option value="2">本季度</option>
                    <option value="5">半年</option>
                    <option value="11">一年</option>
                </select>
            </div>
        </div>
        <button type="button" onclick="testResults(1,'statistics/testResults.htm')" class="btn btn-success"><i class="fa fa-search"></i> 查询
        </button>
    </div>
</div>
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

<div style="margin-top:6px;margin-top: 0px; float: left;margin-left:-90px;padding: 10px;width: 600px;">
    <div class="row">
        <div class="form-group col-lg-4" style="padding-right: 10px;">
            <div class=" input-group " style="width:450px">
                开始时间: <input type="date" value="${startTime}" id="startTime">
                结束时间: <input type="date" value="${endTime}" id="endTime">
            </div>
        </div>
        <button type="button" onclick="testResults(2,'statistics/testResults.htm')" style="margin-left:250px;margin-top:3px" class="btn btn-success">
            <i class="fa fa-search"></i> 查询
        </button>
    </div>
</div>
<div class="widget">
    <div class="widget-body">
        <div class="flip-scroll">
            <table class="table table-bordered table-striped table-condensed flip-content">
                <thead class="flip-content bordered-palegreen">
                <tr>
                    <th width="44px;"><v:checkbox/></th>
                    <th>考生名称</th>
                    <th>试卷名称</th>
                    <th>试卷总分</th>
                    <th>分数</th>
                    <th>是否及格</th>
                    <th>部门</th>
                    <th>考试时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="testResults">
                    <tr>
                        <td><v:checkbox value="${testResults.id}"/></td>
                        <td title="${testResults.nick_name}">${testResults.nick_name}</td>
                        <td title="${testResults.createName}">${testResults.createName}</td>
                        <td title="${testResults.attr5}">${testResults.attr5}</td>
                        <td title="${testResults.fen}">${testResults.fen}</td>
                        <c:choose>
                            <c:when test="${testResults.attr6 == 0}">
                                <td>不及格</td>
                            </c:when>
                            <c:otherwise>
                                <td>及格</td>
                            </c:otherwise>
                        </c:choose>
                        <td title="${testResults.name}">${testResults.name}</td>
                        <td title="${testResults.creatTime}">${testResults.creatTime}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <v:pagination page="${page}" url="statistics/testResults.htm?1=1&cmd=${cmd}&startTime=${startTime}&endTime=${endTime}&dropDown=${dropDown}"></v:pagination>
        </div>


    </div>
</div>