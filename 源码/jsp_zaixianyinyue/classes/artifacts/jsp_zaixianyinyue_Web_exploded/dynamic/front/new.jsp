<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校校盈</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body>
<%@include file="head.jsp" %>
<div class="focus">
	<!-- <div class="focusBox" style="margin:0 auto">
			<ul class="pic">
					<li><a href="#" target="_blank" style="background:url(images/a.jpg) center top no-repeat;"></a></li>
					<li><a href="#" target="_blank" style="background:url(images/b.jpg) center top no-repeat;"></a></li>
                    <li><a href="#" target="_blank" style="background:url(images/c.jpg) center top no-repeat;"></a></li>
                    <li><a href="#" target="_blank" style="background:url(images/d.jpg) center top no-repeat;"></a></li>
                    <li><a href="#" target="_blank" style="background:url(images/e.jpg) center top no-repeat;"></a></li>
			</ul>
			<ul class="hd">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
	</div> -->
	<script type="text/javascript">
		jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:200, trigger:"click"});
	</script>
</div>    
<div class="news_index">
	<div class="w1200">
    	<ul>
    	<c:forEach items="${newlist }" var="p" >
        		<li><a href="ActionR1_lookNew.action?id=${p.id }">${p.title }</a><span>${p.insert_time }</span></li>
        </c:forEach> 
        </ul>
       <!--  <a href="#" class="more">更多</a> -->
    </div>
</div>
 <%@include file="foot.jsp" %>
</body>
</html>