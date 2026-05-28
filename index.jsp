<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    String userId = (String) session.getAttribute("userId");
    if (userId != null) {
%>
        <jsp:forward page="main.jsp" />
<%
    } else {
%>
        <jsp:forward page="login.jsp" />
<%
    }
%>