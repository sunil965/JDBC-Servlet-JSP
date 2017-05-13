<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #43A047;
}

.form .message {
	margin: 15px 0 0;
	color: #b3b3b3;
	font-size: 15px;
}

.form .message a {
	color: #4CAF50;
	text-decoration: none;
}

.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}

.div {
	background-color: gray;
	overflow: hidden;
}

.div a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.div a:hover {
	height: 50px;
	background-color: #ddd;
	color: black;
}
</style>

<script type="text/javascript">
	$('.message a').click(function() {
		$('form').animate({
			height : "toggle",
			opacity : "toggle"
		}, "slow");
	});
	
	function userLogin(){var pass=document.getElementById("pwd").value;
		var mail= document.getElementById("mailid").value;
		var atposition=mail.indexOf("@");  
		var dotposition=mail.lastIndexOf(".");  
		
		if (atposition<1 || dotposition<atposition+2 || dotposition +2 >= mail.length){  
			  alert("Please enter a valid e-mail address");  
			  return false;  		  }  
		if(pass.length==null||pass==" "||pass.length<=3)
		{
		alert("Enter Password");
		return false;
		}	
		else {		return true;		}
	}
</script>

</head>

<body bgcolor="white">
	
	<a href="" style="text-decoration: none"><font
			color="white"></font></a>
		<%
			Integer uid = (Integer) session.getAttribute("userid");
			if (uid != null) {
		%>
		<a href="employeeDetails" style="text-decoration: none"><font
			color="white">Employee Details</font></a>
		<a href="logoutServlet" style="text-decoration: none"><font
			color="white">Logout</font></a>
		<%
			}
		%>
	</div>
	<div class="login-page">
		<div class="form">

			<h3>Login Form Page</h3>
			<form class="login-form" action="userlogin" method="post"
				onsubmit="return userLogin()">
				<input type="text" name="mail" id="mailid" placeholder="username" />
				<input type="password" name="pwd" id="pwd" placeholder="password" />
				<button>login</button>
				<p class="message">
					Not registered? <a href="preServlet">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>