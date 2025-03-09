<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/saloon";
    String user = "root";
    String password = "";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    // Get package ID from request
    String packageId = request.getParameter("pid");
    String packageName = "";
    String packageDescription = "";
    String packagePrice = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        
        // Fetch package details
        String sql = "SELECT package_name, package_description, package_price FROM packages WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, packageId);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            packageName = rs.getString("package_name");
            packageDescription = rs.getString("package_description");
            packagePrice = rs.getString("package_price");
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
    <title>Update Package</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); width: 400px;">
        <h2 style="text-align: center; color: #333;">Update Package</h2>
        <form action="updatepackdata.jsp" method="post" style="display: flex; flex-direction: column; gap: 10px;">
            <input type="hidden" name="package_id" value="<%= packageId %>">
            
            <label style="font-weight: bold;">Package Name:</label>
            <input type="text" name="package_name" value="<%= packageName %>" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <label style="font-weight: bold;">Description:</label>
            <textarea name="package_description" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px; height: 80px;"><%= packageDescription %></textarea>
            
            <label style="font-weight: bold;">Price:</label>
            <input type="text" name="package_price" value="<%= packagePrice %>" required style="padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
            
            <input type="submit" value="Update Package" style="background: #007bff; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer; font-size: 16px;">
        </form>
    </div>
</body>
</html>
