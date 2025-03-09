<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="includes/conn.jsp"%>

<%
String serviceName = request.getParameter("serviceName");
if (serviceName != null && !serviceName.isEmpty()) {
	PreparedStatement ps = null;
	ResultSet rs = null;

	try {
		ps = con.prepareStatement("SELECT price FROM services WHERE service_name = ?");
		ps.setString(1, serviceName);
		rs = ps.executeQuery();

		while (rs.next()) {
%>
<option value="<%=rs.getString("price")%>"><%=rs.getString("price")%></option>
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