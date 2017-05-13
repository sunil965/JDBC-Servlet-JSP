<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<body>
	<nav class="navbar navbar-light" style="background-color: #bcbdb4;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Empl0ee F0rum</a>
		</div>
		<ul class="nav navbar-nav">
			<%if(session.getAttribute("userid")!=null) {%>
			<li><a href="employeeDetails">Modify Employee</a></li>
			<%} %>
			
			
			
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<%if(session.getAttribute("userid")==null){ %>
			<li><a href="signup"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>

			<%} %>
			<%if(session.getAttribute("userid")==null){ %>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
			<%} %>
			
			<%if(session.getAttribute("userid")!=null){%>
			<li><a href="logoutServlet"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
			<% }%>
		</ul>
	</div>
	</nav>
</body>
</html>