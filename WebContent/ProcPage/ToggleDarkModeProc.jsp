<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	if(session.getAttribute("darkmode").equals("true")){
		session.setAttribute("darkmode", "false");
	}else{
		session.setAttribute("darkmode", "true");
	}
}catch (NullPointerException e){
	session.setAttribute("darkmode", "true");
}finally{
	response.sendRedirect("../Index.jsp");
}
%>