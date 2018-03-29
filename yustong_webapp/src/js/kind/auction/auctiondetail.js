;(function(){
	
$(function(){
 $('#footer .saveMoney').on("click",function(event){
 	console.log('111')
 	 $('.transparent-bg').css({'display':'block'});
 	 $('#modal').animate({'bottom':'40px'});
 	 $('body').css({'overflow':"hidden"})
 	 event.stopPropagation() ;
 	  
         
 })
})	 

})(jQuery);
