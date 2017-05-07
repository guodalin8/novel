<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*"%>
<%@page import="org.model.*"%>
<%@page import="org.dal.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 修改类别 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>类别管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/genre.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	String pageAction = "";
	int id = DataConverter.toInt(request.getParameter("id"));
	GenreInfo info = new GenreInfo();
	Genre cls = new Genre();
	if ("update".equals(action) || "insert".equals(action)) {
		if ("update".equals(action)) {
			info = cls.getGenreInfo(id);
			if (info == null) {
				out.println("<script>alert('小说ID有误');</script>");
			}
			info.setId(id);
		}
		info.setName(request.getParameter("txtName"));
		info.setSort(DataConverter.toInt(request
				.getParameter("txtSort")));

		if ("insert".equals(action)) {
			cls.insert(info);

		} else {
			cls.update(info);
			response.sendRedirect("genre-manage.jsp");
		}
	}
	if ("edit".equals(action) || "add".equals(action)) {
		info = cls.getGenreInfo(id);
		if (info == null) {

		}
		pageAction = "update";
	}
	if ("add".equals(action)) {
		pageAction = "insert";
	}
%>
<body>
	<div class="header">
		<h2>当前位置:增加分类</h2>
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
	<div class="context">
	<form id="form1" name="form1" method="post"
		action="genre-edit.jsp">
		<table>
			<tr>
				<td class="td">分类名称：</td>
				<td><input class="input" type="text" name="txtName" id="txtName"value="<%=info.getName()%>" /></td>
			</tr>
			<tr>
				<td class="td">排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序：</td>
				<td><input class="input" type="text" name="txtSort" id="txtSort"value="<%=info.getSort()%>" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input class="button" type="submit" name="button" id="button"value="提交" style="cursor: pointer"/>
				<input class="button1" type="reset" name="button2" id="button2"value="重置" style="cursor: pointer"/> 
				<input type="hidden" name="action" id="txtSort"value="<%=pageAction%>" /> 
				<input type="hidden" name="id"value="<%=info.getId()%>" />
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>