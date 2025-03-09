<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="includes/conn.jsp"%>
<%@ page import="com.example.model.User"%>

<%!String un, pass;%>

<%
un = request.getParameter("txtuname");
pass = request.getParameter("txtpass");

PreparedStatement ps = con.prepareStatement("SELECT * FROM `customer` WHERE uname=? AND upass=?");
ps.setString(1, un);
ps.setString(2, pass);

ResultSet rs = ps.executeQuery();

if (rs.next()) {
	User user = new User();
	user.setCmob(rs.getString("cmob"));
	user.setCname(rs.getString("cname"));
	user.setCadd(rs.getString("cadd"));
	user.setCarea(rs.getString("carea"));
	user.setCcity(rs.getString("ccity"));
	user.setEmail(rs.getString("email"));
	user.setUname(rs.getString("uname"));
	user.setUpass(rs.getString("upass"));
	user.setSecq(rs.getString("secq"));
	user.setAns(rs.getString("ans"));
	session.setAttribute("user", user);
%>
<script>
	alert("Login Successful");
	location = "CustDashboard.jsp";
</script>
<%
} else {
%>
<script>
	alert("Invalid Username or Password");
	location = "index.jsp";
</script>
<%
}
%>