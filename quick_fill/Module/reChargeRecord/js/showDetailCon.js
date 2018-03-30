function showDetailCon(){
	var oList=document.getElementById("ulList");
	var aLi=oList.getElementsByTagName("li");
	for(var i=0;i<aLi.length;i++){
		aLi[i].index=i;
		aLi[i].onclick=function(){
			for(var i=0;i<aLi.length;i++){
				if(i!=this.index){
					$(".detailDiv").eq(i).slideUp();
					$(".triBg").eq(i).removeClass("botTriBg");
					aLi[i].className='';
				}else{
					$(".triBg").eq(i).addClass("botTriBg");
				}
			}
			if( this.className == '' ){
				$(".detailDiv").eq(this.index).slideDown();
				$(".triBg").eq(this.index).addClass("botTriBg");
				this.className = 'active';
			} else {
				$(".detailDiv").eq(this.index).slideUp();
				$(".triBg").eq(this.index).removeClass("botTriBg");
				this.className = '';
			}
		}
	}
}