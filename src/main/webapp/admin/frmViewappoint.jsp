<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="../includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Appointments</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f8f9fa; margin: 0; padding: 20px;">
    <div style="max-width: 1000px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);">
        <h2 style="text-align: center; background: #ffc107; color: white; padding: 15px; border-radius: 5px;">View All Appointments</h2>
        <table style="width: 100%; border-collapse: collapse; margin-top: 20px; border: 1px solid #ddd;">
            <thead>
                <tr style="background-color: #343a40; color: white;">
                    <th style="padding: 10px; border: 1px solid #ddd;">No.</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">User Name</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Type</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Service/Package Name</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Appointment Date</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Appointment Time</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Location</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Price</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Status</th>
                    <th style="padding: 10px; border: 1px solid #ddd;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    // Fetch service appointments
                    PreparedStatement psService = con.prepareStatement("SELECT *, 'Service' AS type FROM appoint");
                    ResultSet rsService = psService.executeQuery();

                    // Fetch package appointments
                    PreparedStatement psPackage = con.prepareStatement("SELECT *, 'Package' AS type FROM package_appoint");
                    ResultSet rsPackage = psPackage.executeQuery();

                    int no = 1;

                    // Display service appointments
                    while (rsService.next()) {
                %>
                <tr style="background-color: #f8f9fa; text-align: center;">
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= no %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("uname") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("type") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("aname") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("adate") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("atime") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("aloc") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;">Rs.<%= rsService.getString("price") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsService.getString("astatus") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;">
                        <a href="frmStatus.jsp?type=service&aid=<%= rsService.getString("id") %>" style="display: inline-block; background: #ffc107; color: #000; text-decoration: none; padding: 5px 10px; border-radius: 3px;">Cancel</a>
                        <a href="frmBill.jsp?type=service&aid=<%= rsService.getString("id") %>" target="_blank" style="display: inline-block; background: #dc3545; color: white; text-decoration: none; padding: 5px 10px; border-radius: 3px;">Print</a>
                    </td>
                </tr>
                <%
                        no++;
                    }

                    // Display package appointments
                    while (rsPackage.next()) {
                %>
                <tr style="background-color: #f8f9fa; text-align: center;">
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= no %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("uname") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("type") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("pack_name") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("adate") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("atime") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("aloc") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;">Rs.<%= rsPackage.getString("price") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;"><%= rsPackage.getString("astatus") %></td>
                    <td style="padding: 10px; border: 1px solid #ddd;">
                        <a href="frmStatus.jsp?type=package&aid=<%= rsPackage.getString("id") %>" style="display: inline-block; background: #ffc107; color: #000; text-decoration: none; padding: 5px 10px; border-radius: 3px;">Cancel</a>
                        <a href="frmBill.jsp?type=package&aid=<%= rsPackage.getString("id") %>" target="_blank" style="display: inline-block; background: #dc3545; color: white; text-decoration: none; padding: 5px 10px; border-radius: 3px;">Print</a>
                    </td>
                </tr>
                <%
                        no++;
                    }

                    // Close resources
                    rsService.close();
                    psService.close();
                    rsPackage.close();
                    psPackage.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>