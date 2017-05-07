<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 小说信息 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Novel novel=new Novel();
	int id=DataConverter.toInt(request.getParameter("id"));
	NovelInfo info=novel.getNovelInfo(id);
	if(info==null){
		out.println("<script>alert('小说ID有误');</script>");
	}
%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>单个小说信息详情</title>
     
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <div id="content">
    	<div class="post">
    		<h1 class="title"><%=info.getTitle() %></h1>
    		<p class="byline"><%=info.getCreatedTime() %></p>
    		<div class="entry">
    			<p><%=info.getContext() %></p>
    		</div>
    		<p class="meta"><a class="more">分类：<%=info.getGenreName() %></a></p>
    		<p class="meta"><a class="more">投票总数：<%=info.getVoteNumber() %></a></p>
    	</div>
    	<a name="comment" id="comment"></a>
    	<p class="meta">评论：</p>
    	<%
    		Comment comment=new Comment();
    		List<CommentInfo> cmlist=comment.getListByNovelId(id);
    		for(CommentInfo cminfo:cmlist){
    			out.println(cminfo.getContext()+"<br>");
    			out.println(cminfo.getCreatedTime()+"&nbsp;&nbsp;&nbsp;&nbsp;"+cminfo.getReaderName()+"<br><hr>");
    		}
    	%>
    	<jsp:include page="../author/author-comment.jsp">
    	<jsp:param value="<%=id%>" name="id"/>
    	</jsp:include>
    </div> 
  </body>
</html>
