<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin-index.jsp' starting page</title>
    
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
    <tr>
    	<td>
 			<a href="../novel/author/author-manage.jsp">作者管理</a>
    		<a href="../novel/reader/reader-manage.jsp">读者管理</a>
    		<a href="../novel/novel/novel-manage.jsp">小说管理</a>
    		<a href="../novel/genre/genre-manage.jsp">分类管理</a>
    		<a href="../novel/genre/genre-insert.jsp">增加分类</a>
		</td>
	</tr>
  </body>
</html>
