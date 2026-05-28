<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stock.dao.UserDAO" %>
<%@ page import="com.stock.dto.UserDTO" %>
<%@ page import="com.stock.util.SHA256" %>
<%
    request.setCharacterEncoding("UTF-8");

    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    String userName = request.getParameter("userName");
    String userEmail = request.getParameter("userEmail");

    String encryptedPw = SHA256.getEncrypt(userPw);

    UserDTO user = new UserDTO();
    user.setUserId(userId);
    user.setUserPw(encryptedPw);
    user.setUserName(userName);
    user.setUserEmail(userEmail);

    UserDAO dao = new UserDAO();
    int result = dao.join(user);

    if (result == 1) {
        out.println("<script>alert('회원가입에 성공했습니다.'); location.href='login.jsp';</script>");
    } else {
        out.println("<script>alert('회원가입에 실패했습니다. (아이디 중복 등)'); history.back();</script>");
    }
%>