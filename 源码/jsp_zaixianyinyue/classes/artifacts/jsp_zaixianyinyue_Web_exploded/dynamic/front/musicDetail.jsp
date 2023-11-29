<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>歌曲评价</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>   
<script type="text/javascript">
pageContext='${pageContext.request.contextPath}';

function delPj(obj){
	var param={};
	param.id=$(obj).attr("pjId");
	$.post(pageContext+"/server/ActionR1_delPj.action",param,function(data){
			$(obj).parent().parent().remove();
	});
}
</script>
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
             	<form action="ActionR1_pjMusic.action" >
	                <div class="fqfk">
	                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                      <tr>
	                        <th scope="col" width="75" align="left"><p>歌曲编号</p></th>
	                        <th scope="col" width="150" align="center">歌曲名字</th>
	                        <th scope="col" width="96" align="left">歌曲评价</th>
	                        <th scope="col" width="96" align="left">删除评论</th>
	                      </tr>
	                      
	                      <c:forEach items="${o }" var="p" varStatus="s">
		                      <tr>
		                        <td align="left"><p>${s.count }</p></td>
		                        <td align="center"><p>${p.name }</p></td>
		                        <td align="left"><b>${p.pingjia }</b></td>
		                        <td><a href="#" pjId="${p.id }" onclick="delPj(this)">删除</a></td>
		                      </tr>
	                      </c:forEach>
	                      <hr>
	                      <tr>
		                        <td align="left"><p>评价歌曲</p></td>
		                        <td align="center"><p><input type="text" name="pingjia" /></p></td>
		                        <td align="center"><b><input type="submit" value="提交评价" /></b></td>
		                        
		                      </tr>
	                    </table>
	                    <input type="hidden" name="mid" value="${oid }" />
	                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="foot.jsp" %>
<script type="text/javascript">
function deleteUser(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("<%=basePath%>/server/ActionR1_deleteMusic.action",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].gradeName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
		function doshanchu(){
		 
		
		}
	}
</script>
</body>
<script>
</script>
</html>
