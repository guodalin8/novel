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
    <title>首页</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css"> 
  </head>
  <body>
  <!-- <script type="text/JavaScript" src="../js/index.js"></script> -->
  <div>
  	<tr>
    	<td>
    		<a>欢迎您：<%=Utilty.readCookie(request, "reader")%></a>
		</td>
	</tr>
	</div>
  <div id="header">
        <h1><a href="#">应有尽有小说网站</a></h1>
        <ul>
            <li><a href="#">设为首页</a></li>
            <li><a href="#">加入收藏</a></li>
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
			<h1 class="title"><a href="../novel/novel-information.jsp?id=<%=info.getId()%>"><%=info.getTitle() %></a></h1>
			<p class="byline"><%=info.getCreatedTime() %></p>
			<div class="entry">
				<p><%=Utilty.Substring(info.getContext(), 300) %></p>
			</div>
			<p class="meta">
			<a class="more">分类：<%=info.getGenreName()%></a>
			&nbsp;&nbsp;&nbsp; 
			<a href="../novel/novel-information.jsp?id=<%=info.getId()%>" class="more">详情：</a>
			&nbsp;&nbsp;&nbsp; 
			<a href="../novel/novel-information.jsp?id=<%=info.getId()%>" class="comments">我要评论</a>
			</p>
		<div class="person">
    		<p>总票数： <span><%=info.getVoteNumber() %></span> 票</p>
    		<button class="button">给它投票</button>
<%--     		<input type="hidden" name="button" value="<%=info.setVoteNumber(778) %>" /> --%>
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
    <script type="text/javascript">
    function getElemensByClassName(className){  // 通过class获取
    	  var classArr = new Array();
    	  var tags = document.getElementsByTagName("*"); //获取所有节点
    	  for(var item in tags){ 
    	    if(tags[item].nodeType == 1){ 
    	    if(tags[item].getAttribute("class") == className){ 
    	      classArr.push(tags[item]); //收集class匹配的节点
    	    }
    	  }
    	}
    	  return classArr;
    	}
    	 
    	function delete_FF(element){  // 在FireFox中删除子节点为空的元素
    	  var childs = element.childNodes;
    	  for(var i=0;i<childs.length;i++){ 
    	    var pattern = /\s/; //模式匹配，内容为空
    	    if(childs[i].nodeName == "#text" && pattern.test(childs[i].nodeValue)){  //处理
    	      //alert(childs[i].nodeName);
    	      element.removeChild(childs[i]); //删除FF中获取的空节点
    	    }
    	  }
    	}
    	function $(obj){return document.getElementById(obj);}
    	window.onload = function(){ 
    		onload1();
    		onload2();
    	};
    	function onload2(){
    	  var persons = getElemensByClassName("person");
    	//  alert(persons);
    	  for(var item in persons){  //遍历所有person，为它们绑定投票事件
    	    (function(_item){    //匿名函数传入item, 防止因作用域问题导致item总为最后一个
    	    delete_FF(persons[_item]); //出去FF中空行代表的子节点
    	    persons[_item].setAttribute("id","person"+(parseInt(_item)+1)); //赋上id
    	 
    	    var childs = persons[_item].childNodes;
    	    for(var i = 0;i<childs.length;i++){ 
    	      //alert(childs[i].nodeName);
    	      if(childs[i].nodeName == "BUTTON"){  //点击按钮投票
    	        var oButton = childs[i];
    	      }
    	      if(childs[i].nodeName == "P"){  //投票结果更新
    	        var oP = childs[i];
    	        var oSpan = oP.getElementsByTagName("span")[0];
    	      }
    	    }
    	    if(oButton != null){
    	    oButton.onclick = function(){  //事件绑定
    	      var num = oSpan.innerHTML; //获取票数
    	      oSpan.innerHTML = (++num); //票数更新
    	                    // 这时一般我们可能就需要把这个票数num传送给服务器保存，更新时也是和服务器中的num同步
    	      this.setAttribute("disabled","true"); // 一般只能投票一次的吧
    	      alert("投票成功，谢谢您的支持");
    	    };
    	  }
    	})(item); // 传入各项person
    	  }
    	}
    	function onload1(){
    		setInterval(change,1000);
    		var n=1;
    		function changePic(m){
    			return n=m;
    		}
    		function change(){
    			var myImg=document.getElementById("ss1");
    			myImg.src="../image/0"+n+".jpg";
    			if(n<5)n++;
    			else n=1;
    		}
    	}
    </script>
  </body>
</html>