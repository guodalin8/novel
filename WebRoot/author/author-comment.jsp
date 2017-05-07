<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 作者回复-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
request.setCharacterEncoding("utf-8");
if("login".equals(request.getParameter("action")))
{
	Author author=new Author();
	String username=request.getParameter("txtUserName");
	String password=request.getParameter("txtPassword");
	if(!author.isExist(username,password)){
		out.println("<script>alert('用户名或密码错误');</script>");
	}else{
		Utilty.writeCookie(response, "author",username);
		response.sendRedirect("../author/author-novel-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
	}
}
if("save".equals(request.getParameter("action")))
{
	Comment comment=new Comment();
	CommentInfo info=new CommentInfo();
	info.setNovelId(DataConverter.toInt(request.getParameter("id")));
	info.setContext(request.getParameter("txtContext"));
	info.setReaderName(Utilty.readCookie(request, "author"));
	comment.insert(info);
	response.sendRedirect("../author/author-novel-infomation.jsp?id="+DataConverter.toInt(request.getParameter("id")));
}
String data=Utilty.readCookie(request, "author");
if(DataValidator.isNullOrEmpty(data))
{
%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
    <form id="form1" name="form1" method="post" action="author/author-comment.jsp?action=login">
	<table>
		<tr>
			<td><input name="id" type="hidden" id="id" value="<%=request.getParameter("id") %>"/></td>
			<td><input name="txtUserName" type="text" id="txtUserName" /></td>
			<td><input name="txtPassword" type="password" id="txtPassword" /></td>
			<td><input type="submit" name="button" id="button" value="提交"/></td>
		</tr>
	</table>
</form>
<%} else{ %>
<%=Utilty.readCookie(request, "author") %>
<form name="commentForm" method="post" action="author/author-comment.jsp?action=save">
	<input name="id" type="hidden" value="<%=request.getParameter("id") %>" />
	<textarea rows="4" cols="50" name="txtContext"></textarea>
	<input type="submit" name="button" value="回复" />
</form>
<%
	}
%>
  </body>
</html>

