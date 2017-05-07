<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*"%>
<%@page import="org.model.*"%>
<%@page import="org.dal.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 增加类别 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>增加类别</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/genre.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
  	String gen=request.getParameter("action");
  	if("insert".equals(request.getParameter("action"))){
  		GenreInfo info=new GenreInfo();
  		Genre genre=new Genre();
  		info.setName(request.getParameter("txtName"));
  		info.setSort(DataConverter.toInt(request.getParameter("txtSort")));
  		int result=0;
  		result=genre.insert(info);
  		if(result==1){
  	 		out.println("<script>alert('小说添加成功'); location.href ='genre-manage.jsp'; </script>");
  	 		//response.sendRedirect("../novel/novel-manage.jsp");
  			
  		}else{
  			out.println("<script>alert('小说添加失败'); location.href ='genre-manage.jsp';</script>");
  		}
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
			action="genre-insert.jsp?action=insert">
			<table>
				<tr>
					<td class="td">分类名称:</td>
					<td><input class="input" type="text" name="txtName" id="txtName" /></td>
				</tr>
				<tr>
					<td class="td">排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;序:</td>
					<td><input class="input" type="text" name="txtSort" id="txtSort" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="button" type="submit" name="button" id="button"value="提交" style="cursor: pointer"/> 
						<input class="button1" type="reset" name="button2" id="button2"value="重置" style="cursor: pointer"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>