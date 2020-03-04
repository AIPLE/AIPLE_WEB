<%@page import="java.util.Random"%>
<%@ page import="memberControl.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="image/favicon.ico">
<link rel="icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>Aiple</title>
</head>
<body>
	<header>
		<jsp:include page="general/top.jsp" flush="false" />
	</header>
	<section>
		<div>
			레포 이동후 테스트 중입니다. 페이지를 새로고침해보세요.
			<%
				Random rand = new Random();
				for(int i = 0; i < 10; i++)
				{
			%>
			<br>
			<%=rand.nextInt()%>
			<%}%>
			<br>
			UUID 테스트
			<br>
			UUID : <p id="uuid"><%= request.getParameter("UUID") %></p>
			<form method="post" action="ProcPage/UUIDCreateProc.jsp">
				<input type="submit" value="UUID 발급">
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="general/bottom.jsp" flush="false" />
	</footer>
</body>
</html>
