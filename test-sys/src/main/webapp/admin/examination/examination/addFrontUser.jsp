<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<style type="text/css">
.layui-layer-page .layui-layer-content{
	overflow-x:hidden;
}
.widget{position:relative;}
.treePar{width:100%;
	position:absolute;left:0px;top:-4px;
	border:1px solid #ccc;
	display:none;
	z-index:15;
	background:#fff;
}
.stuPar{width:100%;}
.stuPar .sonRow{
	width:45%;
	float:left;
	/*background:red;*/
}
.stuPar .sonRow:first-child{float:left;}
.stuPar .sonRow:last-child{float:right;}
.comCheckInp{opacity:1 !important;left:12px !important; top:2px;}
.selJigou{
	width:70px;
	height:30px;
	line-height:30px;
	color:#333;
	text-align:center;
	cursor:pointer;
	position:absolute;
	left:50%;
	margin-left:-35px;
	top:-3px;
	background:url('${pageContext.request.contextPath}/images/addCatagBg.png') no-repeat;
	color:#fff;
}
.comFixBtn{
	width:64px;
	height:30px;
	position:absolute;
	left:50%;
	margin-left:-32px;
	top:50%;
	cursor:pointer;
	display:none;
}
.addBtn{
	background:url('${pageContext.request.contextPath}/images/add.png') no-repeat left bottom;
	margin-top:0px;
}
.delBtn{
	background:url('${pageContext.request.contextPath}/images/del1.png') no-repeat left bottom;
	margin-top:36px;
}
</style>
<div class="widget">
	<div id="menuContent" class="treePar">
        <ul id="menuTree" class="ztree"></ul>
    </div>
    <span id="menuSpan" class="selJigou">选择目录</span>
    <span onclick="addDeLPeople('add')" class="comFixBtn addBtn ">添加考生</span>
    <span onclick="addDeLPeople('del')" class="comFixBtn delBtn">删除考生</span>
    <div class="stuPar clearfix">
        <div class="sonRow">
            <div id="menuTable"></div>
        </div>
        <div class="sonRow">
            <div id="selMenuTable"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
	function addDeLPeople(options){
		var noCheckBody = document.getElementById("noCheckBody");
		var hasCheckBody = document.getElementById("checkTobody");
		if($("#noCheckBody tr").length != 0){
			var noCheckTr = document.getElementById("noCheckBody").getElementsByTagName("tr");
		}
		if($("#checkTobody tr").length != 0){
			var hasCheckTr = document.getElementById("checkTobody").getElementsByTagName("tr");
		}
		var tmpArr = [];
		var tmpTrArr = [];	
		if(options == 'add'){//左到右
			for(var i=0;i<noCheckTr.length;i++){
				var inputObj = noCheckTr[i].getElementsByTagName("input")[0];
				if(inputObj.checked == true){
					inputObj.name = 'hasCheckBox'
					tmpArr.push(inputObj.parentNode.parentNode.innerHTML);
					var tr=inputObj.parentNode.parentNode;
					tmpTrArr.push(tr.id);
				}
			}
		}else{//右到左
			for(var i=0;i<hasCheckTr.length;i++){
				var inputObj = hasCheckTr[i].getElementsByTagName("input")[0];
				if(inputObj.checked == true){
					inputObj.name = 'noCheckBox'
					tmpArr.push(inputObj.parentNode.parentNode.innerHTML);
					var tr=inputObj.parentNode.parentNode;
					tmpTrArr.push(tr.id);
				}
			}
		}
		for(var i=0;i<tmpTrArr.length;i++){ 
			$("#" + tmpTrArr[i]).remove();
			$("#sellAll_has").attr("checked",false);
			$("#sellAll_no").attr("checked",false);
		}
		for(var i=0;i<tmpArr.length;i++){
			var objTr = document.createElement("tr");
			objTr.id = tmpTrArr[i];
			objTr.innerHTML = tmpArr[i];
			if(options == "add"){
				$("#checkTobody").append(objTr);
			}else{
				noCheckBody.appendChild(objTr);
			}
		}

	}
	function selectAll(options){
		var allSellNo = document.getElementById('sellAll_no'); 
		var noCheckBox = document.getElementsByName("noCheckBox");  
		
		var allSellHas = document.getElementById('sellAll_has'); 
		var hasCheckBox = document.getElementsByName("hasCheckBox");  
		if(options == 'noHas'){
	        if(allSellNo.checked==true){
	            for(var i=0;i<noCheckBox.length;i++){  
	            	noCheckBox[i].checked=true;  
	            }  
	        }else{  
	            for(var j=0;j<noCheckBox.length;j++){  
	            	noCheckBox[j].checked=false;  
	            }  
	        }  
		}else{
			if(allSellHas.checked==true){
	            for(var i=0;i<hasCheckBox.length;i++){  
	            	hasCheckBox[i].checked=true;  
	            }  
	        }else{  
	            for(var j=0;j<hasCheckBox.length;j++){  
	            	hasCheckBox[j].checked=false;  
	            }  
	        }  
		}
	}
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
               var level = treeNode.level; 
                if(treeNode.pid != 0){
                    $("#menuTable").load("ExaminationController/newFrontUserTable.htm?orgId="+treeNode.id+"&cmd="+${cmd}+"&level="+level+"&examId="+${examId});
                    $("#selMenuTable").load("ExaminationController/selMenuTable.htm?orgId="+treeNode.id+"&cmd="+${cmd}+"&level="+level+"&examId="+${examId});
                	$(".comFixBtn").show();
                }
                hideMenu();
            }
        }
    };
    
    var obj=null;
    function showTreeMenu(){
    	$(document).on('click',"#menuSpan",function(){
    		obj = this;
    		//var index = $(this).parents("tr").index();
    		$("#menuContent").show();
    		$(document).bind("mousedown", onBodyDown);
    	})
    }
    function hideMenu() {
    	$("#menuContent").css({display:"none"});
    	$(document).unbind("mousedown", onBodyDown);
    }
    function onBodyDown(event) {
    	if (!(event.target.id == "menuSpan" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
    		hideMenu();
    	}
    }
    var nodes = ${nodes};
    $(function(){
        zTreeObj = $.fn.zTree.init($("#menuTree"), setting, nodes);
        showTreeMenu();
    })
</script>