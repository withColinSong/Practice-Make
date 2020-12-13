<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="commons/_head.jspf" %>
</head>

<body>
<%
	String inc = "index.jsp";
	if(request.getParameter("inc") != null) {
		inc = request.getParameter("inc");
	}
	


%>
    <div class="container">
       <!-- 헤더영역 -->
       <%@include file="header.jsp"%>
        <section>
            <h1>메인 페이지</h1>
        </section>
    </div>
</body>
</html>