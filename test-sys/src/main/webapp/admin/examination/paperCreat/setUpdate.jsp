<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<link href="assets/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/admin/examination/paperCreat/commonPaperSet.css" rel="stylesheet" />
<style type="text/css">
	.addNewBtn{
		background:url(${pageContext.request.contextPath}/images/addPic.png) no-repeat;
	}
	.delIcon{
		background:url(${pageContext.request.contextPath}/images/del.png) no-repeat;
	}
</style>
<div class="widget model_widget">
    <div class="widget-body">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="updateDisrelationshipForm">
                <div >
                	<input type="hidden" id="results" value="${result}"/>
                	<input type="hidden" id="setPaperid" name="id" value="${paperSet.id}" />
                	<div class="form-group">
                		<label class="col-sm-2 control-label no-padding-right">所属机构:</label>
                     	<div class="col-sm-3">
                            <input class="form-control" readonly="readonly" id="orgName" value="${orgName}" name="orgName"  required>
                        </div>
                	</div>
                	<div class="form-group">
                		
                     	<label class="col-sm-2 control-label no-padding-right">试卷名:</label>
                     	<div class="col-sm-3">
                            <input class="form-control" readonly="readonly" id="paperName" value="${paperName}" name="paperName"  required>
                        </div>
                	</div>
                	<c:if test="${isSets==0}">
	                	<div class="form-group relDiv">
	                		<label class="col-sm-2 control-label no-padding-right">试题设置：</label>
	                		<table id="listQuesTable" class="table table-bordered table-striped table-condensed flip-content setTable" style="width:70%;">
	                                <thead class="flip-content bordered-palegreen tHdHei">
	                                    <tr>
	                                        <th>分类</th>
	                                        <th>单选题</th>
	                                        <th>多选题</th>
	                                        <th>判断题</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="tbBody">
	                                    <c:forEach varStatus="index" items="${paperSetNumList}" var="paperSetNum">
	                                    	<tr>
		                                        <td class="menuTd">
		                                        	<input type="text" class="selQues" readonly id="${paperSetNum.quesTypeId}" name="" value="${paperSetNum.name}"/>
		                                        	<span class="triSpan"></span>
		                                        </td>
		                                        <td><input type="text" class="quesInpNum singleInp" onblur="checkPattern(this,'calScore')"  value="${paperSetNum.danxuanNum}"/><span>道</span><em type="singEm">共<i>${paperSetNum.typeDanxuanNum}</i>道</em></td>
		                                        <td><input type="text" class="quesInpNum multiInp" onblur="checkPattern(this,'calScore')" value="${paperSetNum.duoxuanNum}"/><span>道</span><em type="multiEm">共<i>${paperSetNum.typeDuoxuanNum}</i>道</em></td>
		                                        <td><input type="text" class="quesInpNum judgeInp" onblur="checkPattern(this,'calScore')" value="${paperSetNum.panudanNum}"/><span>道</span><em type="judgeEm">共<i>${paperSetNum.typePanduanNum}</i>道</em></td>
		                                    	<c:if test="${index.index  >= 1}">
		                                    		<td class='specTd' onclick='clearQuesTr(this)'><i class='delIcon'></i></td>
		                                    	</c:if>
		                                    </tr>	
	                                    </c:forEach>
	                                </tbody>
	                         </table>
	                         <div id="menuContent" class="selPatternDiv menuContent">
	                         	<ul id="productDefTree" class="ztree"></ul>
	                         </div>
	                         <div class="addTrBtn" style="width:60%;margin-left:156px;" onclick="addNewTr()">
	                         	<a class="addNewBtn" href="javscript:void(0)"></a>
	                         </div>
		                </div>
	                </c:if>
	                <c:if test="${isSets==1}">
                		<!-- 手动显示单选多选判断题的总数量 -->
                		<div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">单选题共</label>
	                     	<div class="col-sm-3">
	                            <input class="form-control" id="totalSingNum" disabled value="${danxuanNum}" required>
	                        </div>
	                        <div class="col-sm-4 comNoteTxt">道</div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">多选题共</label>
	                     	<div class="col-sm-3">
	                            <input class="form-control" id="totalMultiNum" disabled value="${duoxuanNum}" required>
	                        </div>
	                        <div class="col-sm-4 comNoteTxt">道</div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">判断题共</label>
	                     	<div class="col-sm-3">
	                            <input class="form-control" id="totalJudgeNum" disabled value="${panduanNum}" required>
	                        </div>
	                        <div class="col-sm-4 comNoteTxt">道</div>
	                    </div>
                	</c:if>
                     <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">单选题分值</label>
                     	<div class="col-sm-3">
                            <input class="form-control" id="singScoreInp"  name="attr6" onblur="checkPattern(this,'calScore')" value="${paperSet.attr6}" placeholder="每题分值" required>
                        </div>
                        <div class="col-sm-2 comNoteTxt">分/道</div>
                    </div>
                    <div class="form-group">
                    	<label class="col-sm-2 control-label no-padding-right" width='50'>多选题</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="multiScoreInp" onblur="checkPattern(this,'calScore')" name="attr7" value="${paperSet.attr7}" placeholder="每题分值" required>
                        </div>
                        <div class="col-sm-2 comNoteTxt">分/道</div>
                    
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">判断题</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="judgeScoreInp" onblur="checkPattern(this,'calScore')" name="attr8" value="${paperSet.attr8}" placeholder="每题分值" required>
                        </div>
                        <div class="col-sm-2 comNoteTxt">分/道</div>
                    </div>
                   
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">达标分数线</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="scoreInp" name="paperLine" onblur="setTotalScore(this)" value="${paperSet.paperLine}" placeholder="达标分数线" required>
							<input type="hidden" id="paperTotail" name="paperTotail">
						</div>
                        <div class="col-sm-2 comNoteTxt">
                        	<span style="margin-right:10px;">分数</span>
                        	<span id="totalSpan"></span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">考试时间限制</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="examTime" name="examTime"  onblur="checkPattern(this,'noScore')"  value="${paperSet.examTime}" placeholder="考试时间限制，单位：分钟" required>
                        </div>
                         <div class="col-sm-2 comNoteTxt">分钟</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">允许考试次数</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="examUse" name="examUse" onblur="checkPattern(this,'noScore')"  value="${paperSet.examUse}" placeholder="重复考试次数" required>
                        </div>
                        <div class="col-sm-2 comNoteTxt">次</div>
                    </div>
            		<input id="fenye" type="hidden" value="${page}" />
            		<input id="paperCreatId" type="hidden" value="${paperCreatId}"/>
            		<input id="isSets" type="hidden"value="${isSets}"/>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="assets/zTree_v3/js/jquery.ztree.all.js"></script>
<script>
var hander_sing = '${danxuanNum}';
var hander_multi = '${duoxuanNum}';
var hander_judge = '${panduanNum}';
$(function(){
	if($("#isSets").val() == 0){
		var nodes3 = JSON.parse('${nodes}');
		console.log(nodes3)
		showTreeMenu();
		$.fn.zTree.init($("#productDefTree"), setting3, nodes3);
	}
})
</script>