<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="../includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us Details</title>
</head>
<body
	style="font-family: Arial, sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px;">
	<div
		style="max-width: 1000px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
		<h2
			style="text-align: center; background: #007bff; color: white; padding: 15px; border-radius: 5px;">Contact
			Us Details</h2>
		<table
			style="width: 100%; border-collapse: collapse; margin-top: 20px; border: 1px solid #ddd;">
			<thead>
				<tr style="background-color: #343a40; color: white;">
					<th style="padding: 10px; border: 1px solid #ddd;">Name</th>
					<th style="padding: 10px; border: 1px solid #ddd;">Email</th>
					<th style="padding: 10px; border: 1px solid #ddd;">Mobile</th>
					<th style="padding: 10px; border: 1px solid #ddd;">Message</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					// Fetch contact details from the database
					PreparedStatement ps = con.prepareStatement("SELECT * FROM contactus");
					ResultSet rs = ps.executeQuery();

					// Display contact details in the table
					while (rs.next()) {
				%>
				<tr style="background-color: #f8f9fa; text-align: center;">
					<td style="padding: 10px; border: 1px solid #ddd;"><%=rs.getString("name")%></td>

					<td style="padding: 10px; border: 1px solid #ddd;"><%=rs.getString("email")%></td>
					<td style="padding: 10px; border: 1px solid #ddd;"><%=rs.getString("mob")%></td>
					<td style="padding: 10px; border: 1px solid #ddd;"><%=rs.getString("u_msg")%></td>
				</tr>
				<%
				}

				// Close resources
				rs.close();
				ps.close();
				} catch (Exception e) {
				out.println("Error: " + e.getMessage());
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>