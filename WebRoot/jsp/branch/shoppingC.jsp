<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车</title>
    
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
	  	.header ul li.sixth {
	    	background:#74b0e2 ;
		}
	</style>

  </head>
  
  <body>
	<%@include file="/jsp/common/header.jsp" %>
	
  	<div id="tb">
		<a id="btn_edit" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a id="btn_delete" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	
	<table id="list"></table>
	
	<input type="text" id="amount" style="width:100px;height:30px;margin:5px">
	<input type="button" id="btn_amount" value="计价" style="width:100px;height:30px;margin:5px">
	<!-- <input type="button" id="confirm"  style="width:100px;height:30px;margin:5px"> -->
	<a id="btn_confirm" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true">结账</a>
	
	<!-- 编辑窗口 -->
	<div id="win" class="easyui-window" title="修改购买数量" style="width:250px;height:150px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
	    <form id="editForm" method="post">
	    	<input type="hidden" name="id">
		  	名称：<input type="text" name="name" class="easyui-validatebox" readonly unselectable="on"/><br/>
		  	单价：<input type="text" name="price" class="easyui-validatebox" readonly unselectable="on"/><br/>
		  	数量：<input type="text" name="number" class="easyui-validatebox" data-options="required:true"/><br/>
	  	<a id="btn_save" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
 	 </form> 
	</div>
	
  	<script type="text/javascript">
  	
  		//列表
  		$(function(){
  			$("#list").datagrid({
  				url:"bill/listByPage.action",
  				columns:[[
  					{
  						field:"id",
  						title:"产品编号",
  						align:"center",
  						width:100,
  						checkbox:true
  					},
  					{
  						field:"name",
  						title:"产品名",
  						align:"center",
  						width:400
  					},
  					{
  						field:"price",
  						title:"单价",
  						align:"center",
  						width:400
  					},
  					{
  						field:"number",
  						title:"购买数量",
  						align:"center",
  						width:400
  					}
  				]],
  				//显示分页
  				pagination:true,
  				//工具条
  				toolbar:"#tb"
  			});
  		});
  		
  		//计价
  		$("#btn_amount").on("click",function(){
  			$.post(
			"bill/list.action",
			 function(data){
  				var amount=0;
			 	//console.log(amount);
			 	for(i=0;i<data.length;i++){
			 		amount+=data[i].price * data[i].number;
			 	}
			 	//console.log(amount);
			 	$("#amount").val(amount);
	 		},
	 		"json")
  		})
  		
		//结账
		$("#btn_confirm").click(function(){
			$.messager.confirm("提示","确认结账?",function(value){
				if(value){
					$.post("bill/deleteAll.action",function(data){
						if(data.success){
  							$("#list").datagrid("reload");
  							
  							$.messager.alert("提示","结账成功","info");
  						}else{
  							$.messager.alert("提示","结账失败："+data.msg,"error");
  						}
					},"json");
				}
			});
		});
  			
		//修改购买数量
		$("#btn_edit").click(function(){
			var rows = $("#list").datagrid("getSelections");
			if(rows.length!=1){
				$.messager.alert("提示","修改操作只能选择一行","warning");
				return;
			}
			$("#editForm").form("load","bill/findById.action?id="+rows[0].id);
			$("#win").window("open");			
			$("#btn_save").on('click',function(){
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
							$.messager.alert("提示","修改成功","info");
						}else{
							$.messager.alert("提示","修改失败："+data.msg,"error");
						}
					}
				});
			});
		});
		
		//删除
		$("#btn_delete").click(function(){
			var rows =$("#list").datagrid("getSelections");
			if(rows.length==0){
				$.messager.alert("提示","删除操作至少选择一行","warning");
				return;
			}
			
			$.messager.confirm("提示","确认删除数据吗?",function(value){
				if(value){
					var idStr = "";
					$(rows).each(function(i){
						idStr+=("id="+rows[i].id+"&");
					});
					idStr = idStr.substring(0,idStr.length-1);
			
					$.post("bill/delete.action",idStr,function(data){
						if(data.success){
  							$("#list").datagrid("reload");
  							
  							$.messager.alert("提示","删除成功","info");
  						}else{
  							$.messager.alert("提示","删除失败："+data.msg,"error");
  						}
					},"json");
				}
			});
		});
		
  	</script>
  </body>
</html>
