;(function(){
$(function(){
	new BaiduMap({
				id: "container2",
				title: {
					text: "北京故宫博物院",
					className: "title"
				},
				content: {
					className: "content",
					text: ["地址：北京市东城区东华门大街", "电话：(010)65131892"]
				},
				point: {
					lng: "116.412222",
					lat: "39.912345"
				},
				level: 15,
				zoom: true,
				type: ["地图", "卫星", "三维"],
				width: 320,
				height: 70,
				icon: {
					url: "../../image/about/icon.png",
					width: 36,
					height: 36
				}
			});
 
 
 
 
})	 

})(jQuery);