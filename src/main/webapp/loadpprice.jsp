<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="includes/conn.jsp"%>

<%
String packageName = request.getParameter("packageName");
if (packageName != null && !packageName.isEmpty()) {
	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		ps = con.prepareStatement("SELECT package_price FROM packages WHERE package_name = ?");
		ps.setString(1, packageName);
		rs = ps.executeQuery();

		while (rs.next()) {
%>
<option value="<%=rs.getString("package_price")%>"><%=rs.getString("package_price")%></option>
<%
}
} catch (Exception e) {
e.printStackTrace();
} finally {
if (rs != null)
rs.close();
if (ps != null)
ps.close();
}
}
%>