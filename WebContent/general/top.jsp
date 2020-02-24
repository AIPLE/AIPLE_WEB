<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="Index.jsp"><img alt="로고" src="image/logo.png" width="55px" height="55px"></a>
<link rel="stylesheet" href="css/darkmode.css">
<script>
	function myFunction() {
	  var element = document.body;
	  element.classList.toggle("dark-mode");
	}
</script>
<% if(session.getAttribute("loginSession") != null){%>
	<%=session.getAttribute("loginSession")%>님 안녕하세요.
	<a href="ProcPage/LogoutProc.jsp">로그아웃</a>
<%}else{%>
	<a href="signIn.jsp">로그인</a>
	<a href="signUp.jsp">회원가입</a>
<%}%>
<button onclick="myFunction()">Toggle mode</button>
