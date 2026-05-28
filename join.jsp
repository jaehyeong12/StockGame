<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="joinAction.jsp" method="post">
        아이디: <input type="text" name="userId" required>  
  

        비밀번호: <input type="password" name="userPw" required>  
  

        이름: <input type="text" name="userName" required>  
  

        이메일: <input type="email" name="userEmail" required>  
  

        <input type="submit" value="가입하기">
    </form>
      

    <a href="login.jsp">로그인 페이지로</a>
</body>
</html>