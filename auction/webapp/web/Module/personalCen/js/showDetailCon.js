function getId(id){
	return document.getElementById(id);
}
function bigTabSwitch(showObj){
	$(".yongjinListNav li").each(function(i){
		$(this).click(function(){
			$(this).addClass("active").siblings().removeClass("active");
			$("." + showObj).hide().eq(i).show();
			if(i == 0){
				if($("#ulListCon1 li").length != 0){
					showDetailCon('ulListCon1','firstTab');
				}
			}else if(i == 1){
				if($("#ulListCon li").length != 0){
					showDetailCon('ulListCon','secondTab');
				}
			}
		});
	});
}
function showDetailCon(parObj,options){
	var oList=document.getElementById(parObj);
	var aLi=oList.getElementsByTagName("a");
	for(var i=0;i<aLi.length;i++){
		aLi[i].index=i;
		aLi[i].onclick=function(){
			for(var i=0;i<aLi.length;i++){
				if(i!=this.index){
					if(options == "firstTab"){
						$(".innerDetailCon").eq(i).slideUp();
						aLi[i].className='';
					}else if(options == "secondTab"){
						$(".innerDetailConTwo").eq(i).slideUp();
						aLi[i].className='';
					}
				}
			}
			if( this.className == '' ){
				if(options == "firstTab"){
					$(".innerDetailCon").eq(this.index).slideDown();
					this.className = 'active';
				}else if(options == 'secondTab'){
					$(".innerDetailConTwo").eq(this.index).slideDown();
					this.className = 'active';
				}
			} else {
				if(options == "firstTab"){
					$(".innerDetailCon").eq(this.index).slideUp();
					this.className = '';
				}else if(options == 'secondTab'){
					$(".innerDetailConTwo").eq(this.index).slideUp();
					this.className = '';
				}
			}
		}
	}
}