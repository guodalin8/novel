<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 小说管理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Novel novel=new Novel();
	String keyword=request.getParameter("keyword");
	List<NovelInfo> list=novel.getList(keyword);
%>

<html>
  <head>  
    <title>小说查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <div class="header">
    	<h2>小说查询</h2>
    </div>
    <%
    		for(NovelInfo info:list){
    	%>
    	<tr>
    		<td><%=info.getTitle() %></td>
    		<td><%=info.getContext() %></td>
    		<td><%=info.getVoteNumber() %></td>
    		<td><%=info.getCreatedTime() %></td>
    	</tr>
    	<%
    		}
    	%>
  </body>
</html>