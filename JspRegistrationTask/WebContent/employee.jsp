<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>employee_regis</title>
<style type="text/css">
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	font-family: 'Nunito', sans-serif;
	color: #384047;
}

form {
	max-width: 300px;
	margin: 10px auto;
	padding: 10px 20px;
	background: #f4f7f8;
	border-radius: 8px;
}

h1 {
	margin: 0 0 30px 0;
	text-align: center;
}

input[type="text"], input[type="password"], input[type="date"], input[type="datetime"],
	input[type="email"], input[type="number"], input[type="search"], input[type="tel"],
	input[type="time"], input[type="url"], textarea, select {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	font-size: 16px;
	height: auto;
	margin: 0;
	outline: 0;
	padding: 15px;
	width: 100%;
	background-color: #e8eeef;
	color: #8a97a0;
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
	margin-bottom: 30px;
}

input[type="radio"], input[type="checkbox"] {
	margin: 0 4px 8px 0;
}

select {
	padding: 6px;
	height: 32px;
	border-radius: 2px;
}

button {
	padding: 19px 39px 18px 39px;
	color: #FFF;
	background-color: #4bc970;
	font-size: 18px;
	text-align: center;
	font-style: normal;
	border-radius: 5px;
	width: 100%;
	border: 1px solid #3ac162;
	border-width: 1px 1px 3px;
	box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
	margin-bottom: 10px;
}

fieldset {
	margin-bottom: 30px;
	border: none;
}

legend {
	font-size: 1.4em;
	margin-bottom: 10px;
}

label {
	display: block;
	margin-bottom: 8px;
}

label.light {
	font-weight: 300;
	display: inline;
}

@media screen and (min-width: 480px) {
	form {
		max-width: 480px;
	}
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
	background-color: #ddd;
	color: black;
}
</style>
<script type="text/javascript">

function employeeValidate(){
	var name = document.getElementById("uname").value;
	var addr = document.getElementById("addr").value;
	var cmp = document.getElementById("cmp").value;
	var age = document.getElementById("age").value;
	var gender = document.getElementById("gender").value;
	var x=document.getElementById("mail").value;
	var atposition=x.indexOf("@");  
	var dotposition=x.lastIndexOf(".");  
	console.log(document.empreg.gender[0].checked);
	console.log(document.empreg.gender[1].checked);

	/* var domain = document.getElementByName("domain").value;
	var lang = document.getElementByName("lang").value; */
	
	if( name.length==null|| name==" " ||name.length<=3 ) {
		alert("Enter name");
		return false;
		} 
	
	if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
		  alert("Please enter a valid e-mail address" /* \n atpostion:"+atposition+"\n dotposition:"+dotposition */);  
		  return false;  
		  }
	
	 if(cmp.length==null || cmp.length==" "){
			alert("Company Is Empty !!");
			return false;
		}
	 
	 if(age.length==null || age.length==" "){
			alert("Age Is Empty  !!");
			return false;
		}
	 /* else if(/^[a-zA-Z]+$/.test(userid))	 {
			 alert("Age must be in number")
			 return false;
			 } */
	 
	  if ( (document.empreg.gender[0].checked == false)  && (document.empreg.gender[1].checked == false)  )
		  {
		  alert ( "Please choose your Gender: Male or Female" ); 
		  return false;
		  }
	  
	  if(addr.length==null || addr.length==" "){
			alert("Address Is Empty !!");
			return false;
		}
	  
	else{
		return true;
	}
}
</script>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<form action="employeeRegister" method="post" style="margin-top: 60px;" name="empreg">

		<h1>Employee Form</h1>

		<fieldset>
			<label for="name">Name:</label> 
			<input type="text" name="uname"	id="uname"> <label for="mail">Email:</label> 
			<input type="email" id="mail" name="mail"> <label for="password">Company:</label>
			<input type="text" name="company" id="cmp"> <label>Age:</label>
			<input type="number" id="age" name="age" min="1" max="110" maxlength="3"> 
			<label>Gender:</label>
			<input type="radio" id="gender" value="male" name="gender"> 
				<label for="under_13" class="light"> Male</label> 
			<input type="radio" id="gender" value="female" name="gender"> 
				<label for="over_13" class="light">Female</label>
		</fieldset>
		<fieldset>
			<label for="bio">Address:</label>
			<textarea name="address" id="addr"></textarea>
		</fieldset>
		<fieldset>
			<label for="job">Specialized Technology:</label> 
			 <select name="specialized" id="domain">
				<optgroup label="Web">
					<option value="html">HTML</option>
					<option value="php_developor">PHP</option>
					<option value="python_developer">Python</option>
					<option value="rails_developer">Rails</option>
					<option value="web_designer">Web Designer</option>
					<option value="WordPress_developer">WordPress Developer</option>
				</optgroup>
				<optgroup label="Mobile">
					<option value="Android_developer">Androild</option>
					<option value="iOS_developer">iOS</option>
					<option value="mobile_designer">Phone Gap</option>
				</optgroup>
				<optgroup label="Core_Tech">
					<option value="C">C</option>
					<option value="C++">C++</option>
					<option value="Java">Java</option>
					<option value=".Net">.Net</option>
				</optgroup>
			</select> 
			
		<label for="job">Languages:</label> 
			<select name="language"
				id="lang">
				<option value="hindi">Hindi</option>
				<option value="english">English</option>
				<option value="Marathi">Marathi</option>
				<option value="Punjabi">Punjabi</option>
				<option value="Telgu">Telgu</option>
				<option value="Tamil">Tamil</option>
				<option value="Bengali">Bengali</option>
				<option value="Oria">Oria</option>
			</select>

			<!-- <label>Interests:</label>
          <input type="checkbox" id="development" value="interest_development" name="user_interest"><label class="light" for="development">Development</label><br>
          <input type="checkbox" id="design" value="interest_design" name="user_interest"><label class="light" for="design">Design</label><br>
          <input type="checkbox" id="business" value="interest_business" name="user_interest"><label class="light" for="business">Business</label> -->
		</fieldset>
		<button type="submit" onclick="return employeeValidate()">Sign Up</button>
	</form>
</body>
</html>