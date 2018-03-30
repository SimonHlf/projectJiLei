;(function(){
	$(function(){
	$('#nav .youlists #select').bind('click',function(){
		//console.log('111')
		$('#shaiX').animate({"right":'0px','display':'block',"top":'38px','overflow':'auto'})
		$('body').css({'overflow':'hidden'}); //使网页不可滚动
		
	})
	$('#shaiX .iconBox').bind('click',function(){
		$('#shaiX').animate({"right":'-400px','display':'none',"top":'38px','overflow':'auto'})
		$('body').css({'overflow':'auto'});
	})
	
	

})
	
})(jQuery);