
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, aboutAPI.*"%>
<%
	UUIDControl UID = new UUIDControl();
	String loginSession = (String)session.getAttribute("loginSession");
	Object result;
	if(loginSession == null){
		result = UID.createUUID("unknown:"+session.getId());
	}else{
		result = UID.createUUID("user:"+ loginSession);
	}
	if(result.equals("false")){
		response.sendRedirect("../Index.jsp?UUID=ERROR");
	}else{
		response.sendRedirect("../Index.jsp?UUID=" + result);
	}
	
%>