;(function(){
	$(function(){
		
	$('#scroller #iconfont').on('click',function(event){
		$('.transparent-bg').css({'display':'block'})
		$('.shadowBox').animate({'bottom':'40px'});
		$('body').css({'overflow':'hidden'});
		event.stopPropagation();
	})
	$(document).click(function(){
		$('.transparent-bg').css({'display':'none'})
		$('.shadowBox').animate({'bottom':'-300px'});
		$('body').css({'overflow':'auto'});
	})
	
//  var myscroll = new iScroll("wrapper", {
//      onScrollMove: function () { //拉动时
//          //上拉加载
//          if (this.y < this.maxScrollY) {
//              $("#main .loadMore").html("释放加载");
//              $(".loadMore").addClass("loading");
//          } else {
//              $(".loadMore").html("上拉加载");
//              $(".loadMore").removeClass("loading");
//          }
//      },
//      onScrollEnd: function () { //拉动结束时
//          //上拉加载
//          if ($(".loadMore").hasClass('loading')) {
//              $(".loadMore").html("加载中...");
//              pullOnLoad();
//          }
//      }
////        onRefresh: function () {
////            $('.pull-loading').html("上拉加载");
////        }
//  });
//  //上拉加载函数,ajax
//  var num = 0;
//  var page = 4; //每次加载4条
//  function pullOnLoad() {
//      setTimeout(function () {
//          /*$.ajax({
//              url: "json/data.json",
//              type: "get",
//              dataType: 'json',
//              success: function (data) {
//                  var data_length = data.length;//数据的总长度
//                  var remainder = data_length % page;//余数
//                  if ( data_length >= (num+page)){
//                      for (var j = num; j < num + page; j++){
//                          var text = data[j].text;
//                          $("#scroller ul").append("<li>"+ text +"</li>");
//                      }
//                      num+=page;
//                  }else if (remainder != 0 && data_length-num == remainder){
//                      for (var j = num; j < num + remainder; j++){
//                          var text = data[j].text;
//                          $("#scroller ul").append("<li>"+ text +"</li>");
//                      }
//                      num+=page;
//                  }else{
//                      $('.pull-loading').html("没有了哟");
//                  }
//                  myscroll.refresh();
//              },
//              error: function () {
//                  console.log("出错了");
//              }
//          });*/
//
//          for (var j = 0; j < 4; j++){
//              $("#scroller .").append("<p>老夫聊发少年狂，不小心，选错行。误入IT，两眼泪茫茫</p>");
//          }
//          myscroll.refresh();
//
//      }, 1000);
//  }


//	   var oDiv = document.getElementsByClassName('detailCon');
//	   var divT = oDiv.offsetTop;
//	   //console.log(divT);
//	   window.onscroll = function() {
//	    // 获取当前页面的滚动条纵坐标位置 （依次为火狐谷歌、safari、IE678）
//	    var scrollT = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
//	    if (scrollT >= divT) {
//	     if (window.navigator.userAgent.indexOf('MSIE 6.0') != -1) {
//	      // 兼容IE6代码
//	      oDiv.style.position = 'absolute';
//	      oDiv.style.top = scrollT+39 + 'px';
//	      oDiv.style.left = 0 + 'px';
//	     } else { 
//	      // 正常浏览器代码
//	      oDiv.style.position = 'fixed';
//	      oDiv.style.top = 39;
//	      oDiv.style.left = 0;
//	     }
//	    } else
//	     oDiv.style.position = '';
//	   }
	
//
//	refreshEnd= false;
//	times=0;//加载次数
//	oriSpeed=300
//  var swiper = new Swiper('.swiper-container',{
//		speed: oriSpeed,
//		slidesPerView: 'auto',
//		freeMode: true,
//      direction: 'vertical',
//		setWrapperSize: true,
//		scrollbar: {
//          el: '.swiper-scrollbar',
//      },
//		on:{
//			//下拉释放刷新
//			touchEnd: function(){
//				swiper=this
//				refreshText=swiper.$el.find('.refresh')
//              if(this.translate>100){
//	                swiper.setTransition(this.params.speed);
//                  swiper.setTranslate(100);
//		            swiper.touchEventsData.isTouched=false;//跳过touchEnd事件后面的跳转(4.0.5)
//		            refreshText.html('刷新中')
//					
//		            swiper.allowTouchMove=false;
//					setTimeout(function(){//模仿AJAX
//						swiper.removeAllSlides();
//						for(i=0;i<20;i++){
//						swiper.appendSlide('<div class="swiper-slide">New Slide'+(i+1)+'</div>');
//						refreshText.html('刷新完成');
//						refreshEnd=true;
//						swiper.allowTouchMove=true;
//						}
//					},1000)
//					
//               }
//				 
//          },
//			touchStart: function(){
//				if(refreshEnd==true){
//                  this.$el.find('.refresh').html('释放刷新');
//					refreshEnd=false;
//				}
//          },
//			
//			//加载更多
//			momentumBounce: function(){//非正式反弹回调函数，上拉释放加载更多可参考上例
//				swiper=this
//				//slidesheight=0;
//				//for(h=0;h<swiper.slides.length;h++){
//				//	slidesheight+=swiper.slides[h].offsetHeight;
//				//}
//				//endTranslate=this.height-slidesheight-20
//				//if(this.translate < endTranslate){}
//				if(swiper.translate<-100){
//		
//					swiper.allowTouchMove=false;//禁止触摸
//					swiper.params.virtualTranslate=true;//定住不给回弹
//                  setTimeout(function(){//模仿AJAX
//					    for(m=0;m<20;m++){
//					        swiper.appendSlide('<div class="swiper-slide">moreSlide'+(times*20+m+1)+'</div>');	
//						}
//						swiper.params.virtualTranslate=false;
//						swiper.allowTouchMove= true;
//						times++
//				    },1000)
//					
//				}
//			},
//		}
//	});

  

})
	
})(jQuery);