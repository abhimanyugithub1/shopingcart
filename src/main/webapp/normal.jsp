<%@page import="com.learn.mycart.entities.User"%>
<%

	User user=(User)session.getAttribute("current-user");
	if(user==null){
		
		session.setAttribute("message", "You are not Logged in !! Login First");
		response.sendRedirect("login.jsp");
		return;
	}else{
		
		if(user.getUserType().equals("admin")){
			session.setAttribute("message", "You are not normal ! Do not access this page");
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
<title>Normal Panel </title>
<%@include file ="components/common_css_js.jsp" %>

</head>
<body>

		<%@include file="components/navbar.jsp" %>

<h1>This is Normal Panel Page</h1>







<%@include file="components/common_modals.jsp" %>
</body>
</html>