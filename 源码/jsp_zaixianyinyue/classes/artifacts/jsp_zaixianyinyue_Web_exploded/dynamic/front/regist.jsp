<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册会员</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>   
</head>
<body class="bg">
<%@include file="head.jsp" %>
<div class="reg_bg"></div>
<div class="bccon w1000">
    	<div class="bcfl"><a href="#"><img src="images/banner002.jpg" width="212" height="420" /></a></div>
        <div class="bcfr">
        <div class="bjzl">
        	<div class="bjzl_title">注册</div>
                    	<ul class="bdlist">
                    	<form action="ActionR1_regist.action" id="form1" >
                        	<li><span>帐号：</span><input name="account" id="account" type="text" value="" class="nichen_txt bold"></li>
							<li><span>密码登录：</span><input name="pwd" id="pwd" type="password" value="" placeholder="" class="nichen_txt"></li>
                            <li><span>确认密码登录：</span><input name="rpwd" id="rpwd" type="password" value="" class="nichen_txt"></li>
							<li><span>姓名：</span><input name="name" id="name" type="text" value="" class="nichen_txt bold"></li>
							<li><span>性别：</span><input name="sex" id="sex"  type="text" value="" class="nichen_txt bold"></li>
							<li><span>邮箱：</span><input name="email" id="email"  type="text" value="" class="nichen_txt bold"></li>
							
                            <li>
                            	<span></span>
                                <a href="javascript:void(0);" class="zcbtn">注册</a>
                            </li>
                         </form>
                        </ul>
                    </div>
        </div>
</div>
<%@include file="foot.jsp" %>
</body>
<script type="text/javascript">
$(".zcbtn").click(function(){
	if($("#account").val()==""){
		alert("请填写账户");
		return false;
	}
	if($("#pwd").val()==""){
		alert("请填写密码");
		return false;
	}
	if($("#rpwd").val()==""){
		alert("请再次填写密码");
		return false;
	}
	if($("#name").val()==""){
		alert("请填姓名");
		return false;
	}
	if($("#sex").val()==""){
		alert("请填写性别");
		return false;
	}
	if($("#email").val()==""){
		alert("请填写邮箱");
		return false;
	}
	alert("恭喜您！注册成功！");
	$("#form1").submit();
});

</script>
</html>
