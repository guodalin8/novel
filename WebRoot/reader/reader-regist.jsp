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
<!-- 读者注册 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>读者注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="../css/regist.css">

</head>

<body>
	<script type="text/javascript">
		function check(form) {
			if (document.regist.txtUserName.value == "") {
				alert("用户名不能为空");
				return false;
			}
			if (document.regist.txtPassword.value == "") {
				alert("密码不能为空");
				return false;
			}
			if (document.regist.txtPassword2.value == "") {
				alert("请输入确认密码");
				return false;
			}
			if (document.regist.txtEmail.value == "") {
				alert("邮箱不能为空");
				return false;
			}
			if (document.regist.txtPassword.value != document.regist.txtPassword2.value) {
				alert("两次输入的密码不一致");
				return false;
			}
		}
	</script>
	<%
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		ReaderInfo rinfo = new ReaderInfo();
		Reader reader = new Reader();
		if ("reg".equals(action)) {
			if (reader.isExistReaderInfo(request
					.getParameter("txtUserName"))) {
				out.println("<script>alert('用户已经存在');location.href=reader-regist.jsp';</script>");
			} else {
				rinfo.setReaderName(request.getParameter("txtUserName"));
				rinfo.setReaderPassword(request.getParameter("txtPassword"));
				rinfo.setReaderEmail(request.getParameter("txtEmail"));
				reader.insert(rinfo);
				out.println("<script>alert('注册成功，前往登陆'); location.href ='reader-login.jsp';</script>");
			}
		}
	%>
	<div class="context">
		<form id="Regist" name="regist" method="post"
			action="reader-regist.jsp?action=reg"
			onsubmit="return check(this)">
			<h2>读者注册</h2>
			<table>
				<tr>
					<td class="td"><en>*</en>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</td>
				</tr>
				<tr>
					<td><input class="input"type="text" name="txtUserName"id="txtUserName" /></td>
				</tr>
				<tr>
					<td class="td"><en>*</en>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
				</tr>
				<tr>
					<td><input class="input" type="password" name="txtPassword"id="txtPassword" /></td>
				</tr>
				<tr>
					<td class="td"><en>*</en>确认密码:</td>
				</tr>
				<tr>
					<td><input class="input" type="password" name="txtPassword2"id="txtPassword2" /></td>
				</tr>
				<tr>
					<td class="td"><en>*</en>E&nbsp;&nbsp;m&nbsp;&nbsp;a&nbsp;i&nbsp;l:</td>
				</tr>
				<tr>
					<td><input class="input" type="text" name="txtEmail"id="txtEmail" /></td>
				</tr>
				<tr>
					<td class="t" colspan="2">
						<input class="submit" type="submit"name="button" id="button" value="注册" />
						<input class="submit" type="reset" name="button2" id="button2"value="重置" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>