<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员登录</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script>
/* function getContentSize() {
            var wh = document.body.clientHeight; 
            var eh = 0;
            ch = (wh - eh);
			if (ch < 880){
			  var bh="880px";
			  }else{
			  var bh=ch+'px'
			  }
            document.getElementById( "fqxm" ).style.height = bh;
        }
        window.onload = getContentSize;
        window.onresize=function(){ location=location }; */
</script>
<script>
/* $(document).ready(function(){
  $("#ddd i").click(function(){
    $("i").toggleClass("xzon");
  });
}); */
</script>
</head>
<body>
<div class="login" id="fqxm">

	<div class="login_module">
	
    	<!-- <a href="#" class="logo"><img src="images/logo.png" width="405" height="44" /></a> -->
    	 <div class="login_con">
    	 
         	<div class="login_module_title">
         	
                <h2>会员登录</h2>
                <span>没有账号， <a href="ActionR1_Aregist.action">立即注册</a></span>
            </div>
            <div class="login_form">
            <form action="ActionR1_login.action" id="form1" >
            	<ul>
                	<li><em class="login_form_ico1"></em><input name="account" id="account" type="text" placeholder="账号" /></li>
                    <li><em class="login_form_ico2"></em><input name="pwd" id="pwd" type="password" placeholder="密码" /></li>
                    <!-- <li class="noborder" id="ddd">
                    	<span><i></i>记住用户名</span>
                        <a href="#">忘记密码?</a>
                    </li> -->
                    <li class="noborder"><a href="javascript:void(0);" class="denglu_btn"></a></li>
                </ul>
                </form>
                <a href="#" class="shuaxin"></a>
            </div>
         </div>
         
    </div>
	<div class="login_bottom"></div>
</div>
</body>
<script type="text/javascript">
	$(".denglu_btn").click(function(){
		if($("#account").val()==""){
			alert("请填写账户");
			return false;
		}
		if($("#pwd").val()==""){
			alert("请填写密码");
			return false;
		}
		$("#form1").submit();
	});

</script>
</html>

