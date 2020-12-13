
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="css/login.css" type="text/css" rel="stylesheet">
<%@include file="commons/_head.jspf" %>
<%@include file="header.jsp" %>

</head>
<body>
	    <div class="content">
        <header class="header-content">
            <h1>로그인</h1>
            <hr>
        </header>
        <form action="form.jsp" method="post" id="header-frm" name="frm">
            <div class="frm-align">
                <label for="frm-io">ID</label>
                <input type="text" id="frm-io" name="frm-info">
            </div>
            <div class="frm-align">
                <label for="frm-io">PW</label>
                <input type="password" id="frm-io" name="frm-info">
            </div>
            <div class="frm-align">
                <input type="submit" value="로그인" id="submit">
            </div>
        </form>
    </div>
</body>
</html>