<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="db.Database" %>

<%
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	User user = new User(userId, password, email);
	Database.addUser(user);
	
	response.sendRedirect("index.jsp");
%>