<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/saloon"; // Change database name if needed
    String user = "root";  // Your DB username
    String password = "";  // Your DB password

    // Retrieve form data
    String packageName = request.getParameter("package_name");
    String packageDescription = request.getParameter("package_description");
    String packagePrice = request.getParameter("package_price");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        conn = DriverManager.getConnection(url, user, password);

        // SQL Insert Query (storing image as NULL)
        String sql = "INSERT INTO packages (package_name, package_description, package_price, package_image) VALUES (?, ?, ?, NULL)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, packageName);
        pstmt.setString(2, packageDescription);
        pstmt.setBigDecimal(3, new java.math.BigDecimal(packagePrice));

        // Execute query
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
