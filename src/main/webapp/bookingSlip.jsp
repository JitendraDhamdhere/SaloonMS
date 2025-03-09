<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ include file="includes/conn.jsp"%>

<%
// Retrieve booking ID from request
String bookingId = request.getParameter("bookingId");

// Initialize variables to store booking details
String aname = "", uname = "", adate = "", atime = "", aloc = "", price = "", astatus = "";

if (bookingId != null && !bookingId.isEmpty()) {
	try {
		// Fetch booking details from the database
		String sql = "SELECT * FROM appoint WHERE id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bookingId);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
	aname = rs.getString("aname");
	uname = rs.getString("uname");
	adate = rs.getString("adate");
	atime = rs.getString("atime");
	aloc = rs.getString("aloc");
	price = rs.getString("price");
	astatus = rs.getString("astatus");
		}
		rs.close();
		ps.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Slip</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

.booking-slip {
	border: 1px solid #ccc;
	padding: 20px;
	max-width: 500px;
	margin: 0 auto;
	background-color: #f9f9f9;
}

.booking-slip h2 {
	text-align: center;
	color: #333;
}

.booking-slip p {
	margin: 10px 0;
}

.button-container {
	text-align: center;
	margin-top: 20px;
}

.button-container button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
	margin: 5px;
}

.button-container button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="booking-slip">
		<h2>Booking Details</h2>
		<p>
			<strong>Booking ID:</strong>
			<%=bookingId%></p>
		<p>
			<strong>User Name:</strong>
			<%=uname%></p>
		<p>
			<strong>Service Name:</strong>
			<%=aname%></p>
		<p>
			<strong>Appointment Date:</strong>
			<%=adate%></p>
		<p>
			<strong>Appointment Time:</strong>
			<%=atime%></p>
		<p>
			<strong>Location:</strong>
			<%=aloc%></p>
		<p>
			<strong>Price:</strong> Rs.<%=price%></p>
		<p>
			<strong>Status:</strong>
			<%=astatus%></p>
	</div>

	<div class="button-container">
		<!-- Print Button -->
		<button onclick="window.print()">Print Slip</button>
		<!-- Go Back to frmAppoint.jsp Button -->
		<button onclick="window.location.href='frmAppoint.jsp'">Go
			Back to Booking</button>
	</div>
</body>
</html>