<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stock.dao.BoardDAO" %>
<%@ page import="com.stock.dto.BoardDTO" %>
<%
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    String userId = (String) session.getAttribute("userId");
    BoardDAO dao = new BoardDAO();
    BoardDTO board = dao.getBoard(boardId);

    if (userId != null && userId.equals(board.getUserId())) {
        int result = dao.delete(boardId);
        if (result == 1) {
            out.println("<script>alert('삭제되었습니다.'); location.href='boardList.jsp';</script>");
        } else {
            out.println("<script>alert('삭제 실패'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('권한이 없습니다.'); history.back();</script>");
    }
%>