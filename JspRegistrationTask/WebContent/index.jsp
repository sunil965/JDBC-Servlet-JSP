<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
	margin-top: -50px;
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
	margin-top: -100px;
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
	height: 50px;
	width: 100%;
	background-color: gray;
}
</style>
<script type="text/javascript">
function userReg()
{
	var name=document.getElementById("uname").value;
	var userid=document.getElementById("uid").value;
	var pass=document.getElementById("pwd1").value;
	var x=document.getElementById("mailid").value;
	var atposition=x.indexOf("@");  
	var dotposition=x.lastIndexOf(".");  
	
	 if(userid==" "|| userid.length<3) {
		alert("Enter User ID Of Min Length 3 Digits");
		return false;
		} 
	 else if(/^[a-zA-Z]+$/.test(userid))	 {
		 alert("Userid must be in number")
		 return false;
		 }
	
	else if(name.length==null||name==" "||name.length<=3) {
		alert("Enter name ");
		return false;
		}
	
	else if(atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
		  alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
		  return false;  
		  } 
	else if(pass==""){
		alert("Enter Password");
		return false;
		}
		return true;
}


</script>
</head>

<body bgcolor="white">
	<div class="div" style="width: 100%; margin-top: -8px;">
		<font size="10px" color="white">Employee Forum</font>
	</div>
	<div class="login-page">
		<div class="form">
			<h3>User Register Page</h3>
			<form class="login-form" action="userreg" method="post"	onsubmit="return userReg()">
				<input type="text" name="uid" id="uid" placeholder="userid" maxlength="3"/>
				<input type="text" name="user" id="uname" placeholder="username" /> 
				<input type="text" name="mail" id="mailid" placeholder="email_id" /> 
				<input type="password" name="pwd" id="pwd1" placeholder="password" />
				<button>register</button>
				<p class="message">
					Already registered? <a href="loginJspCall">Sign In</a>
				</p>
			</form>
		</div>
	</div>
</body>

</html>