<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
	String data=Utilty.readCookie(request, "user");
	if(DataValidator.isNullOrEmpty(data)){
		response.sendRedirect("../novel/index.jsp");
	}else{
		Utilty.writeCookie(response, "user", data, 0);
		response.sendRedirect("../novel/index.jsp");
	}
%>