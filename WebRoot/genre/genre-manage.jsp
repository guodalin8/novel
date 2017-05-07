<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 类别管理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Genre genre=new Genre();
	String keyword=request.getParameter("keyword");
	List<GenreInfo> list=genre.getList();
%>
<html>
  <head>
    
    <title>小说分类管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/genre-manage.css">
	<script type="text/javascript" src="../js/jquery-1.10.1.js"></script>
	<script type="text/javascript" src="../js/manager.js"></script>
  </head>
  
  <body>
     <div class="header">
    	<h2>当前位置：读者管理</h2>
    </div>
    <div class="left">
   		<ul>
 			<li><a href="../author/author-manage.jsp">作者管理</a></li>
    		<li><a href="../reader/reader-manage.jsp">读者管理</a></li>
    		<li><a href="../novel/novel-manage.jsp">小说管理</a></li>
    		<li><a href="../genre/genre-manage.jsp">分类管理</a></li>
    		<li><a href="../genre/genre-insert.jsp">增加分类</a></li>
		</ul>
    </div>
<table>
	<tr>
		<th>名称</th>
		<th>排序</th>
		<th>操作</th>
	</tr>
	<%
		for(GenreInfo info:list){
	%>
	<tr>
		<td><%=info.getName() %></td>
		<td><%=info.getSort() %></td>
		<td>
			<a href="../genre/genre-edit.jsp?id=<%=info.getId() %>&action=edit">编辑</a>
			<a href="../genre/genre-delete.jsp?id=<%=info.getId() %>">删除</a>
		</td>
	</tr>
	<%
		}
	%>
</table>
  </body>
</html>