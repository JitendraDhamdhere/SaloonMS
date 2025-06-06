<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="includes/links.html"%>
<%@ include file="includes/navbar.html"%>
<%@ include file="includes/conn.jsp"%>
<title>Services</title>
</head>
<body>

	<div class="yellow_bg">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="title">
						<h2>Our service</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Service Section -->
	<div id="service" class="service">
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<%
				PreparedStatement ps = null;
				ResultSet rs = null;

				try {
					ps = con.prepareStatement("SELECT * FROM services");
					rs = ps.executeQuery();
				%>

				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container">
							<div class="carousel-caption">
								<div class="row">
									<%
									boolean hasServices = false;
									while (rs.next()) {
										hasServices = true;
									%>
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
										<div class="service_box" style="height: 300px">
											<figure>
												<%-- <img src="images/<%=rs.getString("service_image")%>"
													style="height: 170px; width: 300px"> --%>

												<img src="images/sallon.jpg"
													style="height: 150px; width: 300px">
											</figure>
											<h3><%=rs.getString("service_name")%></h3>
							
											<p><%=rs.getString("service_description")%></p>
											<h1><%=rs.getString("price")%></h1>
										</div>
									</div>
									<%
									}
									%>

									<%
									if (!hasServices) {
									%>
									<p>No services available.</p>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%
				} catch (Exception e) {
				out.println("<!-- Error fetching services: " + e.getMessage() + " -->");
				} finally {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				}
				%>

			</div>
		</div>
	</div>
	<!-- End Service Section -->

</body>

<%@ include file="includes/footer.html"%>
<%@ include file="includes/links2.html"%>

</html>
