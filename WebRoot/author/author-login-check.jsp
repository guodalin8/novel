<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 作者登陆时处理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>作者登陆时处理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <%
/* 作者登陆检测信息 */
	
	Author author=new Author();
   
	String authorName=request.getParameter("AuthorName");
	String password=request.getParameter("Password");
	if(!author.isExist(authorName, password))
		out.println("<script>alert('用户名或密码错误');location.href='author-login.jsp';</script>");
	else{
		Utilty.writeCookie(response, "author", authorName);
		response.sendRedirect("../author/author-index.jsp"); 
}
%>
  </body>
</html>