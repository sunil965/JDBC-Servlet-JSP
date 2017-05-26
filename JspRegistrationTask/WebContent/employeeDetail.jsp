<%@page contentType="text/html" pageEncoding="UTF-8" language="java"
	import="java.util.*,java.sql.*,com.bridgeit.jsptask.DataBase"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	/* $(document).ready(function() {
		$(document).on("click", "#data", function(event) {
			var data = event.target.innerHTML;
			console.log(data);
		})
	}); */
	var userid;
	var get = function(name, address, email, comp, age, gender, spec, lang) {
		userid=email;
		$("#delkey").val(userid);
		$("#name").val(name);
		$("#addr").val(address);
		$("#email").val(email);
		$("#company").val(comp);
		$("#age").val(age);
		$("#gender").val(gender);
		$("#spec").val(spec);
		$("#lang").val(lang);
	}
</script>

<style type="text/css">

  @import "compass/css3";
  @import "compass/css3";
  @import url(https://fonts.googleapis.com/css?family=Patua+One|Open+Sans);

  * {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
  	box-sizing: border-box;
  }

  body {
    background-color:grey;
  }

  table {
    width: 50%;
    border-collapse: separate;
    background:#fff;
    @include border-radius(5px);
    margin:50px auto;
    @include box-shadow(0px 0px 5px rgba(0,0,0,0.3));
  }

  thead {
      background:#353a40;
    @include border-radius(5px);
  }

  thead th {
    font-family: 'Patua One', cursive;
    font-size:16px;
    font-weight:400;
    color:#fff;
    @include text-shadow(1px 1px 0px rgba(0,0,0,0.5));
    text-align:center;
    padding:20px;
    @include background-image(linear-gradient(#646f7f, #4a5564));
    border-top:1px solid #858d99;

    &:first-child {
     @include border-top-left-radius(5px);
    }

    &:last-child {
      @include border-top-right-radius(5px);
    }
  }

  tbody tr td {
    text-align:center;
    font-family: 'Open Sans', sans-serif;
    font-weight:400;
    color:#5f6062;
    font-size:13px;
    padding:20px 20px 20px 20px;
    border-bottom:1px solid #e0e0e0;

  }

  tbody tr:nth-child(2n) {
    background:#f0f3f5;
  }

  tbody tr:last-child td {
    border-bottom:none;
    &:first-child {
      @include border-bottom-left-radius(5px);
    }
    &:last-child {
      @include border-bottom-right-radius(5px);
    }
  }

  tbody:hover > tr td {
    @include opacity(0.5);

    /* uncomment for blur effect */
    /* color:transparent;
    @include text-shadow(0px 0px 2px rgba(0,0,0,0.8));*/
  }

  tbody:hover > tr:hover td {
    @include text-shadow(none);
    color:#2d2d2d;
    @include opacity(1.0);
  }
  

	.heading{
		border: none;
		text-align:center;
		font-size: 35px;
	}
	#ok, #cancel{ 	margin-bottom: 4%;	}
	p {	text-align: center;}
	
	#p1toggle2{
		    margin: 0 0 10px;
   			margin-top: 42px;
	}
	/* table{
	border: none;
	}
	tbody{
	border: white!important;
	} */
	
</style>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<%-- 	<p>
		Request URI:<%=request.getRequestURI()%></p>
	<p>
		Protocol:	<%=request.getProtocol()%></p>
	<p>
		PathInfo:	<%=request.getPathInfo()%></p>
	<p>
		Remote Address:<%=request.getRemoteAddr()%></p>
 --%>
	<%
		Integer uid = (Integer) session.getAttribute("userid");
		if (uid != null) {
			Connection conn = DataBase.connect();
			PreparedStatement statement = null;
			try {
				statement = conn.prepareStatement("Select * from EmployeeTable where uid =?");
				statement.setInt(1, uid);
				ResultSet resultSet = statement.executeQuery();
				if (!resultSet.isBeforeFirst()) {
	%>
	<div align="center">
		<p align="center">Their is No Data Available</p>
		<a href="employeeDetailCall" align="center">ADD EMPLOYEE</a>
	</div>
				<%
					} else {
				%>
	<div align="center" style="margin-top: 80px;">
		<h1>Registered Employees</h1>
		<div class="container" style="margin-top: -45px;
		">
			<table border=1 width=50% height=75%>
				<thead>
		          <tr>
			          <th>Sr.</th>
	                  <th>Name</th>
                  </tr>
   				</thead>
				<%  int count=1;
					while (resultSet.next()) {
				%>
				<tbody>
				<tr
					onclick="get('<%=resultSet.getString(2)%>', '<%=resultSet.getString(3)%>', '<%=resultSet.getString(4)%>', '<%=resultSet.getString(5)%>', '<%=resultSet.getInt(6)%>', '<%=resultSet.getString(7)%>',' <%=resultSet.getString(8)%>', '<%=resultSet.getString(9)%>')">
					<td width="50px" align="center"><%=count%></td>
					<td><p style="padding-left: 0px" data-toggle="modal" data-target="#myModal"><%=resultSet.getString(2)%></p></td>
				</tr>
				</tbody>
				<%
				count++;}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						response.sendRedirect("loginJspCall");
					}
				%>
			</table>
		</div>
		
		
		
<!-------------------------- 		Pop-up Window To Edit Informations By Clicking On A Particular Name. ----------------------->		
		
		<div style="margin-top: 35px" class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="background-color: #F9E2CE">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit Information</h4>
					</div>

					<div class="modal-body">
						<div style="min-height: 30px; outline: none">
							<form action="updation" method="post">
								<div >
									<input  type="text" name="email" id="email"
									  class="heading"	readonly="readonly" width="100%" >
								</div>

								<table>
							
									<tr>
										<td>Name</td>
										<td align="right"><input type="text" name="name" id="name" style="border: none"></td>
									</tr>
									<tr>
										<td>Address</td>
										<td align="right"><input type="text" name="addr" id="addr" style="border: none; padding-left: 20px"></td>
									</tr>
									<tr>
										<td>Company</td>
										<td align="right"><input type="text" name="company"	id="company" style="border: none"></td>
									</tr>
									<tr>
										<td>Age</td>
										<td align="right"><input type="text" name="age" id="age" style="border: none"></td>
									</tr>
									<tr>
										<td>Gender</td>
										<td align="right"><input type="text" name="gender" id="gender" style="border: none"></td>
									</tr>
									<tr>
										<td>Specialize</td>
										<td align="right"><input type="text" name="spec" id="spec" style="border: none; padding-left: 0px"></td>
									</tr>
									<tr>
										<td>Language</td>
										<td align="right"><input type="text" name="lang" id="lang" style="border: none"></td>
									</tr>
						
								</table>
								<input type="submit" class="btn btn-success" value="Update">
								<input type="button" class="btn btn-danger" value="Delete" data-toggle="modal" data-target="#delete">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


<!--------------------------------- 		Pop-up Window To Delete Employee.      --------------------------------->		

		<div class="modal fade" id="delete" role="dialog">
			<div class="modal-dialog" >
			  <div class="modal-content" style="width: 70%;margin-top: 250px;">
				<div id="del"  style="background-color: #E9F0D7">
					<p id="p1toggle2">Are you sure to delete it permanently ?</p>
					<form action="deletion" method="post">
						<input type="hidden" name="delkey" id="delkey">
						<button id="ok" class="btn btn-danger" style="width: 77px">OK</button>
						<button id="cancel" class="btn btn-info" data-dismiss="modal">Cancel</button>
					</form>
				</div>
			  </div>
			</div>
		</div>
	</div>
</body>
</html>