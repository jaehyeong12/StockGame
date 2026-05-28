<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stock.dao.UserDAO" %>
<%@ page import="com.stock.util.SHA256" %>
<%
    request.setCharacterEncoding("UTF-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

    String encryptedPw = SHA256.getEncrypt(userPw);

    UserDAO dao = new UserDAO();
    int result = dao.login(userId, encryptedPw);

    if (result == 1) {
        session.setAttribute("userId", userId);
        out.println("<script>alert('로그인 성공!'); location.href='main.jsp';</script>");
    } else if (result == 0) {
        out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
    } else if (result == -1) {
        out.println("<script>alert('존재하지 않는 아이디입니다.'); history.back();</script>");
    } else {
        out.println("<script>alert('데이터베이스 오류가 발생했습니다.'); history.back();</script>");
    }
%>