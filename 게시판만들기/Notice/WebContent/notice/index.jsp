<%@page import="com.web.NoticeVo.NoticeVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>

.notice-table {
	border-top: 1px solid black;
	margin: 30px auto;
	width: 1000px;
	border-collapse: collapse;
}

th, tr {
	text-align: center;
	border-bottom: 1px solid black;
	width: 100px;
}

.table-header {
	height: 50px;
}


.container > h1 {
	text-align:center;
}
</style>
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
			
			<%
				List<NoticeVo> list = (List<NoticeVo>)request.getAttribute("notice");
			
			for(NoticeVo n : list)	{
				pageContext.setAttribute("notice", n);
				
			%>
			<tr>
				<td>${notice.id}</td>
				<td>${notice.title }</td>
				<td>${notice.writer_id}</td>
				<td>${notice.regdate}</td>
				<td>${notice.hit}</td>
				<td>${notice.files}</td>
			</tr>
			<% } %>
		</table>
	</div>
</body>
</html>