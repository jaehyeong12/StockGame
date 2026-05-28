<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='./';</script>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <style>
        .container { width: 60%; margin: auto; padding-top: 50px; }
        input[type="text"], textarea { width: 100%; padding: 10px; margin-bottom: 10px; box-sizing: border-box; }
        textarea { height: 300px; resize: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>새 글 작성</h2>
        <form action="boardWriteAction.jsp" method="post">
            <input type="text" name="boardTitle" placeholder="제목" required>
            <textarea name="boardContent" placeholder="내용" required></textarea>
            <div style="text-align: right;">
                <input type="submit" value="등록">
                <button type="button" onclick="location.href='boardList.jsp'">취소</button>
            </div>
        </form>
    </div>
</body>
</html>