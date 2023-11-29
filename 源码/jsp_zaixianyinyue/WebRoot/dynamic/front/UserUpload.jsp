<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传歌曲</title>
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
             	<h2><span>上传我的歌曲</span></h2>
             	 <form action="ActionR1_addmymusic.action" enctype="multipart/form-data" >
               <div class="fqfk">
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
	                        <td scope="col" width="75" align="left"><p>歌曲名</p></td>
	                        <td scope="col" width="150" align="center"><input type="text" name="name" id="name" /> </td>
                      </tr>
                      
                       <tr>
	                        <td scope="col" width="75" align="left"><p>歌曲作者</p></td>
	                        <td scope="col" width="150" align="center"><input type="text" name="auth" id="auth" /> </td>
                       </tr>
                       
                         <tr>
	                        <td scope="col" width="75" align="left"><p>歌曲类型</p></td>
	                        <td scope="col" width="150" align="center">
	                        	<select name="type" >
									<option value="流行">流行</option>
									<option value="摇滚">摇滚</option>
									<option value="古典">古典</option>
									<option value="伤感">伤感</option>
									<option value="纯音乐">纯音乐</option>
									<option value="DJ">DJ</option>
									<option value="动漫">动漫</option>
									<option value="小清新">小清新</option>
									<option value="夜店">夜店</option>
									<option value="民歌">民歌</option>
								</select>
	                        </td>
                       </tr>
                       
                        <tr>
	                        <td scope="col" width="75" align="left"><p>歌曲路径</p></td>
	                        <td scope="col" width="150" align="center"><input type="file" name="file" id="file" /> </td>
                       </tr>
                       
                        <tr height="70px" >
	                        <td scope="col" width="75" align="left"><p> <input type="submit" name="添加" /></p></td>
	                        <td scope="col" width="150" align="center"> </td>
                       </tr>
                      
                    </table>
                   </form>
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
