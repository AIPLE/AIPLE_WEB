<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, aboutAPI.*"%>
<%
	UUIDControl uid = new UUIDControl();
	SocketCommunicate.sendSocketData(uid.createUUID("TestUUID").toString());
%>