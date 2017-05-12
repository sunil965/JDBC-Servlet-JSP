
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
	var get = function(name,a,b,c,d,e,f,g) {
		console.log(name);
		console.log(a);
		console.log(b);
		console.log(c);
		console.log(d);
		$("#dataOnDialog").html(name+"<br>"+a+"<br>"+b+"<br>");
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
		<h1>EMPLOYEES NAME CHART</h1>
		<div class="container">
			<table border=1 width=15% height=75%>
				<%
					while (resultSet.next()) {
				%>
				<tr
					onclick="get('<%=resultSet.getString(2)%>', '<%=resultSet.getString(3)%>', '<%=resultSet.getString(4)%>', '<%=resultSet.getString(5)%>', '<%=resultSet.getInt(6)%>', '<%=resultSet.getString(7)%>',' <%=resultSet.getString(8)%>', '<%=resultSet.getString(9)%>')">
					<td align="center"><p id="some" data-toggle="modal"
							data-target="#myModal"><%=resultSet.getString(2)%></p></td>
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
						<%
							out.print("Name\t Address\t Email_Id\t Company\t Age\t Gender\t Specialized\t Language");
						%>
						<div contenteditable=true style="min-height: 30px; outline: none">
							<div id="dataOnDialog"></div>
						</div>
						<button>Update</button>
						<button>Delete</button>
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