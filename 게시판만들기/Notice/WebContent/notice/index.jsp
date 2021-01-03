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
				<th>작성자</th>
				<th>제목</th>
				<th>작성날짜</th>
				<th>조회수</th>
				<th>파일업로드</th>
			</tr>
			<tr>
				<td>NO</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성날짜</td>
				<td>조회수</td>
				<td>파일업로드</td>
			</tr>
		</table>
	</div>
</body>
</html>