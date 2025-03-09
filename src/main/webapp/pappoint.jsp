<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Appointment</title>
<%@ include file="includes/links.html"%>
<%@ include file="includes/navbar2.html"%>

<script src="js/jquery.js"></script>
<script src="js/form_val.js"></script>

<script>
	function registerFinal() {
		if (subEmpty == 0) {
			document.getElementById("frmregi").submit();
		} else {
			alert("Enter all fields properly");
		}
	}

	function loadPrice(packageName) {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "loadpprice.jsp?package=" + packageName, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				document.getElementById("result1").innerHTML = xhr.responseText;
			}
		};
		xhr.send();
	}
</script>
</head>
<body>
	<div id="contact" class="contact my-">
		<div class="container">
			<div class="row">
				<div class="col-md-12 d-flex justify-content-center">
					<div class="title">
						<h2>
							Book Your <strong class="white">Appointment for</strong> Packages
						</h2>
					</div>
				</div>
			</div>

			<div class="row d-flex justify-content-center">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
					<form action="appointdata.jsp" method="get" id="frmregi">
						<div class="row">
							<%
							PreparedStatement ps = con.prepareStatement("SELECT package_name, package_price FROM packages");
							ResultSet rs = ps.executeQuery();
							%>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<select class="form-control" style="height: 50px" name="txtser"
									onchange="loadPrice(this.value)">
									<option value="">Select Package</option>
									<%
									while (rs.next()) {
									%>
									<option value="<%=rs.getString("package_name")%>"><%=rs.getString("package_name")%></option>
									<%
									}
									%>
								</select> <span class="text-danger wid" id="errser"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Price" type="text"
									id="result1" name="txtprice" readonly> <span
									class="text-danger wid" id="mberr"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Appointment Date"
									type="date" name="txtdate"> <span
									class="text-danger wid" id="errcity"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Appointment Time"
									type="text" name="txttime"> <span class="text-danger"
									id="errName"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<select class="form-control" style="height: 50px" name="txtarea">
									<option value="">--Choose Our Area--</option>
									<option value="Pune">Pune</option>
									<option value="Nashik">Nashik</option>
									<option value="Mumbai">Mumbai</option>
								</select> <span class="text-danger wid" id="errgen"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<button type="submit" class="send"
									style="background-color: gray; margin-left: 180px"
									onclick="registerFinal()">Book</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
					<div class="img-box">
						<figure>
							<img src="images/apo.png" width="500" height="400"
								style="border: 0;">
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
