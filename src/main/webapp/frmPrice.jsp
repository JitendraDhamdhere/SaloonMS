<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Pricing Table</title>
    <%@ include file="includes/links.html"%>
    <%@ include file="includes/navbar.html"%>
    <%@include file="includes/conn.jsp"%>
    <script src="js/jquery.js"></script>
    <script src="js/form_val.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .pricing-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .pricing-table th, .pricing-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .pricing-table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        .pricing-table tr:hover {
            background-color: #f9f9f9;
        }
        .pricing-img {
            text-align: center;
            margin: 20px 0;
        }
        .pricing-img img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .pricing-box {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .pricing-box h3 {
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="yellow_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="title">
                        <h2>Pricing Table</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pricing Section -->
    <div class="pricing">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="pricing-box">
                        <h3>Packages</h3>
                        <table class="pricing-table">
                            <thead>
                                <tr>
                                    <th>Package Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                PreparedStatement ps = con.prepareStatement("SELECT * FROM packages");
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getString(2) %></td>
                                    <td>Rs.<%= rs.getString(5) %></td>
                                </tr>
                                <%
                                }
                                rs.close();
                                ps.close();
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Centered Image -->
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 pricing-img">
                    <figure>
                        <img src="images/vvv.png" alt="Pricing Image">
                    </figure>
                </div>

                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="pricing-box">
                        <h3>Services</h3>
                        <table class="pricing-table">
                            <thead>
                                <tr>
                                    <th>Service Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                PreparedStatement ps1 = con.prepareStatement("SELECT * FROM services");
                                ResultSet rs1 = ps1.executeQuery();
                                while (rs1.next()) {
                                %>
                                <tr>
                                    <td><%= rs1.getString(2) %></td>
                                    <td>Rs.<%= rs1.getString(5) %></td>
                                </tr>
                                <%
                                }
                                rs1.close();
                                ps1.close();
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.html"%>
    <%@ include file="includes/links2.html"%>
</body>
</html>