<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 확인</title>
<link rel="stylesheet" href="../css/detail.css"/>
</head>

<body>
	<div class="container">
		<table class="notice-table">
				
				<tr class="table-hit table-css">
					<th>조회수</th>
					<td>${list.hit }</td>
					<th>파일업로드</th>
					<td>${list.files }</td>
				</tr>
				<tr class="table-header table-css">
					<th>NO</th>
					<td>${list.id}</td>
					<th>작성자</th>
					<td>${list.writer_id }</td>
					
				</tr>
				<tr class="table-title table-css">
					<th>제목</th>
					<td colspan="4">${list.title }</td>
				</tr>
				<tr class="table-content table-css">
					<td colspan="4">${list.content }</td>
				</tr>
		</table>
		<div class="list">
			<a href="../notice/index"><input type="button" name="from-list" value="목록"></a>
		</div>
		
	</div>
</body>
</html>