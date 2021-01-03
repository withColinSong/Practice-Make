# 1. 게시판 목록 만들기
![](https://images.velog.io/images/withcolinsong/post/083d4763-1959-4a50-b638-1261593cb8ff/image.png)

![](https://images.velog.io/images/withcolinsong/post/79323530-691d-440b-9eb7-ca065af9f3d3/image.png)

- 파일 경로

![](https://images.velog.io/images/withcolinsong/post/39b74fdc-7f4c-4317-b514-e6faf22abbca/image.png)

## 1. View - JSP
```jsp
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
```

## 2. Controll - Servlet
```java
package com.web.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.NoticeVo.NoticeVo;

@WebServlet("/notice/index")
public class Controller extends HttpServlet {
	public static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static String JDBC_USER = "song";
	public static String JDBC_PW = "1234";
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		
		String sql = "SELECT * FROM NOTICE";
		List<NoticeVo> list = new ArrayList<>();
		
		
		try {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PW); 
			 ps = conn.prepareStatement(sql);
			 rs = ps.executeQuery();
			
			while(rs.next()) {
				
				NoticeVo vo = new NoticeVo();
				vo.setId(rs.getInt("ID"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setWriter_id(rs.getString("WRITER_ID"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setRegdate(rs.getDate("REGDATE"));
				vo.setHit(rs.getInt("HIT"));
				vo.setFiles(rs.getString("FILES"));
				list.add(vo);	
			}
			
			System.out.println(list);
			request.setAttribute("notice", list);
			request.getRequestDispatcher("/notice/index.jsp").forward(request, response);
			
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sql 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}

}

```

## 3. MODEL
```java
package com.web.NoticeVo;

import java.util.Date;

public class NoticeVo {
	
	public NoticeVo() { }
	
	int id;
	String title;
	String writer_id;
	String content;
	Date regdate;
	int hit;
	String files;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	
	@Override
	public String toString() {
		return "NoticeVo [id=" + id + ", title=" + title + ", writer_id=" + writer_id + ", content=" + content
				+ ", regdate=" + regdate + ", hit=" + hit + ", files=" + files + "]";
	}
}

```

## 1.1 View : JSP
```java
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
			
			for(NoticeVo notice : list)	{
				pageContext.setAttribute("notice", notice);
				
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
```
## 추가 해야 할 항목
- JSTL를 이용하여 `view - jsp` Java Code를 없애기!