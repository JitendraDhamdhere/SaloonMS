<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal"%>
<%
// Database connection parameters
String url = "jdbc:mysql://localhost:3306/saloon";
String user = "root";
String password = "";

Connection conn = null;
PreparedStatement pstmt = null;

// Retrieve form parameters
String serviceId = request.getParameter("service_id");
String serviceName = request.getParameter("service_name");
String serviceDescription = request.getParameter("service_description");
String priceStr = request.getParameter("service_price");

// Check if the price field is empty or null
if (priceStr == null || priceStr.trim().isEmpty()) {
	out.println("<script>alert('Error: Price cannot be empty!'); location='frmupdateservice.jsp?id=" + serviceId
	+ "';</script>");
	return;
}

try {
	// Convert price to BigDecimal
	BigDecimal price = new BigDecimal(priceStr);

	// Establish database connection
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);

	// Prepare SQL update statement
	String sql = "UPDATE services SET service_name=?, service_description=?, price=? WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, serviceName);
	pstmt.setString(2, serviceDescription);
	pstmt.setBigDecimal(3, price);
	pstmt.setString(4, serviceId);

	// Execute update
	int rowsUpdated = pstmt.executeUpdate();
	if (rowsUpdated > 0) {
		out.println("<script>alert('Service Updated Successfully'); location='AdminDashboard.jsp';</script>");
	} else {
		out.println("<script>alert('Error in Updating Service'); location='AdminDashboard.jsp';</script>");
	}
} catch (NumberFormatException e) {
	out.println(
	"<script>alert('Error: Invalid price format! Please enter a valid number.'); location='frmupdateservice.jsp?id="
			+ serviceId + "';</script>");
} catch (Exception e) {
	out.println("Error: " + e.getMessage());
} finally {
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
}
%>