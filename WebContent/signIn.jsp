<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<jsp:include page="general/top.jsp" flush="false" />
	</header>
	<section>
		<form action="ProcPage/SigninProc.jsp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="text" name="passwd"><br>
		<input type="submit" value="signin">
		</form>
	</section>
	<footer>
		<jsp:include page="general/bottom.jsp" flush="false" />
	</footer>
</body>
</html>