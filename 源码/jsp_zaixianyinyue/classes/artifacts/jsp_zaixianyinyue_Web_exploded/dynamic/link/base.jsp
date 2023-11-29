<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<!-- Skin Style -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/statics/plugin/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/statics/plugin/jquery-easyui-1.3.3/themes/icon.css">

<!-- JavaScript -->
<script type="text/javascript" src="<%=basePath%>/statics/plugin/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/statics/plugin/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/statics/plugin/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

