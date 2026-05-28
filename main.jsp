<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
</head>
<body>
    <h2>환영합니다, <%= userId %>님!</h2>
    <p>실시간 주식 게임 시뮬레이션 화면입니다.</p>
    <a href="logout.jsp">로그아웃</a>
    <a href="boardList.jsp">찌라시 게시판 가기</a>
</body>
</html>