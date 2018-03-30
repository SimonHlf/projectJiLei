<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>xxx大师详细介绍</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/Module/cultural/css/cultural.css"/>
	</head>
	<body>
		<%@ include file="../../head.jsp"%>  
		
		<div class="detailPeoInfo w1100">
			<p class="breadNav"><a href="cultural.html">文化荟萃</a>&nbsp;&gt;&nbsp;详细介绍</p>
			<div class="wrap clearfix">
				<div class="leftPeoImg fl">
					<div class="innerLeftImg">
						<img src="/${metaInfo.photo}" width="188px" height="188px"/>
						<div class="description">
			                <div class="name">${metaInfo.name}</div>
			                <div class="title">${metaInfo.positio}</div>
			            </div>
			            <ul class="navigators">
			                <li class="active"><a href="javascript:void(0)">艺术家介绍</a></li>
			                <li><a href="javascript:void(0)">获奖情况</a></li>
			                <li><a href="javascript:void(0)">代表作品</a></li>
			            </ul>
					</div>
				</div>
				<div class="master-detail fr">
					<div id="J_Master_intro" class="masterInfos">
						<div class="header">
			                <span class="header-title">艺术家介绍</span>
			            </div>
			            <div class="profile">
			                <div class="sub-title">| 个人简介 |</div>
			                <p>${metaInfo.brief}</p>
			            </div>
			            <div class="record">
			                <div class="sub-title">| 艺术家年表 |</div>
			                ${metaInfo.chronology}
			                	<!-- <table>
			                        <tr>
			                            <td>1991年</td>
			                            <td>被授予“浙江省工艺美术大师”称号</td>
			                        </tr>
			                        <tr>                                                                                                                            <tr>
			                            <td>1993年</td>
			                            <td>被国家授予为“有突出贡献的科技专家”并享受国务院颁发的特殊津贴</td>
			                        </tr>
			                   
			                </table> -->
			            </div>
					</div>
					<div id="J_Master_awards" class="masterInfos">
						<div class="header">
				            <span class="header-title">获奖情况</span>
						</div>
						 ${metaInfo.award}
						<!-- <table>
							<tr>
		                        <td>1999年</td>
		                        <td>《仿古莲花碗》被评定为国家珍品</td>
		                    </tr>
		                   
						</table> -->
					</div>
					<div id="J_Represent_work" class="masterInfos">
						<div class="header">
			                <span class="header-title">代表作品</span>
			            </div>
			            <ul class="work-list">
			             ${metaInfo.representwork}
			            	<!-- <li>
				            	<div class="img-wrapper">
		                            <img src="images/02.jpg" alt="">
		                        </div>
		                        <div class="work-detail">
		                            <div class="work-sidebar">
		                                <div class="work-title">红色诱惑</div>
		                                <div class="work-date">2002.01</div>
		                            </div>
		                            <div class="vline"></div>
		                            <p class="work-description">
		                                夏侯文大师的这件作品“红色的诱惑” 于2002年在第七届陶瓷艺术设计创新评比中荣获一等奖，证书由中国轻工业联合会、中国陶瓷工业协会与2002年10月颁发
		                            </p>
		                        </div>
			            	</li> -->
			            	
			            </ul>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../../foot.jsp"%>  
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/web/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('.navigators li').click(function(){
					$(this).addClass('active').siblings().removeClass('active');
					var _i=$(this).index();
					$('body, html').animate({scrollTop:$('.masterInfos').eq(_i).offset().top},500);
				});
			});
		</script>
	</body>
</html>
