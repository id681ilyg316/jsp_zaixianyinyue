<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的收藏</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>   
</head>
<body>
<%@include file="head.jsp" %>
<div class="Personal_center">
	<div class="w1000">
    	<div class="presonal_tx">
        	<div class="p_tx"><img src="images/tx.jpg" width="174" height="174" /><em></em></div>
            <div class="p_name">
            	<h2></h2><span></span>
            </div>
        </div>
        <div class="presonal">
            <div class="presonal_fr">
             	<h2><span>歌曲清单</span></h2>
                <div class="fqfk">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                      <tr>
                        <th scope="col" width="75" align="left"><p>歌曲编号</p></th>
                        <th scope="col" width="150" align="center">歌曲名字</th>
                        <th scope="col" width="96" align="left">歌曲作者</th>
                        <th scope="col" width="82" align="left">歌曲类型</th>
                        <th scope="col" width="99" align="center">添加时间</th>
                        <th scope="col" width="77" align="left">点击播放数</th>
                        <th scope="col" width="70" align="center">播放</th>
                      
                      </tr>
                      
                      <c:forEach items="${o }" var="p" >
	                      <tr>
	                        <td><p>${p.id }</p></td>
	                        <td><p><a href="music/${p.name}.mp3">${p.name }</a></p></td>
	                        <td><b>${p.auth }</b></td>
	                        <td><strong>${p.type }</strong></td>
	                        <td><p>${p.insert_time}</p></td>
	                        <td align="center"><b>${p.click }</b></td>
	                        <td align="center"><embed src="music/aa.mp3" width="40" height="25" play="false" flashvars="autoplay=false&play=false" menu="false" loop="false" autostart="false"/></td>
	                       
	                      </tr>
                      </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="foot.jsp" %>
</body>
<script>

</script>
</html>
