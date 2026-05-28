<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stock.dao.BoardDAO" %>
<%@ page import="com.stock.dto.BoardDTO" %>
<%
    // boardId가 넘어왔는지 확인
    String boardIdParam = request.getParameter("boardId");
    if (boardIdParam == null || boardIdParam.equals("")) {
        out.println("<script>alert('잘못된 접근입니다.'); location.href='boardList.jsp';</script>");
        return;
    }

    int boardId = Integer.parseInt(boardIdParam);
    BoardDAO dao = new BoardDAO();
    BoardDTO board = dao.getBoard(boardId);
    
    // 글이 존재하지 않는 경우 처리
    if (board == null) {
        out.println("<script>alert('존재하지 않는 게시글입니다.'); location.href='boardList.jsp';</script>");
        return;
    }
    
    String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= board.getBoardTitle() %></title>
</head>
<body>
    <div style="width: 80%; margin: auto;">
        <h2><%= board.getBoardTitle() %></h2>
        <p>작성자: <%= board.getUserId() %> | 조회수: <%= board.getBoardHit() %></p>
        <hr>
        <div style="min-height: 200px; padding: 10px; border: 1px solid #eee;">
            <%= board.getBoardContent().replace("\n", "") %>
        </div>
        <hr>
        <button onclick="location.href='boardList.jsp'">목록으로</button>
        <% if (userId != null && userId.equals(board.getUserId())) { %>
            <button onclick="if(confirm('삭제하시겠습니까?')) location.href='boardDeleteAction.jsp?boardId=<%= boardId %>'">삭제</button>
        <% } %>
    </div>
</body>
</html>