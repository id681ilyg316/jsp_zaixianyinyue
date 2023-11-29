<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Calendar calendar = Calendar.getInstance();
	int now = calendar.get(Calendar.YEAR);
%>


<div class="footer">
<%--	<p class="footer_links"><a href="javascript:void(0);">关于音乐网站</a>|<a href="javascript:void(0);">联系我们</a>|<a href="javascript:void(0);">帮助中心</a>|<a href="javascript:void(0);">网站地图</a></p>--%>
    	<p class="footer_links" style="color: #ffffff"><%=now-1%>-<%=now%> 音乐网站</p>
</div>

