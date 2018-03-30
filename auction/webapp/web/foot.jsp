<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="footer">
	<div class="topFootPart">
		<div class="topDec"></div>
		<div class="tianchongL"></div>
		<div class="tianchongR"></div>
		<div class="leftDec"></div>
		<div class="rightDec"></div>
		<div class="innerTopFoot w1100 clearfix">
			<dl class="comFootDl telDl">
				<dt>
					<span></span>
					<strong id="telePhone"></strong>	
					<p id="phone"></p>
				</dt>
				<dd class="margTdd" id="address">郑州市台商大厦23楼</dd>
				<dd>客服邮箱：<span id="email"></span></dd>
			</dl>
			<div id="footer">
			</div>
		</div>
	</div>
	<div class="botFootPart">
		<div class="w1100">
			<p class="paddTp">友情链接：<a href="">西藏锦绣官网</a></p>
			<p>CopyrightR 2009-2018 xizangguanwang,All rights Reserved 中国西藏锦绣有限公司 版权所有</p>
			<p style="margin-top: 15px;">
				<a href="">
					<img src="../../images/shengming.png"/>
				</a>
				<a href="" style="margin-left: 15px;">
					<img src="../../images/shengming1.png"/>
				</a>
			</p>
		</div>
	</div>
</div>
<script>
	$(function(){
		$.ajax({
	        method:'post',
	        url:'${pageContext.request.contextPath}/web/shop/indexApi/footer.htm',
	        success:function (data) {
	        	var str="";
	            for(var i=0;i<data.length;i++){
	            	str+="<dl class='comFootDl xinshouDl'>";
	            	var dd = data[i];
	            	for(var j=0;j<dd.length;j++){
	            		if(j==0){
	            			str+="<dt>"+
								 "<span></span>"+
								 "<strong>"+dd[j].modelName+"</strong>"+
								 "</dt>";
	            		}else{
	            			str+="<dd class='margTdd'><a href='${pageContext.request.contextPath}/"+dd[j].hrefs+"'>"+dd[j].modelName+"</a></dd>";
	            		}
	            	}
	            	str+="</dl>";
	            }
	            $("#footer").append(str);
	        }
	    });
		
		$.ajax({
	        method:'post',
	        url:'${pageContext.request.contextPath}/web/shop/indexApi/basic.htm',
	        success:function (data) {
	            $("#telePhone").html(data.telephone);
	            $("#phone").html("Tel:"+data.phone);
	            $("#email").html(data.email);
	            $("#address").html(data.address);
	        }
	    });
	})
</script>
		