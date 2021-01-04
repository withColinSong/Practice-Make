<%@page import="com.web.NoticeVo.NoticeVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="../css/notice.css"/>
</head>
<body>
	<div class="container">
		<h1>게시판</h1>
		<table class="notice-table">
			<tr class="table-header">
				<th>NO</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
				<th>파일업로드</th>
			</tr>
			
			  
			<%-- 
				List<NoticeVo> list = (List<NoticeVo>)request.getAttribute("notice");
			
			for(NoticeVo n : list)	{
				pageContext.setAttribute("notice", n);
				
			%>
			--%>
			
			<c:forEach var="no" items="${notice }">
				<tr>
					<td>${no.id}</td>
					<td class="no-title"><a href="detail?id=${no.id }">${no.title }</a></td>
					<td>${no.writer_id}</td>
					<td>${no.regdate}</td>
					<td>${no.hit}</td>
					<td>${no.files}</td>
				</tr>
			</c:forEach>
			<%--  <% } %> --%>
			
			
		</table>
		<div class="pager">
			<input type="button" name="pager-btn" value="<">
			<c:forEach var="i" begin="0" end="4">
			<span><a href="">${i+1 }</a></span>
			</c:forEach>
			<input type="button" name="pager-btn" value=">">
		</div>
	</div>
</body>
</html>