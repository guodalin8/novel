<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 发布小说 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>小说编辑发布界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <%
	request.setCharacterEncoding("utf-8");
	Genre cls=new Genre();
	List<GenreInfo>list=cls.getList();

%>
  <body>
  欢迎您：<%=Utilty.readCookie(request, "author")%>
<% 
	request.setCharacterEncoding("utf-8");
	String act=request.getParameter("action");
	Novel novel=new Novel();
	NovelInfo ninfo=new NovelInfo();
	ninfo.setTitle(request.getParameter("txtTitle"));
	ninfo.setContext(request.getParameter("content"));
	ninfo.setGenreId(DataConverter.toInt(request.getParameter("selClass")));
	novel.insert(ninfo);
%>		
<p>当前位置：小说编辑</p>
    <form id="form1" name="form1" method="post" action="novel/novel-edit.jsp">
    	<table>
    		<tr>
    		<td>小说标题</td>
    		<td><input type="text" name="txtTitle" id="txtTitle" width="500px"/></td>
    		</tr>
    		<tr>
    		<td>小说所属分类</td>
    		<td>
    		<select name="selClass" id="selClass">
    			<%
    				for(GenreInfo cinfo:list){
    					
    			%>
    			<option value="<%=cinfo.getId() %>">
    			<%if(cinfo.getId()==ninfo.getId()) %>
    			<%=cinfo.getName() %></option>
    			<%
    				}
    			%>
    			
    		</select>
    		</td>
    		</tr>
    		<tr>
    			<td>小说内容</td>
    			 <td><textarea rows="4" cols="100" name="content"></textarea> </td>
    		</tr>
    		
    <tr>
	<td colspan="2">
		<input type="submit" name="button" id="button" value="提交" />
		<input type="reset" name="button2" id="button2" value="重置" />
	</td>
	</tr>
    	</table>
    </form>
  </body>
</html>