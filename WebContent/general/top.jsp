<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a>홈</a>
<% if(session.getAttribute("loginSession") != null){%>
	<%=session.getAttribute("loginSession")%>님 안녕하세요.
	<a href="ProcPage/LogoutProc.jsp">로그아웃</a>
<%}else{%>
	<a href="signIn.jsp">로그인</a>
	<a href="signUp.jsp">회원가입</a>
<%}%>
