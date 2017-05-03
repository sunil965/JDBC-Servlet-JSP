<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="right"><a href="employeeDetails">Employee Details</a></div>
<div align="center">
 <h1>EMPLOYEE REGISTRATION</h1>
	<form action="employeeRegister" method="post">
		<!-- UID : <input type="text" name="uid"><br><br> -->
		Name :<input type="text" name="uname"><br><br>
		Email_ID :<input type="email" name="mail"><br><br>
		Address : <textarea rows="2" cols="20" name="address"></textarea><br><br>
		Company: <input type="text" name="company"><br><br>
		Age : <input type="text" name="age"><br><br>
		Gender : <input type="radio" name="gender" value="male" checked> Male
  				 <input type="radio" name="gender" value="female"> Female<br><br><br>
		Specialized : <select name="specialized">
						  <option value="">None</option>
						  <option value="C">C</option>
						  <option value="C++">C++</option>
						  <option value="C#">C#</option>
						  <option value="JAVA">JAVA</option>
						  <option value=".NET">.NET</option>
						  <option value="SQL">SQL</option>
						  <option value="ANDROID">ANDROID</option>
						  <option value="IOS">IOS</option>
						  <option value="PYTHON">PYTHON</option>
						  <option value="RUBY">RUBY</option>
						</select><br><br>
		Language : <select name="language">
						  <option value="">None</option>
						  <option value="Hindi">Hindi</option>
						  <option value="English">English</option>
						  <option value="Punjabi">Punjabi</option>
						  <option value="Marathi">Marathi</option>
						  <option value="Tamil">Tamil</option>
						  <option value="Telgu">Telgu</option>
						  <option value="Bangali">Bangali</option>
						  <option value="Odia">Odia</option>
						</select><br><br>
						<input type="submit">
	</form>
  </div>
</body>
</html>