<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	if(application.getAttribute("darkmode").equals("true")){
		application.setAttribute("darkmode", "false");
	}else{
		application.setAttribute("darkmode", "true");
	}
}catch (NullPointerException e){
	application.setAttribute("darkmode", "true");
}finally{
	response.sendRedirect("../Index.jsp");
}
%>