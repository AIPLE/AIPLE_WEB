<%@page import="java.util.Random"%>
<%@ page import="memberControl.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
			<%}
				String hash = request.getParameter("hash");
				String hash1 = "";
				if(hash!=null){
					hash1 = PBKDF2_Encryption.createHash(request.getParameter("hash"));
			%>	
			<br>
					<%=hash1%>
			<%}%>

			<form method="post" action="Index.jsp">
				<input type="text" name="hash" size="50">
				<input type="submit">
			</form>
			<form method="post" action="Index.jsp">
			origin
				<input type="text" name="origin" size="10">
			hash
				<input type="text" name="hash2" size="50">
				<input type="submit">
			</form>
			<%
			String hash2 = request.getParameter("hash2");
			String origin = request.getParameter("origin");
			if(hash2!=null && origin!=null){
			%>
			검증결과 :	<%=PBKDF2_Encryption.validatePassword(origin, hash2)%>
			<%}%>
		</div>
	</section>
	<footer>
		<jsp:include page="general/bottom.jsp" flush="false" />
	</footer>
</body>
</html>