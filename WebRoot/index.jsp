<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="static/css/header.css" />
	<link href="easyui/themes/default/easyui.css" rel="stylesheet" type="text/css"/>
	<link href="easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">
		*{
			padding: 0 ;
			margin: 0 ;
			font-family: "微软雅黑" ;
		}
		a {    
		    color: #fff ;    
		    text-decoration: none ;
		}
		ul li {
			list-style: none;
			float:left;
		}
		.header ul li.first {
	    	background:#74b0e2 ;
		}
		.banner {
		    height: 450px;
		    margin-top: 20px;
		    position: relative;
		}
		.banner .content {
		    width: 1060px;
		    height: 450px;
		    margin: 20px auto;
		    position: relative;
		}
		.banner .content ul {
		    width: 10000px;
		    margin-left: -1024px;
		}
		.banner ul li img {
		    width: 1024px ;
		    height: 380px ;
		}
		.btn_left ,.btn_right {
		    display: inline-block;
		    width: 25px;
		    height: 150px;
		    background: url(img/banner_tb.png) no-repeat;
		    position: absolute;
		    left: -38px;
		    top: 90px;
		    opacity:0;
		    transition: all ease 0.6s;
		    cursor: pointer;
		}
		.btn_right {
		    background-position: -25px 0;
		    left: 1041px;
		}
		.banner .content:hover .btn_left {
		    opacity: 1;
		}
		
		.banner .content:hover .btn_right {
		    opacity: 1;
		}
		.btn_increase,.btn_decrease{
			display: inline-block;
		    width: 50px;
		    height: 50px;
		    background: url(img/increase.png) no-repeat;
		    position: absolute;
		    left: 562px;
		    top: 380px;
		    cursor: pointer;
		}
		.btn_decrease {
			background: url(img/decrease.png) no-repeat;
		    left: 412px;
		}
		.number {
			width:60px;
			height:40px;
			position:absolute;
			left:482px;
			top:385px;
			text-align:center;
		}
		.confirm {
			width:60px;
			height:40px;
			position:absolute;
			left:482px;
			top:435px;
		}
	</style>
  </head>
  
  <body>
	<%@include file="jsp/common/header.jsp" %>

		<!-- 轮播图	 -->
		<div class='banner'>
		    <div class='content'>
		        	<i class='btn_left'></i>
					<i class='btn_right'></i>
					<i class='btn_decrease'></i>
					<i class='btn_increase'></i>
					<input type="text" id="number" name="number" value="0" class="number">
					<form id="conButton" method="post">
						<input type="button" id="confirm" name="confirm" value="确定" class="confirm">
					</form>
		        <ul>
		        	<li>
		                <a href="javascript:void(0)">
		                    <img src="img/grain/rice.jpg "/>
		                </a>
		            </li>
		            <li>
		                <a href="javascript:void(0)">
		                    <img src="img/meet/pork.jpg "/>
		                </a>
		            </li>
		            <li>
		                <a href="javascript:void(0)">
		                    <img src="img/vegetable/cabbage.jpg "/>
		                </a>
		            </li>
		            <li>
		                <a href="javascript:void(0)">
		                    <img src="img/fruit/apple.jpg "/>
		                </a>
		            </li>
		            <li>
		                <a href="javascript:void(0)">
		                    <img src="img/grain/rice.jpg "/>
		                </a>
		            </li>
		            <li>
		                <a href="javascript:void(0)">
		                    <img src="img/meet/pork.jpg "/>
		                </a>
		            </li>
		        </ul>
		    </div>
		</div>
		
		<script type="text/javascript">
			var leftBtn = $('.btn_left').eq(0); //左按钮
			var rightBtn = $('.btn_right').eq(0);//右按钮
			var decBtn = $('.btn_decrease').eq(0);
			var incBtn = $('.btn_increase').eq(0);
			var ul = $('.banner .content ul').eq(0);
			var index=0;
			var number=0;
			var imgwidth = $('.banner .content ul li').width(); //获取轮播图片的宽度
			var len =  $('.banner .content ul li').length - 2//获取总共的图片数量
			var timer=0;
			var resData;
			
			//移动图像
			function movePicture(){
				$('.banner .content ul').animate({'margin-left':-imgwidth * (index+1)},1000,function(){
					if(index == len){
						$(this).css('margin-left',-imgwidth);
						index = 0;
					}
					if(index == -1){
						$(this).css('margin-left',-imgwidth * len);
						index = len - 1;
					}
				});
			}
			
			//右按钮
			rightBtn.on('click',function(){
				
				clearTimeout(timer); //定时器清零
				timer = setTimeout(function(){
					index ++;
					movePicture();
				},300);
			}); 
			
			//左按钮
			leftBtn.on('click',function(){
				clearTimeout(timer); //定时器清零
				timer = setTimeout(function(){
					index --;
					movePicture();
				},300);
			});
			
			//减少按钮
			decBtn.on('click',function(){
				if(number>0)
				number-=1;
				$("#number").val(number);
			})
			
			//增添按钮
			incBtn.on('click',function(){
				number+=1;
				$("#number").val(number);
			})
			
			//确认按钮
			$("#confirm").on('click',function(){
				var curName;
				switch(index){
				case 0:
					curName="猪肉";
					break;
				case 1:
					curName="卷心菜";
					break;
				case 2:
					curName="苹果";
					break;
				case 3:
					curName="大米";
					break;
				}
				$("#conButton").form("submit",{
					url:"commodity/findByName.action",
				    onSubmit: function(param){
				    	param.name=curName;     
  					}, 
					success: function(data){    
			        resData = eval('(' + data + ')');
					console.log(resData);
					save();
					number=0;
					$("#number").val(number);
			      } 
			    });
			})
			function save(){
				$.post(
				"bill/save.action",
				 {"name":resData.name,"price":resData.price,"number":number},
				 function(data){
				 	if(data.success){
						$.messager.alert("提示","购买成功","info");
					}else{
						$.messager.alert("提示","购买失败："+data.msg,"error");
					}
		 		},
		 		"json")
			}
			
		</script>
  </body>
</html>
