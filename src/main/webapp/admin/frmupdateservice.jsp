<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/saloon";
    String user = "root";
    String password = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // Get service ID from request
    String serviceId = request.getParameter("id");
    String serviceName = "";
    String serviceDescription = "";
    String servicePrice = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Fetch service details
        String sql = "SELECT service_name, service_description, price FROM services WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, serviceId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            serviceName = rs.getString("service_name");
            serviceDescription = rs.getString("service_description");
            servicePrice = rs.getString("price"); // Corrected column name
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Service</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); width: 400px;">
        <h2 style="text-align: center; color: #333;">Update Service</h2>
        <form action="updateservicedata.jsp" method="post" style="display: flex; flex-direction: column; gap: 10px;">
            <input type="hidden" name="service_id" value="<%= serviceId %>">
            
            <label style="font-weight: bold;">Service Name:</label>
            <input type="text" name="service_name" value="<%= serviceName %>" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <label style="font-weight: bold;">Description:</label>
            <textarea name="service_description" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px; height: 80px;"><%= serviceDescription %></textarea>
            
            <label style="font-weight: bold;">Price:</label>
            <input type="text" name="service_price" value="<%= servicePrice %>" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <input type="submit" value="Update Service" style="background: #007bff; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px;">
        </form>
    </div>
</body>
</html>