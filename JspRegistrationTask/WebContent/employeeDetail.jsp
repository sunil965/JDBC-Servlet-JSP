
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"
	import="java.util.*,java.sql.*,com.bridgeit.jsptask.DataBase"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	/* $(document).ready(function() {
		$(document).on("click", "#data", function(event) {
			var data = event.target.innerHTML;
			console.log(data);
		})
	}); */
	var get = function(name,address,email,comp,age,gender,spec,lang) {
		//console.log(name);
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
</head>

<body>
	<div align="right">
		<a href="employeeDetailCall"><button>Back</button></a> <a
			href="logoutServlet"><button>Logout</button></a>
	</div>
	<p>
		Request URI:<%=request.getRequestURI()%></p>
	<p>
		Protocol:
		<%=request.getProtocol()%></p>
	<p>
		PathInfo:
		<%=request.getPathInfo()%></p>
	<p>
		Remote Address:<%=request.getRemoteAddr()%></p>

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
	<p>Their is No Data Available</p>
	<a href="employeeDetailCall">ADD EMPLOYEE</a>
	<%
		} else {
	%>
	<div align="center">
		<h1>EMPLOYEES LIST</h1>
		<div class="container">
			<table border=1 width=15% height=75%>
				<%
					while (resultSet.next()) {
				%>
				<tr
					onclick="get('<%=resultSet.getString(2)%>', '<%=resultSet.getString(3)%>', '<%=resultSet.getString(4)%>', '<%=resultSet.getString(5)%>', '<%=resultSet.getInt(6)%>', '<%=resultSet.getString(7)%>',' <%=resultSet.getString(8)%>', '<%=resultSet.getString(9)%>')">
					<td align="center"><p id="some" data-toggle="modal"	data-target="#myModal"><%=resultSet.getString(2)%></p></td>
				</tr>
				<%
					}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						response.sendRedirect("userlogin.jsp");
					}
				%>
			</table>
		</div>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Edit information</h4>
					</div>

					<div class="modal-body">
						<div style="min-height: 30px; outline: none">
						<form action="updation" method="post">
						    Details Of:   <input type="text" name="email" id="email" readonly="readonly" size="25" style="border: none">
						<table>
						<tr>
						    <td>Name</td>	    <td align="right"><input type="text" name="name" id="name" style="border: none"></td>
						 </tr>
						 <tr>
						    <td>Address</td>	<td align="right"><input type="text" name="addr" id="addr" style="border: none"></td>
						 </tr>
						 <tr>
						    <td>Company</td>	<td align="right"><input type="text" name="company" id="company" style="border: none"></td>
						 </tr>
						 <tr>
						    <td>Age</td>		<td align="right"><input type="text" name="age" id="age" style="border: none"></td>
						 </tr>
						 <tr>
						    <td>Gender</td>		<td align="right"><input type="text" name="gender" id="gender" style="border: none"></td>
						 </tr>
						 <tr>
						    <td>Specialize</td>	<td align="right"><input type="text" name="spec" id="spec" style="border: none"></td>
						 </tr>
						 <tr>
						    <td>Language</td>	<td align="right"><input type="text" name="lang" id="lang" style="border: none"></td>
						 </tr>
						</table>
							<input type="submit"value= "Update">
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
</body>
<!-- <script type="text/javascript">
$(function() { $( "#dialog" ).dialog({ buttons: { OK: function() {$(this).dialog("close");}},
	                                   title: "Movie Title-Sholey",
	                                   position: { my: "center center", at: "center center" } });
             }
$( "#opener" ).click(function() { $( "#dialog" ).dialog( "open" );  });  });
</script> -->
</html>