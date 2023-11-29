<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>歌曲中心</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/one.css" />
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
pageContext='${pageContext.request.contextPath}';
function down_load(obj){
	var param={};
	param.path=$(obj).attr('aa');
	$.post(pageContext+"/server/ActionR1_downMusic.action",param,function(data){
	
	})
}
$(function(){
	$("#search").click(function(){
		var name=$("#name_").val();
		debugger;
		var frm=$("#frm").attr("action","Fmusic.action?name="+name);
		$(frm).submit();
	})
})

</script>
</head>
<body>
	<%@include file="head.jsp"%>
	<% if(request.getSession().getAttribute("user") == null )
{
	//response.sendRedirect("localhost:8080/music/server/ActionR1_index.action");
}
%>
	<div class="Personal_center">
		<div class="w1000">
			<div class="presonal_tx">
				<!-- <div class="p_tx">
        	<img src="images/tx.jpg" width="174" height="174" />
        	<em></em>
        	</div> -->
				<div class="p_name">
					<h2></h2>
					<span></span>
				</div>
			</div>
			<div class="presonal">
				<div class="presonal_fl">
					<h2>热门分类</h2>
					<ul>
						<li><a href="ActionR1_Fmusic.action?type=1" class="hoveron">新歌排行榜</a></li>
						<li><a href="ActionR1_Fmusic.action?type=2">网络红歌榜</a></li>
						<li><a href="ActionR1_Fmusic.action?type=3">流行音乐榜</a></li>
						<li><a href="ActionR1_Fmusic.action?type=4">摇滚排行榜</a></li>
					</ul>
					<!-- <a href="#" class="banner_192240"><img src="images/banner001.jpg" width="192" height="240"></a> -->

					<h2>热门视频</h2>
					<ul>
						<li><a href="ActionR1_Fmusic2.action?type=1">视频排行榜</a></li>
					</ul>
				</div>
				<div class="presonal_fr">
					<h2>
						<span>列表清单</span>
					</h2>
					<h2>
						<form action="" id="frm">
							<input type="text" id="name_" placeholder="输入音乐名/author"
								style="height: 28px; width: 200px" />&nbsp;<input type="button"
								id="search" value="搜索" />
						</form>
					</h2>
					<div class="fqfk">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th scope="col" width="240px" align="left"><p>歌曲编号</p></th>
								<th scope="col" width="195px" align="center">歌曲名字</th>
								<th scope="col" width="116px" align="left">歌曲作者</th>
								<th scope="col" width="222px" align="left">歌曲类型</th>
								<th scope="col" width="119px" align="center">添加时间</th>
								<th scope="col" width="222px" align="left">收藏次数</th>
								<th scope="col" width="333px" align="center">操作</th>
								<th scope="col" width="103px" align="center">评价</th>
								<th scope="col" width="190px" align="center">点击播放</th>
							</tr>

							<c:forEach items="${music }" var="p">
								<tr>
									<td><p>${p.id }</p></td>
									<td><a href="music/${p.src}" target="_blank"
										onclick="Fmusic.jsp"><p>${p.name }</p></a></td>
									<td><b>${p.auth }</b></td>
									<td><strong>${p.type }</strong></td>
									<td><p>
											<fmt:formatDate pattern="yyyy.MM.dd" value="${p.insertTime}" />
										</p></td>
									<td align="center"><b>${p.click }</b></td>
									<td align="center"><a href="javascript:aa('${p.id }');">收藏&nbsp;<c:if
												test="${not empty p.src}">
												<a
													href="${pageContext.request.contextPath}/server/ActionR1_downMusic.action?path=server/music/${p.src}">下载</a>
											</c:if></td>
									<td align="center"><a
										href="ActionR1_musicDetail.action?id=${p.id}">评价</a></td>
									<c:if test="${fn:contains(p.src, '.mp3')}">
										<td align="center"><audio controls="controls"
												src="music/${p.src }" loop="loop" preload="auto"
												type="audio/mp3"></audio></td>
									</c:if>
									<c:if test="${fn:contains(p.src, '.mp4')}">
										<td onclick="javascript:window.open('music/${p.src }')"
											align="center"><video src="music/${p.src }" width=200 height=150
												controls="controls"> your browser does not support
												the video tag
											</video></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="foot.jsp"%>
</body>
<script>
function aa(id){
	$.ajax({
		type:"get",
		dataType:"json",
		url:"ActionR1_scMusic.action?id="+id,
		success:function(date){
			if(date.flag == true){
				alert("收藏失败");
			}else{
				alert("收藏成功");
			}
		}
	});
}

</script>
</html>
