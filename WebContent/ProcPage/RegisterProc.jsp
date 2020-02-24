<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beans.*"%>
<jsp:useBean id="Register" class="memberControl.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	RegisterBean user_data = new RegisterBean();
	user_data.setId(request.getParameter("id"));
	user_data.setPassword(request.getParameter("passwd"));
	user_data.setName(request.getParameter("name"));
	user_data.setEmail(request.getParameter("email"));
	user_data.setNickname(request.getParameter("nickname"));
	if(Register.memberInsert(user_data)){
		%>
		<script>
		alert("회원가입이 완료되었습니다.");
		location.href="../Index.jsp";
		</script>
		<%
	}else{
		 %>	
		<script>
		alert("비정상적인 접근 혹은 오류가 발생하였습니다.");
		history.back();
		</script>
		<%
	}
	user_data = null; //리소스 해제
%>