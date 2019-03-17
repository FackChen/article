<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>肉类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="easyui/themes/default/easyui.css" rel="stylesheet" type="text/css"/>
	<link href="easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="static/css/header.css" />
	<link rel="stylesheet" href="static/css/branch.css" />
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
  <style type="text/css">
	  .header ul li.second {
	    	background:#74b0e2 ;
		}
  </style>

  </head>
  
  <body>
		<%@include file="/jsp/common/header.jsp" %>
		
		<!-- 编辑窗口 -->
		<div id="win" class="easyui-window" title="选择购买数量" style="width:250px;height:150px;top:200px"   
		       data-options="iconCls:'icon-save',modal:true,closed:true">   
		    <form id="editForm" method="post">
		    	<input type="hidden" name="id">
			  	名称：<input type="text" id="name" name="name" class="easyui-validatebox" readonly unselectable="on"/><br/>
			  	单价：<input type="text" id="price" name="price" class="easyui-validatebox" readonly unselectable="on"/><br/>
			  	数量：<input type="text" name="number" class="easyui-validatebox" data-options="required:true"/><br/>
		  	<a id="btn_confirm" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认</a>
			 </form> 
		</div>
	
        <ul class="branch">
        	<li>
                <a href="javascript:void(0)">
                    <img src="img/meet/pork.jpg "/>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="img/meet/mutton.jpg "/>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="img/meet/beef.jpg "/>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="img/meet/chicken.jpg "/>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="img/meet/fish.jpg "/>
                </a>
            </li>
        </ul>
        
        <script type="text/javascript">
        	
        	//点击图片
			$(".branch li").on('click',function(){
				//alert($(this).index());
				var curName;
				switch($(this).index()){
				case 0:
					curName="猪肉";
					break;
				case 1:
					curName="羊肉";
					break;
				case 2:
					curName="牛肉";
					break;
				case 3:
					curName="鸡肉";
					break;
				case 4:
					curName="鱼肉";
					break;
				}
				$.post(
				"commodity/findByName.action",
				 {"name":curName},
				 function(data){
					//console.log(data);
					$("#name").val(data.name);
					$("#price").val(data.price);
					$("#win").window("open");
		 		},
		 		"json")
			})
			
			//确认按钮
			$("#btn_confirm").on('click',function(){
				$("#editForm").form("submit",{
					url:"bill/save.action",
					onSubmit:function(){
						return $("#editForm").form("validate");
					},
					success:function(data){
						data = eval("("+data+")");
						if(data.success){
							$("#win").window("close");
	  						$("#list").datagrid("reload");
							$.messager.alert("提示","购买成功","info");
						}else{
							$.messager.alert("提示","购买失败："+data.msg,"error");
						}
					}
				});
			}); 
			       
        </script>
  </body>
</html>
