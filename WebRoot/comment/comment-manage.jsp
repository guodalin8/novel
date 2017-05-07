<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 评论管理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Comment comment=new Comment();
	String keyword=request.getParameter("keyword");
	int novelid=DataConverter.toInt(request.getParameter("novelId"));
	List<CommentInfo> list=comment.getListByNovelId(novelid);
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
    <body>
   	<p>当前位置：评论管理</p>
   	<table width="1000">
   		<tr>
   			<td>评论内容</td>
   			<td>评论人</td>
   			<td>评论时间</td>
   			<td>操作</td>
   		</tr>
   		<%
   			for(CommentInfo info:list){
   		%>
   		<tr>
   			<td width="700"><%=Utilty.Substring(info.getContext(), 100) %></td>
   			<td width="100"><%=info.getReaderName() %></td>
   			<td width="100"><%=info.getCreatedTime() %></td>
   			<td width="100">
   				<a href="comment/comment-delete.jsp?id=<%=info.getId() %>&NovelId=<%=info.getNovelId() %>">删除</a>
   			</td>
   		</tr>
   		
   		<%
   			}
   		%>
   	</table>
  </body>
</html>
