<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 作者管理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Author author=new Author();
	String keyword=request.getParameter("keyword");
	List<AuthorInfo> list=author.getList(keyword);
%>

<html>
  <head>
    
    <title>作者管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="../css/manage.css">
	<script type="text/javascript" src="../js/jquery-1.10.1.js"></script>
	

  </head>
  
  <body>
    <div class="header">
    	<h2>当前位置：作者管理</h2>
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
    <div class="context" >
    	<div class="th">
    	<form id="form1" name="form1" method="post"action="novel/novel-manage.jsp">
    		请输入要查询的作者昵称：
    		<input type="text" name="keyword" id="keyword" style="height:25px" />
    		<input class="en" type="submit" name="button" id="button" value="查询" style="cursor: pointer"/>
    	</form>
    	</div>
   <div>  
    <div id="dataShow" style="width:450px;margin:0 auto;">  
        <table class="table" id="table"></table>  
    </div>  
    <br/>  
    <div id="page" style="margin:-50px;"></div>  
    </div> 
    <script type="text/javascript">  
//编造表数据  
//表头  
var head=  
    '<thead><tr>'+  
    '<td>作者昵称 </td>'+  
    '<td>密码 </td>'+  
    '<td>邮箱 </td>'+  
    '<td>操作 </td>'+   
    '</tr></thead><tbody>';  
//表内容，后台返回的内容可以封装到这里，随时取用，但是如果数据量很大估计会相当耗资源。  
var pageData=[];  
		<%
			for(AuthorInfo info:list){
		%> 
    var data='<tr>'+   
    '<td><%=info.getAuthorName() %></td>'+  
    '<td><%=info.getAuthorPassword() %></td>'+  
    '<td><%=info.getAuthorEmail() %></td>'+  
    '<td>'+
	'<a href="../author/author-delete.jsp?authorName=<%=info.getAuthorName() %>">封禁该作者ID</a>'+'&nbsp;&nbsp;'+
	'|<a href="#">标为星级作家</a>'+
	'</td>'
	+'</tr>';  
    pageData.push(data);   
//表结尾  
var end='</tbody>';  
		<%
    		}
    	%>
$(function(){  
    var Count = pageData.length;//记录条数  
    var PageSize=10;//设置每页示数目  
    var PageCount=Math.ceil(Count/PageSize);//计算总页数  
    var currentPage =1;//当前页，默认为1。  
    //造个简单的分页按钮  
    for(var i=1;i<=PageCount;i++){  
    var pageN='<a href="#" selectPage="'+i+'"style="margin-left:210px">第'+i+'页</a>';  
    $('#page').append(pageN);  
    }  
    //显示默认页（第一页）  
    $('#table').empty().append(head);  
    for(i=(currentPage-1)*PageSize;i<PageSize*currentPage;i++){    
        $('#table').append(pageData[i]);  
    }  
    $('#table').append(end);  
      
    //显示选择页的内容  
    $('a').click(function(){  
     var selectPage=$(this).attr('selectPage');  
     $('#table').html('');  
        $('#table').append(head);  
        for(i=(selectPage-1)*PageSize;i<PageSize*selectPage;i++){  
            $('#table').append(pageData[i]);  
        }  
        $('#table').append(end);  
    });  
    $("tr").css("bgColor", "#F8FFFA","height","100px");//为单数行表格设置背景颜色 
	$("tr:even").css("background-color", "#E7E5DC");//为双数行表格设置背颜色素
	$("td").css("height","30px");
});    
</script>  
  </body>
</html>