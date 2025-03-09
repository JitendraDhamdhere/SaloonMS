<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="../includes/conn.jsp"%>

<%
// Retrieve form parameters
String pid = request.getParameter("package_id");
String efeeStr = request.getParameter("package_price");
String edet = request.getParameter("package_description");

// Check if the price field is empty or null
if (efeeStr == null || efeeStr.trim().isEmpty()) {
	out.println(
	"<script>alert('Error: Price cannot be empty!'); location='frmupdatePack.jsp?pid=" + pid + "';</script>");
	return;
}

try {
	// Convert price to BigDecimal
	java.math.BigDecimal efee = new java.math.BigDecimal(efeeStr);

	// Prepare SQL update statement
	PreparedStatement ps = con
	.prepareStatement("UPDATE packages SET package_price=?, package_description=? WHERE id=?");
	ps.setBigDecimal(1, efee);
	ps.setString(2, edet);
	ps.setString(3, pid);

	// Execute update
	int x = ps.executeUpdate();
	if (x > 0) {
%>
<script>
	alert("Package Updated Successfully");
	location = "AdminDashboard.jsp";
</script>
<%
} else {
%>
<script>
	alert("Error in Updating Package");
	location = "AdminDashboard.jsp";
</script>
<%
}
} catch (NumberFormatException e) {
out.println(
		"<script>alert('Error: Invalid price format! Please enter a valid number.'); location='frmupdatePack.jsp?pid="
		+ pid + "';</script>");
} catch (Exception e) {
out.println("Error: " + e.getMessage());
}
%>
