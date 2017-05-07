<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<style>
	body{
		background-image:url(./image/image4.jpg);
	}
	h2{
		text-align:center;
		margin-top:-2px;
		padding-bottom:5px;
		font-size:16px;
		border-bottom:1px solid #A6A6A6;
		color:#A6A6A6;
	}
	.td{
		font-weight:bold;
    	font-size:14px;
	}
	en{
		color:red;
	}
	.input{
		width:300px;
		height:30px;
		margin-bottom:10px;
	}
	.t{
		border-bottom:1px solid #A6A6A6;
	}
	.submit{
		width:150px;
		height:30px;
		position: relative;
		margin:10px 75px;
		border-radius:8px;
		background-color:#FF7200;
	}
	.submit:hover{
    background-color:#F62B00;
    font-weight:bold;
}
</style>
<body>
    <script language="javascript" type="text/javascript">
  		function check(form){
  			if(document.loginform.AdminName.value==""){
  				alert("请输入昵称");

  				return false;
  			}
  			if(document.loginform.Password.value==""){
  				alert("请输入密码");
  				return false;
  			}
  		}
  	</script>
	  	<%
/* 管理员登陆检测信息 */
    request.setCharacterEncoding("utf-8");
	String action=request.getParameter("action");
	Admin admin=new Admin();
	String adminName=request.getParameter("AdminName");
	String password=request.getParameter("Password");
	if("log".equals(action)){
		if(!admin.isExist(adminName, password))
			out.println("<script>alert('用户名或密码错误');location='admin/admin-login.jsp';</script>");
		else{
			//Utilty.writeCookie(response, "admin", adminName);
			response.sendRedirect("admin-index.jsp");
	}
}
%>
  	<form name="loginform" action="admin/admin-login.jsp?action=log" method="post" onsubmit="return check(this)">
   	<h2>管理员登陆</h2> 
    <table>
    	<tr>
    		<td class="td"><en>*</en>账号</td>
    	</tr>
    	<tr>
    		<td><input class="input" name="AdminName" type="text" /></td>
    	</tr>
    	<tr>
    		<td class="td"><en>*</en>密码</td>
    	</tr>
    	<tr>
    		<td><input class="input" name="Password" type="password" /></td>
    	</tr>
    	<tr>
    		<td class="t"><input class="submit" type="submit" value="登陆"style="cursor: pointer"/></td>
    	</tr>
    </table>
    </form>
  </body>