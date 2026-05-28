<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.stock.dao.BoardDAO" %>
<%@ page import="com.stock.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%
    // 세션에서 로그인 아이디 가져오기
    String userId = (String) session.getAttribute("userId");
    
    // DB에서 게시글 목록 가져오기
    BoardDAO dao = new BoardDAO();
    ArrayList<BoardDTO> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찌라시 게시판</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        tr:hover { background-color: #f5f5f5; }
        .container { width: 80%; margin: auto; }
    </style>
</head>
<body>
    <div class="container">
        <h2>찌라시 게시판</h2>
        <p>접속 아이디: <b><%= (userId != null) ? userId : "비회원" %></b></p>
        
        <table>
            <thead>
                <tr>
                    <th width="10%">번호</th>
                    <th width="50%">제목</th>
                    <th width="15%">작성자</th>
                    <th width="15%">작성일</th>
                    <th width="10%">조회수</th>
                </tr>
            </thead>
            <tbody>
                <% if (list.size() == 0) { %>
                    <tr>
                        <td colspan="5">등록된 게시글이 없습니다.</td>
                    </tr>
                <% } else { 
                    for (BoardDTO board : list) { %>
                    <tr>
                        <td><%= board.getBoardId() %></td>
                        <td style="text-align: left;">
                            <a href="boardView.jsp?boardId=<%= board.getBoardId() %>">
                                <%= board.getBoardTitle() %>
                            </a>
                        </td>
                        <td><%= board.getUserId() %></td>
                        <td><%= board.getRegDate() %></td>
                        <td><%= board.getBoardHit() %></td>
                    </tr>
                <%  } 
                } %>
            </tbody>
        </table>
        
          

        <div style="text-align: right;">
            <% if (userId != null) { %>
                <button onclick="location.href='boardWrite.jsp'">글쓰기</button>
            <% } %>
            <button onclick="location.href='./'">메인으로</button>
        </div>
    </div>
</body>
</html>