<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.haiyan.model.User" %>

<div class="top">
	<div class="w1200">
    	<a href="#" class="logo"><img src="images/logo.png" width="405" height="44" /></a>
        <div class="nav">
        <a href="ActionR1_frontIndex.action" class="on" >首页</a>
        <%if(session.getAttribute("user")==null){ %>
        <a href="javascript:alert('请先登录');">歌曲中心</a>
        <a href="javascript:alert('请先登录');">我的收藏</a>
        <a href="javascript:alert('请先登录');">上传我的音乐</a>
         <a target="_blank" href="/zaixianyinyue/dynamic/server/view/login.jsp" class="rel">管理员登录</a>
        <%}else{ %>
        <a href="ActionR1_Fmusic.action">歌曲中心</a>
        <a href="ActionR1_Fsc.action">我的收藏</a>
         <a href="ActionR1_UserUpload.action">上传我的音乐</a>
          <a target="_blank" href="/zaixianyinyue/dynamic/server/view/login.jsp" class="rel">管理员登录</a>
        <%} %>
        </div>
        <div class="topfr">
          <%if(session.getAttribute("user")==null){ %>
        	<a href="ActionR1_Alogin.action">登录</a>
            <a href="ActionR1_Aregist.action" class="rel">注册</a>
           
            
            <div class="clear"></div>
          <%}else{ %>
          <a href="javascript:void(0);"> ${user.name }</a>
          <a href="ActionR1_loginOut.action" class="rel">退出</a>
          <div class="clear"></div>
          <%} %>
          
        </div> 
    </div>
</div>

