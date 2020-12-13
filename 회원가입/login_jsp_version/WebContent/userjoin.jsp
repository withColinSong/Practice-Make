<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="css/login.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="commons/_head.jspf" %>
    <div class="content">
        <header class="header-content">
            <h1>회원가입</h1>
            <hr>
        </header>
        <form action="form.jsp" method="post" id="header-frm">
            <div class="frm-align">
                <label for="frm-io">이름</label>
                <input type="text" id="frm-io" name="userid">
            </div>

            <div class="frm-align">
                <label for="frm-io">연락처</label>
                <input type="password" id="frm-io" name="password">
            </div>
            <div class="frm-align">
                <label for="frm-io">이메일</label>
                <input type="text" id="frm-io" name="email">
            </div>
            <div class="frm-align">
                <input type="submit" value="회원가입" id="submit">
            </div>
        </form>
    </div>
</body>
</html>