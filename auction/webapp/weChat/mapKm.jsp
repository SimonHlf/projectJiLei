<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>商家帮-周边</title>
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

<body onLoad="init()">
<script>
    wx.config({
//debug : true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId : '${appid}', // 必填，公众号的唯一标识
        timestamp : '${jsparam.timestamp}', // 必填，生成签名的时间戳
        nonceStr : '${jsparam.noncestr}', // 必填，生成签名的随机串
        signature : '${jsparam.signature}',// 必填，签名，见附录1
        jsApiList : [ 'openLocation','getLocation' ]
// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
    var citylocation,map,maker = null;
    function init() {
            wx.ready(function(){
            	wx.getLocation({
                    type : 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                    success : function(res) {
                       /*  var center = new qq.maps.LatLng(res.latitude, res.longitude); */
                        var latitude=res.latitude;
                        var longitude=res.longitude;
                        var center=new qq.maps.LatLng(latitude,longitude);
                        map = new qq.maps.Map(document.getElementById('containerww'),{
                            center: center,
                            zoom: 13
                        });
                        //调用城市服务信息
                        citylocation = new qq.maps.CityService({
                            complete : function(results){
                                map.setCenter(results.detail.latLng);
                    			var cityName=results.detail.name;
                    			var mergerName=results.detail.detail;
                    		window.location.href="nearby2.htm?latitude="+latitude+"&longitude="+longitude+"&quName="+cityName+"&mergerName="+mergerName;
                            }
                        });
                        //设置经纬度信息
                        var latLng=new qq.maps.LatLng(latitude,longitude);
                        //调用城市经纬度查询接口实现经纬度查询
                          citylocation.searchCityByLatLng(latLng);
                    },
                 
                });
            });
    }
</script>
<div style="width:100%;height:100%" id="container"></div>
</body>

</html>