<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Packages</title>
<style>
#user {
	padding: 20px;
}
</style>
</head>
<body>

	<%

	%>


	<%
	try {

		PreparedStatement ps = con.prepareStatement("select * from customer");
		ResultSet rs = ps.executeQuery();
		//rs.next();
		//int uid=Integer.parseInt(request.getParameter(rs.getString(2)));
		//int eid=Integer.parseInt(request.getParameter(rs.getString(3)));
	%>






	<div class="container px-lg-5 frm" style="margin-top: 50px">
		<div class="row mx-lg-n4">

			<div class="col py-3 px-lg-4 border bg-light">
				<form action=showtreker.jsp method=get>
					<h2 class="text-center bg-warning"
						style="background-color:; width: 100%; padding: 15px; text-align: center; color: white">View
						All Visitors</h2>

					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">No.</th>
								<th scope="col">Full name</th>
								<th scope="col">Mobile</th>
								<th scope="col">Email</th>
								<th scope="col">Address</th>


							</tr>
						</thead>
						<tbody>
							<tr>
								<%
								int no = (1);
								while (rs.next()) {
								%>



								<th scope="row"><%=no%></th>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(1)%></td>
								<td><%=rs.getString(6)%></td>

								<td><%=rs.getString(3)%>,<%=rs.getString(4)%>,<%=rs.getString(5)%></td>



								<%
								no = no + 1;
								%>
							</tr>

						</tbody>

						<%
						}
						%>
					</table>



				</form>

			</div>
		</div>
	</div>
	<br>
	<br>


	<%
	} catch (Exception e) {
	out.println(e);
	}
	%>





</body>

</body>
</html>