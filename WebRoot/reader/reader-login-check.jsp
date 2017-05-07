<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>

<!-- 读者登陆时处理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>读者登陆时处理 </title>
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
/* 读者登陆检测信息 */
	request.setCharacterEncoding("utf-8");
	Reader reader=new Reader();
	String readerName=request.getParameter("ReaderName");
	String password=request.getParameter("Password");
	if(!reader.isExist(readerName, password))
		out.println("<script>alert('用户名或密码错误'); location='reader-login.jsp';</script>");
	else{
		Utilty.writeCookie(response, "reader", readerName);
		response.sendRedirect("../novel/index.jsp");
}
%>
  </body>
</html>