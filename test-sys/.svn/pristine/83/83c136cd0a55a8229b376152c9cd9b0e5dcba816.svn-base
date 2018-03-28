<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<script src="examination/questions/disrate.js"></script>
<SCRIPT>
	var results='${result}';
	var searchQues = $("#searchQues").val();
	var zTreeObj;
	var setting = {
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid",
				rootPId : "types"
			},
	    key:{
	    	url:"###"
	    }
		},
		callback : {
			onClick : function(event, treeId, treeNode) {
				$("#quesTypeList").load("QuestionsController/sonList.htm?pid=" + treeNode.wid+"&level="+treeNode.level);
			},
		}
	};
	var nodes = ${nodes};
	
	zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, nodes);
</SCRIPT>
<style type="text/css">
	.clearfix{zoom:1;}
	.clearfix:after{content:"";display:block;overflow:hidden;clear:both;}
	.groupPar{width:100%;}
	.fl{float:left;}
	.formGroup{margin-left:15px;}
</style>
<div class="btn-group col-sm-12" style="float:none;padding-left:0px;">
	<div class="groupPar clearfix">
		<div style="margin-top:6px;float:left;padding:10px;">
        <form id="searchItemForm" method="post"  style="float:left;">
            <div class="row">
                <div class="form-group" style="float:left;">
                    <div class=" input-group">
                        <!-- <span class="input-group-addon">按级别名称查找</span> -->
                        <input type="text" id="searchQues" value="${name }" name="name" style="left: 2px;" class="form-control" placeholder="按试题名称查找">
                    </div>
                </div>
                <button type="button" onclick="searchItem()" class="btn btn-success" style="float:left;width:73px;margin-left:10px;"><i class="fa fa-search"></i> 查询</button>
             </div>
        </form>
    </div>
    <div style="float:left;padding:10px;margin-top: 7px;">
    	<button type="button" onclick="addDisRate(${userWho})" class="btn btn-info"><i class="fa fa-plus"></i>添加</button>
		<button type="button" onclick="delDisRate()" class="btn btn-danger"><i class="fa fa-minus"></i> 删除</button>
		<button type="button" onclick="updateDisRate()" class="btn btn-primary"><i class="fa fa-pencil"></i> 修改</button>
		<button type="button" onclick="gongxiang()" class="btn btn-info"><i class="fa fa-search"></i>复制试题</button>
    </div>
   <div class="formGroup fl" style="float:left;padding:10px;margin-top: 7px;margin-left: 10px;">
       <button type="button" onclick="batchImport()" class="btn btn-primary fl">
           <i class="fa fa-pencil"></i> 批量导入
       </button>
	    </div>
		<div class="btnGroup fl">
			
		</div>
	    
	</div>
	<script type="text/javascript">
		
        function batchImport(){
        	var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
            var nodes = treeObj.getSelectedNodes();
            if(nodes.length == 0){//没有点击节点
                layer.msg("请选中题库分类导入");
                return;
            }
            var issuper = '${issuper}';
            if(issuper==0){
            	if(nodes[0].level==0 || nodes[0].level==1){
                    layer.msg("机构不能导入数据，请选择下面的题库分类");
                    return;
                }
            }else{
            	if(nodes[0].level==0){
                    layer.msg("机构不能导入数据，请选择下面的题库分类");
                    return;
                }
            }
            
            openDialog("examination/questions/batchImport.jsp",function(index){
                var photoCover = $("#photoCover").val();
                if(!photoCover){
                    layer.msg("请选择excel,再上传");
                }else if(photoCover.lastIndexOf(".xls")<0){//可判断以.xls和.xlsx结尾的excel
                    layer.msg("只能上传Excel文件");
                }else{
                    var url =  'QuestionsController/batchImport.htm?pid='+nodes[0].wid;
                    var formData = new FormData($('#BatchImportExcelForm')[0]);
                    addBatchImport(url,'post',formData);                }

            },"导入试题")
        }

        function addBatchImport(url,type,data){
            $.ajax({
                url : url,
                type : type,
                cache : false,
                contentType : false,
                processData : false,
                data : data,
                success : function(result) {
                    layer.msg("批量导入试题成功");
                    loadHtml(result);
                    layer.closeAll();
                },
                error : function() {
                    alert("excel上传失败,请稍后再试");
                }
            });
        }

</script>
	
</div>
    
<div class="widget">
    <div class="widget-body">
    <div class="row">
    	<div class="clearfix" style="width:16%;float:left;margin-left:5px;">
    		<div style="width:100%;">
               	 <label>部门目录</label>
	             <ul id="treeDemo" class="ztree"></ul>
	         </div>
    	</div>
    	<div id="menuTableAndQuesTypeList" style="width:83%;float:left;">
	        <div class="widget-body" id="quesTypeList" style="float:left;padding:10px;width:100%;">
	        	<div class="flip-scroll" >
		            <table class="table table-bordered table-striped table-condensed flip-content">
		                <thead class="flip-content bordered-palegreen">
		                <tr>
		                    <th width="44px;"><v:checkbox/></th>
		                    <th style="width:50%;">试题名称</th>
		                    <th>所属机构</th>
		                    <th>试题类型</th>
		                    <th>试题分类</th>
		                    <th>是否锁定</th>
		                    <!-- <th>是否共享</th> -->
		                    <th>详情</th>
		                    <th>创建时间</th>
		                </tr>
		                </thead>
		                <tbody id="tbodys">
		                
		                <c:forEach items="${list}" var="Questions">
		                    <tr>
		                        <td><v:checkbox value="${Questions.id}"/></td>
		                        <td style="width:50%;">
			                        <c:choose>
				                        <c:when  test="${fn:contains(Questions.name,'image')}">
				                        	<img src="/${Questions.name}"  style="width: 50px;height: 50px" alt="暂无图片" onclick="open_(this)"/>
				                        </c:when >
				                        <c:otherwise>
				                        	 ${Questions.name }
				                        </c:otherwise>
		                        	</c:choose>
		                        </td>
		                        <td>${Questions.typeName}</td>
		                        <c:if test="${Questions.type==0}">
		                        	<td>单选题</td>
		                        </c:if>
		                        <c:if test="${Questions.type==1}">
		                        	<td>多选题</td>
		                        </c:if>
		                        <c:if test="${Questions.type==2}">
		                        	<td>判断题</td>
		                        </c:if>
		                        <c:if test="${Questions.attr8==0 }">
		                        	<td>未锁定</td>
		                        </c:if>
		                        <c:if test="${Questions.attr8==1 }">
		                        	<td>已锁定</td>
		                        </c:if>
		                        <td>${Questions.orgName}</td>
		                        <td><a href="javascript:xiangqing(${Questions.id},${page.page})">详情</a></td>
		                        <c:if test="${Questions.creatTime!=null && Questions.creatTime!=''}">
		                        <td>${Questions.creatTime}</td>
		                        </c:if>
		                        <c:if test="${Questions.creatTime==null || Questions.creatTime==''}">
		                        <td></td>
		                        </c:if>
		                        
		                    </tr>
		                </c:forEach>
		                </tbody>
		            </table>
	            	<input type="hidden" id="disRatePage" value="${page.page}">
	            	<v:pagination page="${page}" url="QuestionsController/getList.htm?1=1&pid=${pid}&questionName=${name}&level=${level }"></v:pagination>
	        	</div>
	        </div>
        </div>
       </div>
    </div>
</div>
<script>
	
</script>
