<%
	//权限验证
	if(session.getAttribute("currentuser") == null){
		response.sendRedirect("/jxc/dynamic/server/view/login.jsp");
		return;
	}
%>