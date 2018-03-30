//toast提示信息
function toast(msg){
    setTimeout(function(){
        document.getElementsByClassName('toast-wrap')[0].getElementsByClassName('toast-msg')[0].innerHTML=msg;
        var toastTag = document.getElementsByClassName('toast-wrap')[0];
        toastTag.className = toastTag.className.replace('toastAnimate','');
        setTimeout(function(){
            toastTag.className = toastTag.className + ' toastAnimate';
        }, 100);
    },500);
}
/*
	<div class="toast-wrap">
        <span class="toast-msg"></span>
     </div> 
*/
//失败提示层
/*function showAlert(obj){
	var cliHei = $(window).height();
	$(".layer").show().animate({"opacity":1},200,function(){
		$(obj).show().css({"top":parseInt((cliHei - $(obj).height())/2)});
	});
}*/
//展示带有input文本框的弹窗
function comEditShowAlert(obj){
	var cliHei = $(window).height();
	$(".layer").show().animate({"opacity":1},200,function(){
		$("." + obj).show().css({"top":parseInt((cliHei - $("." + obj).height())/2)});
	});
}
function showAlert(This,obj,inpHidObj,reginAreaObj,flag){
	var cliHei = $(window).height();
	if(flag = true){
		$("#" + inpHidObj).val($(This).next().val());
		$("#" + reginAreaObj).val($(This).prev().html());
	}
	$(".layer").show().animate({"opacity":1},200,function(){
		$("." + obj).show().css({"top":parseInt((cliHei - $("." + obj).height())/2)});
	});
}
//确定关闭失败提示层
function closeAlert(obj){
	$(obj).hide();
	$(".layer").animate({"opacity":0},200,function(){
		$(".layer").hide();
	})
}
//iscroll
function wrapScroll(wrapObj){
    myScroll = new iScroll(wrapObj, {
        checkDOMChanges: true,
        vScrollbar:false,
        hScrollbar : false
    });
}
//loading
/*<div class="loadingDiv">
	<div class="loadEffect">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
	</div>
	<p>正在加载...</p>
</div>*/