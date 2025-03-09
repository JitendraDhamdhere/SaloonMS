<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ include file="includes/conn.jsp"%>
<%@ page import="com.example.model.User"%>
<%
User user = (User) session.getAttribute("user");
String uname = (user != null) ? user.getCname() : "Guest";
String aname = request.getParameter("txtser");
String adate = request.getParameter("txtdate");
String atime = request.getParameter("txttime");
String aloc = request.getParameter("txtarea");
String price = request.getParameter("txtprice");
String astatus = "Pending";
try {
	String sql = "INSERT INTO appoint (aname, uname, adate, atime, aloc, price, astatus) VALUES (?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	ps.setString(1, aname);
	ps.setString(2, uname);
	ps.setString(3, adate);
	ps.setString(4, atime);
	ps.setString(5, aloc);
	ps.setString(6, price);
	ps.setString(7, astatus);

	int result = ps.executeUpdate();

	if (result > 0) {
		ResultSet generatedKeys = ps.getGeneratedKeys();
		int bookingId = -1;
		if (generatedKeys.next()) {
	bookingId = generatedKeys.getInt(1);
		}
		generatedKeys.close();
		response.sendRedirect("bookingSlip.jsp?bookingId=" + bookingId);
	} else {
%>
<script>
            alert("Failed to book appointment. Try again.");
            window.history.back(); 
        </script>
<%
}
ps.close();
} catch (Exception e) {
e.printStackTrace();
%>
<script>
        alert("Error: <%=e.getMessage()%>
	");
	window.history.back();
</script>
<%
}
%>