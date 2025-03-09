<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="../includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Receipt</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        .shadow {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .text-bold {
            font-weight: bold;
        }
        .text-muted {
            color: #6c757d;
        }
        .zoom {
            padding: 10px;
            background-color: #b3edf2;
            transition: transform .2s;
            width: 300px;
            height: 60px;
            margin: 0 auto;
        }
        .zoom:hover {
            transform: scale(1.6);
            color: white;
        }
        .form-text {
            color: red;
        }
    </style>
</head>
<body>
    <%
    int pid = Integer.parseInt(request.getParameter("aid"));

    // Fetch appointment details
    PreparedStatement ps = con.prepareStatement("SELECT * FROM appoint WHERE id = ?");
    ps.setInt(1, pid);
    ResultSet rs = ps.executeQuery();

    // Update appointment status to "complete"
    PreparedStatement ps1 = con.prepareStatement("UPDATE appoint SET astatus = ? WHERE id = ?");
    ps1.setString(1, "complete");
    ps1.setInt(2, pid);
    ps1.executeUpdate();
    ps1.close();
    %>

    <div class="container my-4">
        <div class="row justify-content-center">
            <div class="col-12 shadow p-3 mb-5 bg-white">
                <h1 class="text-center">Your Order Details</h1>
                <hr>
                <%
                if (rs.next()) {
                %>
                <p class="text-left text-bold">Bill No: <%= rs.getInt("id") %></p>
                <p class="text-left">Bill Date: <%= rs.getString("adate") %></p>
                <h5 class="text-right">Customer Details</h5>
                <p class="text-right">Name: <span class="text-muted"><%= rs.getString("uname") %></span></p>
                <p class="text-right">Location: <span class="text-muted"><%= rs.getString("aloc") %></span></p>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Service Name</th>
                            <th scope="col">Price (Rs.)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td><%= rs.getString("aname") %></td>
                            <td><%= rs.getBigDecimal("price") %></td>
                        </tr>
                    </tbody>
                </table>
                <%
                }
                rs.close();
                ps.close();
                %>
            </div>
            <div class="text-center mt-5 mb-5">
                <button onclick="window.print()" class="btn btn-primary">Print Receipt</button>
                <button onclick="window.location.href='AdminDashboard.jsp'" class="btn btn-secondary">Go Back to Booking</button>
            </div>
        </div>
    </div>
</body>
</html>