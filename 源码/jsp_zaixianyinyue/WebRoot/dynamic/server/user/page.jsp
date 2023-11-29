<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息管理</title>

<jsp:include page="/dynamic/link/checkLogin.jsp"></jsp:include>
<jsp:include page="/dynamic/link/base.jsp"></jsp:include>

<script type="text/javascript">
	var url;
	
	function searchUser(){
		$('#dg').datagrid('load',{
			s_username:$('#s_username').val()
		});
	}
	
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
				$.post("<%=basePath%>/server/UserAction_delete.action",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].gradeName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function openUserAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		url="<%=basePath%>/server/UserAction_save.action";
	}
	
	function openUserModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		// $("#fm").form("load",row);
		$("#username").val(row.username);
		//$("#password").val(row.password);
		url="<%=basePath%>/server/UserAction_save.action?id="+row.id;
	}
	
	function closeUserDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#username").val("");
		$("#password").val("");
		$("#repassword").val("");
	}
	
	
	function saveUser(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	$.extend($.fn.validatebox.defaults.rules, {  
	    /*必须和某个字段相等*/
	    equalTo: {
	        validator:function(value,param){
	            return $(param[0]).val() == value;
	        },
	        message:'字段不匹配'
	    }
	           
	});

</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="账号管理" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="<%=basePath%>/server/UserAction_execute.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
					<th field="id" width="10" align="center">编号</th>
					<th field="username" width="20" align="center">账号</th>
					<th field="password" width="20" align="center">密码</th>
					<th field="name" width="20" align="center">姓名</th>
					<th field="address" width="20" align="center">地址</th>
					<th field="tell" width="20" align="center">电话</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;用户名：&nbsp;<input type="text" name="s_username" id="s_username"/><a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<!-- <tr>
					<td>用户名：</td>
					<td><input type="text" name="user.username" id="username" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td valign="top">新密码：</td>
					<td><input type="password" name="user.password" id="password" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td valign="top">确认密码：</td>
					<td><input type="password" name="repassword" id="repassword" class="easyui-validatebox" validType="equalTo['#password']" invalidMessage="两次输入密码不匹配" required="true"/></td>
				</tr> -->
				
				<tr>
					<td>类型：</td>
					<td>
						<select class="easyui-combobox" id="logintype" name="user.logintype" editable="false" panelHeight="auto">
							<option value="4">用户</option>
							<option value="2">录入员</option>
							<option value="3">编辑员</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>账号：</td>
					<td><input type="text" name="user.username" id="username" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="text" name="user.password" id="password" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="user.name" id="name" class="easyui-validatebox" /></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" name="user.address" id="address" class="easyui-validatebox" /></td>
				</tr>
				<tr>
					<td>联系方式：</td>
					<td><input type="text" name="user.tell" id="tell" class="easyui-validatebox" /></td>
				</tr>
				
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>