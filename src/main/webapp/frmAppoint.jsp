<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Appointment</title>
<%@ include file="includes/conn.jsp"%>
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

	function loadcity(serviceName) {
		var ob = new XMLHttpRequest();
		ob.open("GET", "loadprice.jsp?serviceName=" + serviceName, true);
		ob.send();
		ob.onreadystatechange = function() {
			if (ob.readyState == 4 && ob.status == 200) {
				document.getElementById("result1").innerHTML = ob.responseText;
			}
		};
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
							Book Your <strong class="white">Appointment for Services</strong>
						</h2>
					</div>
				</div>
			</div>

			<div class="row d-flex justify-content-center">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
					<form action="appointdata.jsp" method="get" id="frmregi">
						<div class="row">
							<%
							PreparedStatement ps = con.prepareStatement("SELECT service_name FROM services");
							ResultSet rs = ps.executeQuery();
							%>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<select class="form-control" style="height: 50px" name="txtser"
									onchange="loadcity(this.value)"
									onblur="validateEmpty(this, document.getElementById('errser'), 'Select Appointment Services')">
									<option value="">Select Services</option>
									<%
									while (rs.next()) {
									%>
									<option value="<%=rs.getString("service_name")%>"><%=rs.getString("service_name")%></option>
									<%
									}
									rs.close();
									ps.close();
									%>
								</select> <span class="text-danger wid" id="errser"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<select class="form-control fun" style="height: 50px"
									id="result1" name="txtprice"
									onblur="validateEmpty(this, document.getElementById('mberr'), 'Select Price')">
									<option value="">Select Price</option>
								</select> <span class="text-danger wid" id="mberr"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Appointment Date"
									type="date" name="txtdate"
									onblur="validateEmpty(this, document.getElementById('errcity'), 'Select Appointment Date')">
								<span class="text-danger wid" id="errcity"></span>
							</div>

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Appointment Time"
									type="time" name="txttime"
									onblur="validateEmpty(this, document.getElementById('errName'), 'Enter the Time')"
									required> <span class="text-danger" id="errName"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<select class="form-control" style="height: 50px" name="txtarea"
									onblur="validateEmpty(this, document.getElementById('errgen'), 'Select the Location')">
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
	<%@ include file="includes/links2.html"%>
</body>
</html>