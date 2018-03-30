
window.onload = function() {
	var mySwiper = new Swiper ('.swiper-container', {
    loop: true,
    autoplayDisableOnInteraction : false,
    autoplay:1500,
    pagination: '.swiper-pagination',
  })  
  
  $('#container .aBack .iconfont').bind('click',function(){
  	    console.log('1');
		window.history.back();  
	});
	
	$('#container .aMore').on('click',function(event){
		if($('#moreCon').css('display')=='none'){
			$('#moreCon').show();
		}else{
			$('#moreCon').hide();
		}
		 event.stopPropagation();
	})
	
	$(document).click(function(){
	   $('#moreCon').hide();
	});
	
	
	
	
}      
