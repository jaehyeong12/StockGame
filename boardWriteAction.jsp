<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stock.dao.BoardDAO" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = (String) session.getAttribute("userId");
    String title = request.getParameter("boardTitle");
    String content = request.getParameter("boardContent");

    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='./';</script>");
    } else {
        BoardDAO dao = new BoardDAO();
        int result = dao.write(title, content, userId);
        if (result == 1) {
            out.println("<script>alert('등록되었습니다.'); location.href='boardList.jsp';</script>");
        } else {
            out.println("<script>alert('등록 실패'); history.back();</script>");
        }
    }
%>