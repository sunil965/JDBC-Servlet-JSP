<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript" src="validate.js"></script>

</head>
<body>
	<div align="right">
		<a href="userlogin.jsp">Sign in.</a>
	</div>
	<div align="center">
		<h1>USER REGISTRATION</h1>
		<form name="myform" action="userreg" method="post" onsubmit="return validateUserReg()">
			<table>
				<tr>
					<td>User_ID</td>
					<td><input type="text" name="uid"></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><input type="text" name="user"></td>
				</tr>
				<tr>
					<td>Email_ID</td>
					<td><input type="text" name="mail"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td><input type="submit"></td>
					<!-- class="btn btn-sm btn-success" -->
					<td><input type="reset"></td>
				</tr>
			</table>

		</form>
		<h4>If Registered Then Login.</h4>
	</div>
</html>