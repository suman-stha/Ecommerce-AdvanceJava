<%@page import="com.learn.mycart.entities.User" %>
<%

User user =(User)session.getAttribute("current-user");
if(user==null){
	session.setAttribute("message", "You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
}
else{
	
	if(user.getUserType().equals("admin")){
		
		session.setAttribute("message", "You are not logged in ! Do not acess the page");
		response.sendRedirect("login.jsp");
		return;
	}
}



%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal page- MyStore</title>
<%@include file= "component/common.css.js.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>
<h1>This is normal page</h1>

</body>
</html>