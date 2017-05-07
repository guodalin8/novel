<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
	.black_overlay{
		display: none;
		position: absolute;
		top: 0%;left: 0%;
		width: 100%;
		height: 100%;
		background-color: black;
		z-index: 1001;
		opacity: .70;
	}
	.white_content{
		display: none;
		position: absolute;
		top: 20%;
		left: 37%;
		width: auto;
		height: 35%;
		padding: 20px;
		border-top: 4px solid #CCCCCC;
		background-color: white;
		z-index: 1002;
		overflow: auto;
	}
	.a{
		margin:300px 560px;
	}
	a{
		font-size:40px;
		text-decoration:none;
	}
	a:hover{
    color:blue;
    text-decoration:underline;
    couser:pointer;
}
</style>
  </head>
  
  <body>
  	<div class="a">
    <a href="javascript:void(0)" 
	onclick="document.getElementById('light').style.display='block';
	document.getElementById('fade').style.display='block'">后台入口>></a>
	</div>

<div id="light" class="white_content">
	<jsp:include page="../admin/admin-login.jsp"></jsp:include>
<a href="javascript:void(0)" 
	onclick="document.getElementById('light').style.display='none';
	document.getElementById('fade').style.display='none'"></a>
</div>
<div id="fade" class="black_overlay"></div>
  </body>
</html>
