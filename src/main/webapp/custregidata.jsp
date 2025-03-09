<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.text.*"%>
<%@ include file="includes/conn.jsp"%>

<%
// Retrieving user inputs
String cname = request.getParameter("cname"); // Customer Name
String uname = request.getParameter("uname"); // Username
String cmob = request.getParameter("cmob"); // Mobile Number
String email = request.getParameter("email"); // Email
String cadd = request.getParameter("cadd"); // Address
String carea = request.getParameter("carea"); // Area
String ccity = request.getParameter("ccity"); // City
String upass = request.getParameter("upass"); // Password
String secq = request.getParameter("secq"); // Security Question
String ans = request.getParameter("ans"); // Security Answer

try {
	PreparedStatement ps = con.prepareStatement(
	"INSERT INTO `customer`(`cmob`, `cname`, `uname`, `cadd`, `carea`, `ccity`, `email`, `upass`, `secq`, `ans`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

	// Setting values in the SQL query
	ps.setString(1, cmob); // cmob is the primary key
	ps.setString(2, cname);
	ps.setString(3, uname);
	ps.setString(4, cadd);
	ps.setString(5, carea);
	ps.setString(6, ccity);
	ps.setString(7, email);
	ps.setString(8, upass);
	ps.setString(9, secq);
	ps.setString(10, ans);

	int x = ps.executeUpdate();
	if (x > 0) {
%>
<script>
	alert("Registration Successful!");
	window.location.href = "frmLogin.jsp";
</script>
<%
} else {
%>
<script>
	alert("Error in Registration!");
	window.location.href = "frmRegister.jsp";
</script>
<%
}
} catch (Exception e) {
out.println("Error: " + e.getMessage());
}
%>