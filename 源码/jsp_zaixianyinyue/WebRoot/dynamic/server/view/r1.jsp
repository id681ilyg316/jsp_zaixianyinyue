<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
a:link {text-decoration:none; color:black;}		/* 未被访问的链接 */
a:visited {text-decoration:none; color:black;}	/* 已被访问的链接 */
a:hover {text-decoration:none; color:red;}	/* 鼠标指针移动到链接上 */
a:active {text-decoration:none; color:red;}	/* 正在被点击的链接 */
</style> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>音乐后台管理</title>

<jsp:include page="/dynamic/link/base.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		// 数据
		var treeData=[{
			text:"主目录",
			children:[
				   {
					   text:"视频管理",
					   attributes:{
						   url:"<%=path %>/dynamic/server/view/r1_6.jsp"
				    }
				  },
				   {
					   text:"音乐管理",
					   attributes:{
						   url:"<%=path %>/dynamic/server/view/r1_1.jsp"
				    }
				  },{
						text:"会员管理",
						attributes:{
							url:"<%=path %>/dynamic/server/view/r1_3.jsp"
						}
					}
			]
		}];
		
		// 实例化树菜单
		$("#tree").tree({
			data:treeData,
			lines:true,
			onClick:function(node){
				if(node.attributes){
					openTab(node.text,node.attributes.url);
				}
			}
		});
		
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
	});
	
	function logout(){
		var f = confirm('确定要注销登录?');
		if(!f)
			return false;
		top.location.href = '<%=path %>/server/UserAction_logout.action';
	}
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 80px;background-color: #E0EDFF">
		<div align="left" style="width: 80%;float: left"><img src="<%=basePath%>/statics/skin/server/images/frame/main.jpg"></div>
			&nbsp;&nbsp;<a href="#" onclick="logout();return false;"><h3></h3>注销</a></div>
		
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" >
				<div align="center" style="padding-top: 100px;"><font color="red" size="10">欢迎使用</font></div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 150px;" title="导航菜单" split="true">
		<ul id="tree"></ul>
	</div>
	<div region="south" style="height: 25px;" align="center"></a></div>
</body>
</html>