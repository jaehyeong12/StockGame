<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="loginAction.jsp" method="post">
        아이디: <input type="text" name="userId" required>  
  

        비밀번호: <input type="password" name="userPw" required>  
  

        <input type="submit" value="로그인">
    </form>
      

    <a href="join.jsp">회원가입</a>
</body>
</html>