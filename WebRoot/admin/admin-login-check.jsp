<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 管理员登陆时处理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登陆时处理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
<%
/* 管理员登陆检测信息 */
	Admin admin=new Admin();
	String adminName=request.getParameter("AdminName");
	String password=request.getParameter("Password");
	if(!admin.isExist(adminName, password))
		out.println("<script>alert('用户名或密码错误');location='admin/admin-login.jsp';</script>");
	else{
 		Utilty.writeCookie(response, "admin", adminName);
		response.sendRedirect("novel/novel-manage.jsp");
}
%>
  </body>
</html>