var myScroll;
var pullUpEl; var pullUpOffset;
//iscroll 下拉刷新
function loaded(objScroll){
	pullUpEl = document.getElementById('pullUp');
	pullUpOffset = pullUpEl.offsetHeight;
	
	//myScroll = new iScroll('pjax-container', {
	myScroll = new iScroll(objScroll, {
	    checkDOMChanges: true,
	    onRefresh: function () {
	      if (pullUpEl.className.match('loading')) {
	            pullUpEl.className = '';
	            pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
	        }
	    },
	    onScrollMove: function () {
	       if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
	            pullUpEl.className = 'flip';
	            pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放加载更多...';
	            this.maxScrollY = this.maxScrollY;
	        } else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
	            pullUpEl.className = '';
	            pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
	            this.maxScrollY = pullUpOffset;
	        }
	    },
	    onScrollEnd: function () {
	      if (pullUpEl.className.match('flip')) {
	            pullUpEl.className = 'loading';
	            pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载数据中...';
	            pullUpAction();	// Execute custom function (ajax call?)
	        }
	    }
	});
}
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, {passive:false});