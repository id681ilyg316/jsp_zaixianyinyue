<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>新用户注册</title>
<link href="<%=basePath%>/statics/my/style.css" type="text/css" rel="stylesheet">
</head>
<script src="<%=basePath%>/statics/my/jquery-1.8.0.min.js"></script> 
<script type="text/javascript"> 
function regist(){
	if($("#account").val() == "" || $("#account").val() == null){
		alert("用户名不能为空")
		return false;;
	}
	if($("#password").val() == "" || $("#password").val() == null){
		alert("密码不能为空")
		return false;;
	}
	if($("#repeatPassword").val() == "" || $("#repeatPassword").val() == null){
		alert("确认密码不能为空")
		return false;;
	}
	if($("#nicheng").val() == "" || $("#nicheng").val() == null){
		alert("姓名不能为空")
		return false;;
	}
	if($("#password").val() != $("#repeatPassword").val() ){
		alert("两次密码输入的不一致")
		return false;;
	}
	alert("注册成功！请登录！");
	return true;
	
}
</script>
<body bgcolor="#f5f5f5" class="select">
	<br/>
	<div style="padding-left: 200px"><font color="black" style="font-size:40px;"><div style="width: 120px;font-size:20px;float: left;">
		<span style="color:lightblue"></span></div>
		<div style="padding-left: 250px">注册空间</div></font></div>
	<br/>
	<center>
	<hr color="e1e1e1"> <br/>
	<fieldset style="width:600px;border-color:#e1e1e1; border-style:solid;">
		<legend style="color:#e1e1e1">用户注册</legend>		<br/><br/><br/>
		<form name="form" action="<%=basePath%>/server/UserAction_regist.action" onSubmit="return regist()">

			<table border="0" align="center">
		    
			    <tr>
			      <td class="leftText">用户名：</td>
			      <td><input name="account" id="account" type="text" class="inputinput"></td>
			    </tr>
			    <tr>
			      <td class="leftText">密码：</td>
			      <td><input name="password" id="password" type="password" class="inputinput"  size="35"></td>
			    </tr>
			    <tr>
			      <td class="leftText">确认密码：</td>
			      <td><input name="repeatPassword" id="repeatPassword" type="password" class="inputinput"  size="35"></td>
			    </tr>
			     <tr> 
			      <td class="leftText">昵称：</td>
			       <td><input name="nicheng" id="nicheng" type="text" class="inputinput"></td>
			    </tr>
			    
			    <tr>
			      <td class="leftText">联系方式：</td>
			      <td><input name="question" id="question" type="text" class="inputinput"  size="35"></td>
			    </tr>
			    <tr>
			      <td class="leftText">邮件：</td>
			      <td><input name="answer" id="answer" type="text" class="inputinput"  size="35"></td>
			    </tr>
			    <tr>
				    <td colspan="2" align="center">
					<input type="submit" name="register" id="register" style="background-image:url(<%=basePath%>/statics/my/registerBut.jpg);
							background-color:#f5f5f5; width:142px;height: 46px;" value=""/>
					</td>
			    </tr> 
		  	</table>
		  </form><br/><br/>
	</fieldset>		<br/><br/><br/>
	<hr color="#e1e1e1">
	<div class="select"><font color="#999999">新用户注册@2015.</font></div><br/>
	</center>
</body>
</html>