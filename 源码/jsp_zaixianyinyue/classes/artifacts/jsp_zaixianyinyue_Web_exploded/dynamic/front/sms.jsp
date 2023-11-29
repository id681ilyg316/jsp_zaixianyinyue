<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校校盈</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/one.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<!--[if lt IE 7]>    
<script src="http://ie7-js.googlecode.com/svn/version/2.0(beta)/IE7.js" type="text/javascript"></script>    
<![endif]-->    
</head>
<body>
<%@include file="head.jsp" %>
<div class="help">
	<div class="w1000">
    	<div class="help_center">
            <h2 class="help_ico">信息公开</h2>
            <div class="sideMenu">
            <c:forEach items="${sms }" var="p" >
               <h3 class="on"><span><em></em>${p.type }</span></h3>
                <ul>
                    <li>${p.content } &nbsp;&nbsp;插入时间：${p.insertTime }</li>
                </ul>
    		</c:forEach>
    
               <!--  <h3 class="on"><span><em></em>使用校额宝需要具备哪些条件？</span></h3>
                <ul>
                    <li>校额宝资金当日14点之前转出，我们将于当日16点之前处理；14点之后转出，我们将于第二个工作日处理，如遇节假日顺延。 当日到账：工行、招行、农行、建行、深发、交通、光大、中信、北京银行、中行、平安、民生、兴业。 其他银行：2-3个工作日到账。</li>
                </ul> -->
    
			</div><!-- sideMenu End -->

		<script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script>
       <!--  <div class="fenye">
        	<span>第 <strong>1</strong> /115页</span>
            <a href="#" class="fyprev">&lt;</a>
            <b>1</b>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <em>...</em>
            <a href="#">115</a>
            <a href="#" class="fynext">&gt;</a>
        </div> -->
        </div>
        
<%@include file="foot.jsp" %>
</body>
<script type="text/javascript">
$(function(){

	$(".fenqi_span p").click(function(){
		var ul=$(".fenqi_span_li");
		if(ul.css("display")=="none"){
			ul.slideDown();
		}else{
			ul.slideUp();
		}
	});
	
	$(".set").click(function(){
		var _name = $(this).attr("name");
		if( $("[name="+_name+"]").length > 1 ){
			$("[name="+_name+"]").removeClass("select");
			$(this).addClass("select");
		} else {
			if( $(this).hasClass("select") ){
				$(this).removeClass("select");
			} else {
				$(this).addClass("select");
			}
		}
	});
	
	$(".fenqi_span li").click(function(){
		var li=$(this).text();
		$(".fenqi_span p").html(li);
		$(".fenqi_span_li").hide();
		/*$(".set").css({background:'none'});*/
		$("p").removeClass("select") ;   
	});
})
</script>
</html>

