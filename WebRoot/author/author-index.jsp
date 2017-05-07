<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 首页，用户已登陆 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	Novel novel=new Novel();
	/* List<NovelInfo>list=novel.getList(null); */
	Genre genre=new Genre();
	String keyword=request.getParameter("keyword");
	List<NovelInfo> list=novel.getList(keyword);
	List<GenreInfo> clist=genre.getList();
	
%>
<html>
  <head>
    <title>作者首页</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css"> 
  </head>
  <body>
  <script type="text/JavaScript" src="../js/index.js"></script>
  <div>
  <tr>
    	<td>
    		<a>欢迎您：<%=Utilty.readCookie(request, "author")%></a>
		</td>
	</tr>
	</div>
  <div id="header">
        <h1><a href="#">应有尽有小说网站</a></h1>
        <ul>
            <li><a href="#">设为首页</a></li>
            <li><a href="#">加入收藏</a></li>
            <li><a href="../novel/novel-edit.jsp">小说发布</a></li>
        </ul>
    </div>
    <div class="context" >
    	<div class="th">
    	<form id="form1" name="form1" method="post"action="../novel/novel-query.jsp">
    		请输入要查询的小说标题：
    		<input type="text" name="keyword" id="keyword" style="height:25px"/>
    		<input class="en" type="submit" name="button" id="button" value="查询" />
    	</form>
    	</div>
    	</div>
    <div id="main" class="clear">
        <div class="container">
            <div class="news">
                <dl class="xuexiao">
                    <h5><a href="#">最热小说</a></h5>
                    <dt><img src="../image/01.jpg" id="ss1" /></dt>
                    <dd class="remen">
                    	天道亦为道，万道之一尔。少年云枫，以苍穹为决，
                    	凝祖龙之体，拥绝世佳人……心念动，搅八方风雨；抬手间，破万古轮回。
						古之有道，偏违道而行，古之有理，偏反理而为。何须废话？
						做！就做个干净利索！杀！就杀他个片甲不留！
						欲只手遮天，必要打乱规章，欲翻云复雨，
						必创天下之路。我叫叶凡，我为创世纪而来... 
					</dd>
                </dl>
                <dl class="xinwen">
                    <h5><a href="#">新书速递</a></h5>
                    <dd>
                        <a href="#">[仙侠] 帝念永存：我掌世间轮回</a>
                    </dd>
                    <dd>
                        <a href="#">[都市] 修真生活录：低调做人</a>
                    </dd>
                    <dd>
                        <a href="#">[同人] 重生火影：调教一群牛人</a>
                    </dd>
                    <dd>
                        <a href="#">[历史] 十国帝王：建立强大帝国</a>
                    </dd>
                    <dd>
                        <a href="#">[玄幻] 不死龙帝：觉醒龙神血脉</a>
                    </dd>
                    <dd>
                        <a href="#">[畅销] 至尊邪神：逆天雄霸乾坤</a>
                    </dd>
                </dl>
            </div>
            
            <div class="product clear">
                <div id="content">
                <h5>精彩小说</h5>
		<%
			for(NovelInfo info:list){
		%>
		<div class="post">
			<h1 class="title"><a href="../author/author-novel-infomation.jsp?id=<%=info.getId()%>"><%=info.getTitle() %></a></h1>
			<p class="byline"><%=info.getCreatedTime() %></p>
			<div class="entry">
				<p><%=Utilty.Substring(info.getContext(), 300) %></p>
			</div>
			<p class="meta">
			<a class="more">分类：<%=info.getGenreName()%></a>
			&nbsp;&nbsp;&nbsp; 
			<a href="../author/author-novel-infomation.jsp?id=<%=info.getId()%>" class="more">详情：</a>
			&nbsp;&nbsp;&nbsp; 
			<a href="../author/author-novel-infomation.jsp?id=<%=info.getId()%>" class="comments">我要评论</a>
			</p>
		<div class="person">
    		<p>总票数： <span><%=info.getVoteNumber() %></span> 票</p>
    		<button class="button">给它投票</button>
  		</div>
  		</div>
		<%
			}
		%>
		
	</div>
            </div>
        </div>
	<div class="subMenu">
		<ul>
			<li>
				<h2>小说分类</h2>
				<ul>
					<%for(GenreInfo cinfo:clist){ %>
						<li>
							<a href="../novel/novel-list.jsp?classId=<%=cinfo.getId() %>">
							<%=cinfo.getName() %>
							</a>
						</li>
						<%
					}
						%>
				</ul>
			</li>
		</ul>
	</div>
	</div>
	<div id="footer" class="clear">
        <p><a>作者发布小说作品时，请遵守国家互联网信息管理办法规定。
        本站所收录小说作品、社区话题、书库评论均属其个人行为，不代表本站立场。</a></p>
    </div>
  </body>
</html>