<%@page pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<style type="text/css">
.widget-body{display:none;opacity:0;}
.widget{position:relative;}
input[type=checkbox], input[type=radio]{opacity:1 !important;left:25px !important; top:1px;},    input[type=checkbox]{opacity:1 !important;left:25px !important; top:1px;}
#tikuDiv{width:100%;min-height:100px;position:absolute;left:0;top:-3px;display:none;border:1px solid #ccc; background:#fff;z-index:15;}
.firstTree{margin-right:20px;float:left;}
#menuTable{float:left;}
.addQuesTree{position:absolute;right:0;top:0px;
	width:100px;height:34px;line-height:34px;background:#2dc3e8;text-align:center;color:#fff;}
.addQuesTree:hover{text-decoration:none;color:#fff;background:#2aadce;}
.nowTikuP{display:none;font-size:16px;color:#333;margin:5px 0 10px 0;}
.comTitP{height:35px;line-height:35px;background:#cee8ef;color:#000;text-indent:12px;font-size:16px;}
.tiganDiv,.optionsDiv,.answerDiv{position:relative;margin-bottom:20px;}
.setImgPar{position:absolute;line-height:27px;right:0px;top:3px;}
.setImgPar span,.setImgPar div.radio{float:left;}  div.checkbox{float:left;}
.setImgPar div.radio{width:50px;padding-top:0px  !important;}
.setImgPar div.checkbox{width:50px;padding-top:0px  !important;}
.setImgPar div.radio label{width:100%;display:inline-block;text-indent:20px;}
.setImgPar div.checkbox label{width:100%;display:inline-block;text-indent:20px;}
.form-horizontal .control-label{text-align:left !important;}
</style>
<script type="text/javascript">
var issuper = '${issuper}';
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
        	if(issuper==0){
        		if(treeNode.level==0 || treeNode.level==1){
        			layer.msg("请选择题库分类添加试题(节点3级)");
        			return;
        		}else{
        			$(".nowTikuP").show();
    				$("#sttype").val(treeNode.wid);
    				$("#sttype1").val(treeNode.wid);
    				$("#nowTiku").html(treeNode.name)
    				hideMenu();
        		}
        	}else{
        		if(treeNode.level==0){
        			layer.msg("请选择题库分类添加试题(节点2级)");
        			return;
        		}else{
        			$(".nowTikuP").show();
    				$("#sttype").val(treeNode.wid);
    				$("#sttype1").val(treeNode.wid);
    				$("#nowTiku").html(treeNode.name)
    				hideMenu();
        		}
        	}
        		
        },
    }
};

var obj=null;
function showTreeMenu(){
	$(document).on('click',"#menuSpan",function(){
		obj = this;
		$("#tikuDiv").show();
		$(document).bind("mousedown", onBodyDown);
	})
}
function hideMenu() {
	$("#tikuDiv").css({display:"none"});
	$(document).unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuSpan" || event.target.id == "tikuDiv" || $(event.target).parents("#tikuDiv").length>0)) {
		hideMenu();
	}
}
$(function(){
	var nodes = ${nodes};
	$.fn.zTree.init($("#menuTree"), setting, nodes);
	showTreeMenu();
	tabSwitch();
});
function tabSwitch(){
	$("#myTab li").each(function(i){
		$(this).click(function(){
			$("#myTab li").removeClass("active");
			$(this).addClass("active");
			$("#nowTypeQues").val($(this).attr("typeId"));
			if(i == 0 || i== 1){
				$("#singMultiDiv").show().animate({"opacity":1});
				$("#judgeDiv").hide().animate({"opacity":0});;
				
				if(i==0){
					var str = "<div class='radio'><label><input type='radio' name='answer'  value='A' checked>A</label></div>"+
							  "<div class='radio'><label><input type='radio' name='answer'  value='B'>B</label></div>"+
							  "<div class='radio'><label><input type='radio' name='answer'  value='C'>C</label></div>"+
							  "<div class='radio'><label><input type='radio' name='answer'  value='D'>D</label></div>";
					$("#danduo").html(str);
				}else if(i==1){
					var str =   "<div class='checkbox'><label><input type='checkbox' name='answer'  value='A'>A</label></div>"+
					  			"<div class='checkbox'><label><input type='checkbox' name='answer'  value='B'>B</label></div>"+
					  			"<div class='checkbox'><label><input type='checkbox' name='answer'  value='C'>C</label></div>"+
					  			"<div class='checkbox'><label><input type='checkbox' name='answer'  value='D'>D</label></div>";
					$("#danduo").html(str);
				}
			}else{
				$("#singMultiDiv").hide().animate({"opacity":0});
				$("#judgeDiv").show().animate({"opacity":1});
			}
		});
	});
}
</script>
<div class="widget model_widget">
	<ul id="myTab" class="nav nav-tabs">
	    <li typeId="0" class="active">
	        <a href="javascript:void(0)">单选题</a>
	    </li>
	    <li typeId="1">
	    	<a href="javascript:void(0)">多选题</a>
	    </li>
	    <li typeId="2">
	    	<a href="javascript:void(0)">判断题</a>
	    </li>
	</ul>
	<a id="menuSpan" class="addQuesTree" href="javascript:void(0)">添加题库目录</a>
	
    <div id="tikuDiv" class="clearfix">
    	<div id="treePar">
	         <div id="firstTree" class="firstTree">
	             <ul id="menuTree" class="ztree"></ul>
	         </div>
		    <div id="menuTable"></div>
	    </div>
    </div>
    <p class="nowTikuP">当前题库：<span id="nowTiku"></span></p>
    <div id="singMultiDiv" class="widget-body" style="display:block;opacity:1;">
        <div id="horizontal-form">
            <form class="form-horizontal" method="post" id="addDisRateForm" enctype="multipart/form-data">
            	<input id="nowTypeQues" type="hidden" name="type" value="0"/>
                <div>
                	<!-- 题干 -->
                	<div class="tiganDiv">
                		<p class="comTitP">题干</p>
                		<div class="setImgPar clearfix">
		                	<span>试题是否是图片：</span>
		                	<div class="radio">
							  <label>
							    <input type="radio" name="optionsRadios" onclick="stisPic(this)" id="optionsRadios1" value="1">
							   		 是
							  </label>
							</div>
			           		<div class="radio">
							  <label>
							    <input type="radio" name="optionsRadios" onclick="stisPic(this)" id="optionsRadios2" value="0" checked>
							   		 否
							  </label>
							</div>
						</div>
						<div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">试题名称</label>
	                        <div class="col-sm-9" id="stname">
	                            <textarea style="height:71px;margin-bottom:10px;" class="form-control" id="name" name="name" placeholder="试题名称" required></textarea>
	                       		<input type='file' style="display: none" id='headImages1' name='headImages1'  />
	                       	</div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">试题图片</label>
	                        <div class="col-sm-9" id="stname">
	                       		<input type='file' id='headImages' name='headImages'  />
	                       	</div>
	                    </div>
                	</div>
                    
                    <div class="optionsDiv">
                    	<p class="comTitP">选项</p>
                    	<div class="setImgPar clearfix">
		                	<span>选项是否是图片：</span>
		                	<div class="radio">
							  <label>
							    <input type="radio" name="optionsRadiosA" onclick="daA(this);" id="optionsRadiosA1" value="1">
							   		 是
							  </label>
							</div>
			           		<div class="radio">
							  <label>
							    <input type="radio" name="optionsRadiosA" onclick="daA(this);" id="optionsRadiosA2" value="0" checked>
							   		 否
							  </label>
							</div>
						</div>
						<div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">选项A</label>
	                        <div class="col-sm-10" id="daA">
	                            <textarea style="height:71px;" class="form-control" id="optionA" name="optionA" placeholder="选项A" required></textarea>
	                            <input type='file' style="display: none" id='stnameA' name='headImagesA' />
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">选项B</label>
	                        <div class="col-sm-10" id="daB">
	                            <textarea style="height:71px;" class="form-control" id="optionB" name="optionB" placeholder="选项B" required></textarea>
	                            <input type='file' style="display: none" id='stnameB' name='headImagesB' />
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">选项C</label>
	                        <div class="col-sm-10" id="daC">
	                            <textarea style="height:71px;" class="form-control" id="optionC" name="optionC"  placeholder="选项C" required></textarea>
	                            <input type='file' style="display: none" id='stnameC' name='headImagesC' />
	                        </div>
	                    </div>
	                     <div class="form-group">
	                        <label class="col-sm-2 control-label no-padding-right">选项D</label>
	                        <div class="col-sm-10" id="daD">
	                            <textarea style="height:71px;" class="form-control" id="optionD" name="optionD"  placeholder="选项D" required></textarea>
	                            <input type='file' style="display: none" id='stnameD' name='headImagesD' />
	                        </div>
	                    </div>
                    </div>
                    <!-- 选项 -->
                    <div class="answerDiv">
                    	<p class="comTitP">正确答案</p>
                    	<div class="form-group">
                        	<div class="setImgPar clearfix" id="danduo" style="left:85px;">
	                        	<div class="radio">
								  <label>
								    <input type="radio" name="answer"  value="A" checked>
								   		 A
								  </label>
								</div>
				           		<div class="radio">
								  <label>
								    <input type="radio" name="answer" value="B" >
								   		 B
								  </label>
								</div>
								<div class="radio">
								  <label>
								    <input type="radio" name="answer"  value="C" >
								   		 C
								  </label>
								</div>
				           		<div class="radio">
								  <label>
								    <input type="radio" name="answer" value="D" >
								   		 D
								  </label>
								</div>
							</div>
	                            <!-- <input class="form-control" id="answer" name="answer" placeholder="正确答案" required> -->
	                    </div>
                    </div>
                   	<div class="form-group">
                        <div class="col-sm-9">
                            <input type="hidden" value="" name="quesId" id="sttype" placeholder="课题目录" required />
                        </div>
                    </div>
                   <div class="widget-buttons" style="display:inherit;text-align:center;">
                		<button type="button" onclick="yes()" class="btn btn-info btn-ok"> 确认</button>
                		<button type="button" onclick="fanhui()" class="btn btn-default"> 返回</button>
            	   </div>
                </div>
            </form>
        </div>
    </div>
    <div id="judgeDiv" class="widget-body">
    	  <form class="form-horizontal" method="post" id="addDisRateForm1" style="margin-top:40px;">
    	  		<input id="nowTypeQues" type="hidden" name="type" value="2"/>
                    <div class="form-group" style="position:relative;">
                    	<div class="setImgPar clearfix" style="top:-42px;left:15px;">
			                	<span>试题是否是图片：</span>
			                	<div class="radio">
								  <label>
								    <input type="radio" name="optionsRadios" onclick="stisPic1(this)" id="optionsRadios1" value="1">
								   		 是
								  </label>
								</div>
				           		<div class="radio">
								  <label>
								    <input type="radio" name="optionsRadios" onclick="stisPic1(this)" id="optionsRadios2" value="0" checked>
								   		 否
								  </label>
								</div>
						</div>
                        <label class="col-sm-2 control-label no-padding-right">试题题目</label>
                        <div class="col-sm-9" id="panduan">
                            <textarea style="height:71px;margin-bottom:10px;" class="form-control" id="name" name="name" placeholder="试题题目" required></textarea>
                        	<input type='file' style="display: none" id='stname2' name='headImages1' />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">试题图片</label>
                        <div class="col-sm-9">
                            <input  type="file" id="headImages" name="headImages" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label no-padding-right">正确答案</label>
                        <div class="col-sm-9">
							<select name="answer">
								<option value="0">正确</option>
								<option value="1">错误</option></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9">
							<input type="hidden" value="" name="quesId" id="sttype1" placeholder="课题目录" required />
                        </div>
                    </div>
                   <div class="widget-buttons"  style="display:inherit;text-align:center;">
                		<button type="button" onclick="yes1()" class="btn btn-info btn-ok">确认</button>
                		<button type="button" onclick="fanhui()" class="btn btn-default">返回</button>
            	   </div>
            </form>
    </div>
</div>
<script>
$("#headImages").change(function (e) {
	
	var file, img;
	if ((file = this.files[0])) {
		
		fileSize=file.size;
	}
	if (fileSize > 0) {
	    
		if (fileSize> 2*1024*1024) {
			layer.msg("图片大小不能超过2M");
	       var files = document.getElementById("headImages");
	       files.value="";
		}
	}
	
	});
	
	
	function stisPic(obj){
		if(obj.value==0){
			$("#stname").html("<textarea style='height:71px;' class='form-control' id='name' name='name' placeholder='试题名称' required></textarea>");
		}else{
			$("#stname").html("<input type='file' id='stname1' name='headImages1' required />");
		}
	}
	
	function daA(obj){
		if(obj.value==0){
			$("#daA").html("<textarea style='height:71px;' class='form-control' id='optionA' name='optionA' placeholder='答案A' required></textarea>");
			$("#daB").html("<textarea style='height:71px;' class='form-control' id='optionB' name='optionB' placeholder='答案B' required></textarea>");
			$("#daC").html("<textarea style='height:71px;' class='form-control' id='optionC' name='optionC' placeholder='答案C' required></textarea>");
			$("#daD").html("<textarea style='height:71px;' class='form-control' id='optionD' name='optionD' placeholder='答案D' required></textarea>");
		}else{
			$("#daA").html("<input type='file' id='stnameA' class='form-control' name='headImagesA' placeholder='答案A' required />");
			$("#daB").html("<input type='file' id='stnameB' class='form-control' name='headImagesB' placeholder='答案B' required />");
			$("#daC").html("<input type='file' id='stnameC' class='form-control' name='headImagesC' placeholder='答案C' required />");
			$("#daD").html("<input type='file' id='stnameD' class='form-control' name='headImagesD' placeholder='答案D' required />");
		}
	}
	
	
	$("#stname1").change(function (e) {
		
		var file, img;
		if ((file = this.files[0])) {
			
			fileSize=file.size;
		}
		if (fileSize > 0) {
		    
			if (fileSize> 2*1024*1024) {
				layer.msg("图片大小不能超过2M");
		       var files = document.getElementById("headImages1");
		       files.value="";
			}
		}
		
		});
	
	$("#stnameA").change(function (e) {
		
		var file, img;
		if ((file = this.files[0])) {
			
			fileSize=file.size;
		}
		if (fileSize > 0) {
		    
			if (fileSize> 2*1024*1024) {
				layer.msg("图片大小不能超过2M");
		       var files = document.getElementById("headImagesA");
		       files.value="";
			}
		}
		
		});
	
	$("#stnameB").change(function (e) {
		
		var file, img;
		if ((file = this.files[0])) {
			
			fileSize=file.size;
		}
		if (fileSize > 0) {
		    
			if (fileSize> 2*1024*1024) {
				layer.msg("图片大小不能超过2M");
		       var files = document.getElementById("headImagesB");
		       files.value="";
			}
		}
		
		});
	
	$("#stnameC").change(function (e) {
		
		var file, img;
		if ((file = this.files[0])) {
			
			fileSize=file.size;
		}
		if (fileSize > 0) {
		    
			if (fileSize> 2*1024*1024) {
				layer.msg("图片大小不能超过2M");
		       var files = document.getElementById("headImagesC");
		       files.value="";
			}
		}
		
		});
	
	$("#stnameD").change(function (e) {
		
		var file, img;
		if ((file = this.files[0])) {
			
			fileSize=file.size;
		}
		if (fileSize > 0) {
		    
			if (fileSize> 2*1024*1024) {
		       layer.msg("图片大小不能超过2M");
		       var files = document.getElementById("headImagesD");
		       files.value="";
			}
		}
		
		});
	
	function stisPic1(obj){
		if(obj.value==0){
			$("#panduan").html("<textarea style='height:71px;' class='form-control' id='name2' name='name' placeholder='试题名称' required></textarea>");
		}else{
			$("#panduan").html("<input type='file' id='stname2' name='headImages1' required />");
		}
	}
</script>