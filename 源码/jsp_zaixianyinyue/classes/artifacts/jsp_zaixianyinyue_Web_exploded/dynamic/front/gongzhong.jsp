<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>音乐在线</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>   
<script type="text/javascript">
</script>    
<body>
<%@include file="head.jsp" %>
<div class="bbs_img"></div>
<div class="qdfb">
	<div class="w1200">
    	<span>把想对我们说的话写在这里！</span>
        <h2>公众参与</h2>
        <div class="qdfb_btn">
        	<!-- <a href="#" class="qdico">签到</a> -->
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" class="fbico">发表主题</a>
        </div>
    </div>
</div>
<div class="bbs_index">
	<div class="w1000">
	<h1>七星关村卫生和计划生育句信息发布系统社区讨论</h1>
    <!--<div class="bbs_nav">
    	 <a href="#" class="on">全部</a>
        <a href="#">创业</a>
        <a href="#">就业</a>
        <a href="#">活动</a>
        <a href="#">公益</a> 
    </div>-->
    <div class="bbs_list mar25">
    
    <c:forEach items="${list }" var="p" >
    	<dl>
        	<dt><a href="#">${p.title }</a></dt>
            <dd class="bbs_list_xx"><a href="#"></a><span>${p.insertTime }</span><p><a href="#"></a></p></dd>
            <dd class="bbs_list_jj">${p.content }</dd>
        </dl>
    </c:forEach>   
       <!--  <div class="fenye">
        	<span>第 <strong>1</strong> /115页</span>
            <a href="#" class="fyprev"><</a>
            <b>1</b>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <em>...</em>
            <a href="#">115</a>
            <a href="#" class="fynext">></a>
        </div> -->
    </div>
    <div class="bbs_fr mar25">
    	<div class="rmtl">
        	<h2>热门讨论</h2>
            <ul>
            	<li class="a"><a href="#"><em>1</em>砸金蛋的小米手环已到手，来发帖..</a></li>
				<li class="b"><a href="#"><em>2</em>互联网金融投资新人必背12字箴言</a></li>
				<li class="c"><a href="#"><em>3</em>互联网金融与哲学的小故事三则</a></li>
				<li><a href="#"><em>4</em>《2015致富秘笈》，是真爱</a></li>
				<li><a href="#"><em>5</em>[经验] 李嘉诚先生的理财秘诀</a></li>
				<li><a href="#"><em>6</em>2014年国内网贷行业新闻事件</a></li>
				<li><a href="#"><em>7</em>[交流]低门槛理财产品大盘点..</a></li>
				<li><a href="#"><em>8</em>[交流]谁说有钱就能任性？ 年底..</a></li>
				<li><a href="#"><em>9</em>2015年，P2P网贷行业到底会有..</a></li>
				<li><a href="#"><em>10</em>为他们点赞 50名90后学生众筹.</a></li>
            </ul>
        </div>
       <!--  <div class="mxyh">
        	<h2>明星用户</h2>
            <ul>
            	<li><a href="#"><img src="images/tx.jpg" /><em></em><span>金蛋</span></a></li>
                <li><a href="#"><img src="images/tx.jpg" /><em></em><span>金蛋</span></a></li>
                <li><a href="#"><img src="images/tx.jpg" /><em></em><span>金蛋</span></a></li>
                <li><a href="#"><img src="images/tx.jpg" /><em></em><span>金蛋</span></a></li>
                <li><a href="#"><img src="images/tx.jpg" /><em></em><span>金蛋</span></a></li>
                <li><a href="#"><img src="images/tx.jpg" /><em></em><span>金蛋</span></a></li>
            </ul>
        </div> -->
    </div>
</div>
</div>
<%@include file="foot.jsp" %>
<div id="light" class="white_content">
    <div class="fbxt_title">
        <h2>发布新帖</h2>
        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"></a>
    </div>
    <dl>
    <form action="ActionR1_addPublics.action" id="form1" >
    	<dt>标题：</dt>
        <dd class="tzinput"><input name="title" id="title" type="text" /></dd>
        <dt>内容填写：</dt>
        <dd class="fckbj">
			<!-- <script id="container" name="content" type="text/plain">
				这里写你的初始化内容
			</script>
			<script type="text/javascript" src="umeditor/ueditor.config.js"></script>
			<script type="text/javascript" src="umeditor/ueditor.all.min.js"></script>
			<script type="text/javascript">
				var ue = UE.getEditor('container');
			</script> -->
			<textarea rows="20" cols="100" id="content" name="content" >
			
			</textarea>
        </dd>
        <dd>
            <div class="bbs_submit_btn">
                <a href="javascript:void(0);" class="bbs_submit_btn_style">提交</a>
                <a href="javascript:void(0);">重置</a>
            </div>
       </dd>
    </dl>
    </form>
</div>
<div id="fade" class="black_overlay"></div>
</body>
<script type="text/javascript">
    //实例化编辑器
  /*   var um = UM.getEditor('myEditor');
    um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus',function(){
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UM.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UM.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    } */
    
    $(".bbs_submit_btn_style").click(function(){
    	var title = $("#title").val();
    	var content = $("#content").val();
    	//form1
    	if(title == "" || content==""){
    		alert("请填写主题或内容");
    		return;
    	}
    	
    	$("#form1").submit();
    	
    });
</script>
</html>

