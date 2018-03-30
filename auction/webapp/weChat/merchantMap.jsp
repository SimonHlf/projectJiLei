<%@ page language="java" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>商家帮-附近商家</title>
    <script src="../weChat/js/jweixin-1.2.0.js"></script>
    <script src="../weChat/js/jquery.min.js"></script>
    <title></title>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }
        body,
        button,
        input,
        select,
        textarea {
            font: 12px/16px Verdana, Helvetica, Arial, sans-serif;
        }
        html, body{
            width:100%;
            height:90%;
        }

    </style>
    <script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>

</head>

<body>
<input type="hidden" id="longitude" value="${longitude }">
<input type="hidden" id="latitude" value=${latitude }>
<input type="hidden" id="mapList" value=${merchantInfoList }>
<script>
$(function(){
	var bd_lat=$("#latitude").val();
	var bd_lon=$("#longitude").val();
	$.ajax({
		method : 'post',
		url : 'getmerchantMapList.htm',
		data :{latitude:bd_lat,longitude:bd_lon},
		success : function(data) {
			// data=eval("("+data+")");
			if(data.length>0){
				var bd_lat=$("#latitude").val();
		    	var bd_lon=$("#longitude").val();
		    	/* var x_pi = 3.14159265358979324 * 3000.0 / 180.0; 
		    	var x=new Number(bd_lon-0.0065);
		    	var y=new Number(bd_lat-0.006);
		    	var z=Math.sqrt(x*x+y*y)-0.00002*Math.sin(y*x_pi);
		    	var theta=Math.atan2(y,x)-0.000003*Math.cos(x*x_pi);
		    	var Mars_lon=z*Math.cos(theta);
		    	var Mars_lat=z*Math.sin(theta);
		  	    var center = new qq.maps.LatLng(Mars_lat,Mars_lon ); */
		  	  var center = new qq.maps.LatLng(bd_lat,bd_lon );
		        var map = new qq.maps.Map(document.getElementById("container"), {
		             center: center,
		             zoom: 16
		         });
		        scaleControl: true;
		        var marker = new qq.maps.Marker({
		             position: center,
		             map: map
		         });
		        
				 for(var i=0;i<data.length;i++){
					/*  var x_pi = 3.14159265358979324 * 3000.0 / 180.0; 
				    	var x=new Number(data[i].merchantInfo.longitude-0.0065);
				    	var y=new Number(data[i].merchantInfo.latitude-0.006);
				    	var z=Math.sqrt(x*x+y*y)-0.00002*Math.sin(y*x_pi);
				    	var theta=Math.atan2(y,x)-0.000003*Math.cos(x*x_pi);
				    	var Mars_lon=z*Math.cos(theta);
				    	var Mars_lat=z*Math.sin(theta); */
				    	var Mars_lon=data[i].merchantInfo.longitude;
				    	var Mars_lat=data[i].merchantInfo.latitude;
			        var marker3 = new qq.maps.Marker({
			             position: new qq.maps.LatLng(Mars_lat,Mars_lon),
			             map: map
			         });
			         
			         marker3.setVisible(true); 
			            var anchor2 = new qq.maps.Point(0, 39),
			             size2 = new qq.maps.Size(42, 68),
			             origin2 = new qq.maps.Point(0, 0);
			             icon2 = new qq.maps.MarkerImage(
			                 "${pageContext.request.contextPath }/admin/shop/merchantInfo/image/mer.png",
			                 size2,
			                 origin2,
			                 anchor2
			             );
			     /*    marker0.setIcon(icon2); 
			         marker1.setIcon(icon2); 
			         marker2.setIcon(icon2);   */
			          marker3.setIcon(icon2);  
			    
				} 
			}else if(data.length == 0){
				var bd_lat=$("#latitude").val();
		    	var bd_lon=$("#longitude").val();
		    	/* var x_pi = 3.14159265358979324 * 3000.0 / 180.0; 
		    	var x=new Number(bd_lon-0.0065);
		    	var y=new Number(bd_lat-0.006);
		    	var z=Math.sqrt(x*x+y*y)-0.00002*Math.sin(y*x_pi);
		    	var theta=Math.atan2(y,x)-0.000003*Math.cos(x*x_pi);
		    	var Mars_lon=z*Math.cos(theta);
		    	var Mars_lat=z*Math.sin(theta);
		  	    var center = new qq.maps.LatLng(Mars_lat,Mars_lon ); */
		  	  var center = new qq.maps.LatLng(bd_lat,bd_lon );
		        var map = new qq.maps.Map(document.getElementById("container"), {
		             center: center,
		             zoom: 16
		         });
		        scaleControl: true;
		         //创建一个Marker
		         var marker = new qq.maps.Marker({
		             position: center,
		             map: map
		         });

		         marker.setVisible(true);
		         var anchor = new qq.maps.Point(0, 39),
		             size = new qq.maps.Size(42, 68),
		             origin = new qq.maps.Point(0, 0),
		             icon = new qq.maps.MarkerImage(
		                 "${pageContext.request.contextPath }/admin/shop/merchantInfo/image/lag.png",
		                 size,
		                 origin,
		                 anchor
		             );
		         marker.setIcon(icon); 
			}
		}
	})
	
	
})
    wx.config({
//debug : true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId : '${appid}', // 必填，公众号的唯一标识
        timestamp : '${jsparam.timestamp}', // 必填，生成签名的时间戳
        nonceStr : '${jsparam.noncestr}', // 必填，生成签名的随机串
        signature : '${jsparam.signature}',// 必填，签名，见附录1
        jsApiList : [ 'openLocation','getLocation' ]
// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
    
/*     function init() {
    	var bd_lat=$("#latitude").val();
    	var bd_lon=$("#longitude").val();
    	var x_pi = 3.14159265358979324 * 3000.0 / 180.0; 
    	var x=new Number(bd_lon-0.0065);
    	var y=new Number(bd_lat-0.006);
    	var z=Math.sqrt(x*x+y*y)-0.00002*Math.sin(y*x_pi);
    	var theta=Math.atan2(y,x)-0.000003*Math.cos(x*x_pi);
    	var Mars_lon=z*Math.cos(theta);
    	var Mars_lat=z*Math.sin(theta);
  	    var center = new qq.maps.LatLng(Mars_lat,Mars_lon );
        var map = new qq.maps.Map(document.getElementById("container"), {
             center: center,
             zoom: 16
         });
        scaleControl: true;
         //创建一个Marker
         var marker = new qq.maps.Marker({
             position: center,
             map: map
         });

         marker.setVisible(true);
         var anchor = new qq.maps.Point(0, 39),
             size = new qq.maps.Size(42, 68),
             origin = new qq.maps.Point(0, 0),
             icon = new qq.maps.MarkerImage(
                 "${pageContext.request.contextPath }/admin/shop/merchantInfo/image/about4_icon.png",
                 size,
                 origin,
                 anchor
             );
         marker.setIcon(icon); 
    } */
    
</script>
<div style="width:100%;height:100%" id="container"></div>
<div style='width: 500px; height: 180px' id="infoDiv"></div>
</body>

</html>