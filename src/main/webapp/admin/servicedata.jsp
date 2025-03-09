<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/saloon"; // Change database name if needed
    String user = "root";  
    String password = "";  

    String serviceName = request.getParameter("service_name");
    String serviceDescription = request.getParameter("service_description");
    String price = request.getParameter("price");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO services (service_name, service_description, price, service_image) VALUES (?, ?, ?, NULL)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, serviceName);
        pstmt.setString(2, serviceDescription);
        pstmt.setBigDecimal(3, new java.math.BigDecimal(price));

        int row = pstmt.executeUpdate();
        if (row > 0) {
            response.sendRedirect("AdminDashboard.jsp");
        } else {
            response.sendRedirect("AdminDashboard.jsp");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
