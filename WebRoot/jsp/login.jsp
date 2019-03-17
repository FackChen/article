<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="static/css/header.css" />
	<link rel="stylesheet" href="static/css/public.css" />
	<style type="text/css">			
			#login {
				position:absolute;
				left:0;
				top:0;
				width:300px;
				height:450px;
				left:500px;
				top:200px;
			}
			
			
			#login .layui-col-md6{
				position: absolute;
			    width: 500px;
			    left: 500px;
			    top: 200px;
			    z-index: 999;
			}
	</style>

  </head>
  
  <body>
	<%@include file="common/header.jsp" %> 
	<div id="login">
	        <div>用户登录</div>
	         	<form action="index.jsp">
				  <div>
				    <label for="un">用户名</label>
				    <div>
				      <input type="text" id="un" name="username" autocomplete="on" placeholder="请输入用户名">
				    </div>
				  </div>
				  <div>
				    <label for="ps">密码</label>
				    <div>
				      <input type="password" id="ps" name="password" placeholder="请输入密码" autocomplete="on">
				    </div>
				  </div>
			      <div>
				      <div>
					      <button>立即提交</button>
					      <button type="reset">重置</button>
				      </div>
				  </div>
				</form>
	      </div>
	</div>
    
  </body>
</html>
