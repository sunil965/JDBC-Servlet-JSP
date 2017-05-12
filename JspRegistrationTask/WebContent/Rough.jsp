<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

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
	 $(document).ready(function(){
		$(document).on("click","#data",function(event){
		
			var data=event.target.innerHTML;
			console.log(data);
			 window.location.replace=("InformationTableJsp.jsp?m="+data);
 
		})
		
	}); 
	
</script>
</head>
<body>
	<%
		ResultSet rs = (ResultSet) session.getAttribute("data");
	%>

	<div class="container">
		<table class="table" align="center"	style="width: 52%; border: 2px solid black">
			<thead>
			<caption>
				<td colspan="2" style="background-color: cyan; padding: 10px; border: 2px solid black;">Employees
					Information</td>
			</caption>
			<tr	style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">
			   <th style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">Employees	Name</th>
			   <th style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">Employees	Id</th>
			</tr>
			<%
			int i=0;
				while (rs.next()) {
			%>
			<tr id="dont" style="background-color: #e3f2fd; padding: 10px; border: 2px solid black;">

				<td style="background-color: #ffe6e6; padding: 10px;"><p
						id="some" data-toggle="modal" data-target="#myModal"><%=rs.getString(1)%></p></td>
				<td style="background-color: #ffe6e6; padding: 10px;"><p
						id="data" data-toggle="modal" data-target="#myModal"><%=rs.getString(9)%></p></td>
				<%
					}
				%>

			</tr>
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

					<div contenteditable=true style="min-height: 30px; outline: none">

						<%
			String data="3012";
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;

			String qry = "select * from abc.formdata where ID=?";

			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=manoj");

				preparedStatement = connection.prepareStatement(qry);

				preparedStatement.setString(1, data);
				resultSet = preparedStatement.executeQuery();
                   
				while (resultSet.next()) {%>

						<%=resultSet.getString(1)%>
						<%=resultSet.getString(2)%>
						<%=resultSet.getString(3)%> 
						<%=resultSet.getString(4)%>
						<%=resultSet.getString(5)%>
						<%=resultSet.getString(6)%>
					    <%=resultSet.getString(7)%> 
						<%=resultSet.getString(9)%>
				
				
				<%}

			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();

				if (preparedStatement != null)
					try {
						preparedStatement.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
			}
			%>
					</div>

					<button>Update</button>
					<button>Delete</button>
				</div>
				<!-- <div class="modal-footer">
					 <button>Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div> -->
			</div>
</body>
</html>