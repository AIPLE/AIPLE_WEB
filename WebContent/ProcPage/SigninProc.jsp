<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, beans.*"%>
<jsp:useBean id="memberMgr" class="memberControl.MemberMgr" />
<%
	LoginBean user_data = new LoginBean();
	user_data.setId(request.getParameter("id"));
	user_data.setPassword(request.getParameter("passwd"));
	
	if(user_data.getId().isEmpty() || user_data.getPassword().isEmpty()){
		%>
		<script>
			alert("아이디, 비밀번호 모두 입력해야합니다.");
			history.back();
		</script>
		<%
	}else if(memberMgr.loginCheck(user_data)){
		session.setAttribute("loginSession", user_data.getId());
		user_data = null; //리소스 해제
		%>
		<script>
		location.href="../Index.jsp";
		</script>
		<%
	}else{
		user_data = null; //리소스 해제
		session.setAttribute("loginSession", null);
		%>
		<script>
		alert("비밀번호 혹은 아이디가 다릅니다.");
		history.back();
		</script>
		<% 
	}
	
%>
