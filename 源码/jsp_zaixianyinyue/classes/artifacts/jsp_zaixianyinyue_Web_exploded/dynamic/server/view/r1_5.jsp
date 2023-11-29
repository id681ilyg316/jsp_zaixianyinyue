<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>音乐系统</title>

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
			$.messager.alert("系统提示","请选择要选择的课程！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要选择这<font color=red>"+selectedRows.length+"</font>些课程吗？",function(r){
			if(r){
				$.post("<%=basePath%>/server/ActionR1_deleteShebei.action",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","选课成功！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].gradeName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	function openUserAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","");
		url="<%=basePath%>/server/ActionR1_addShebei.action";
	}
	
	function openUserModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","");
		$("#name").val(row.name);
		url="<%=basePath%>/server/ActionR1_saveXQ.action?id="+row.id;
	}
	
	function openUserModifyDialog2(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg2").dialog("open").dialog("setTitle","");
		$("#name2").val(row.name);
		$("#getMoney").val(row.money);
		$("#namen").val(row.name);
		url="<%=basePath%>/server/ActionR1_saveJX.action?id="+row.id;
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
	
	
	function saveUser2(){
		$("#fm2").form("submit",{
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
					$("#dlg2").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
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
	<table id="dg" title="设备信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="<%=basePath%>/server/ActionR1_selectShebei.action" fit="true" toolbar="#tb">
		<thead>
			<tr>
					<th field="cb" checkbox="true"></th>
					<th field="id" width="10" align="center">编号</th>
					<th field="shebei" width="15" align="center">设备</th>
					<th field="type" width="15" align="center">设备类型</th>
					<th field="shuliang" width="15" align="center">设备数量</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			 <a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加设备</a>
			<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除设备</a> 
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 300px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>设备</td>
					<td><input type="text" name="shebei" id="title" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>设备类型</td>
					<td>
						<select name="type">
							<option value="设备类型1" >设备类型1</option>
							<option value="设备类型2" >设备类型2</option>
							<option value="设备类型3" >设备类型3</option>
							<option value="设备类型4" >设备类型4</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>设备数量</td>
					<td><input type="text" name="shuliang" id="title" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<div id="dlg2" class="easyui-dialog" style="width: 400px;height: 300px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons2">
		<form id="fm2" method="post">
			<table>
				
				<tr>
					<td></td>
					<td><input type="text" name="name2" id="name2" disabled="disabled" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="shiji" id="shiji" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" name="zongjie" id="zongjie" class="easyui-validatebox" required="true"/></td>
				</tr>
				<input type="hidden" name="getMoney" id="getMoney" value="" />
				<input type="hidden" name="namen" id="namen" value="" />
			</table>
		</form>
	</div>
	<div id="dlg-buttons2">
		<a href="javascript:saveUser2()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeUserDialog2()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>

</body>
</html>