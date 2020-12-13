<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	out.println(userId + " : " + password + " : " + email + " : ");
%>