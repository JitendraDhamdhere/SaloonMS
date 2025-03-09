<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@ include file="includes/links.html"%>
<%@ include file="includes/navbar.html"%>

<script src="js/jquery.js"></script>
<script src="js/form_val.js"></script>

</head>
<body>
	<div id="contact" class="contact my-">
		<div class="container">
			<div class="row">
				<div class="col-md-12 d-flex justify-content-center">
					<div class="title">
						<h2>
							Registration<strong class="white"> On</strong>
						</h2>
					</div>
				</div>
			</div>

			<div class="row d-flex justify-content-center">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
					<form action="custregidata.jsp" method="post" id="frmregi">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Full Name" type="text"
									name="cname" required> <span class="text-danger"
									id="errName"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="User Name" type="text"
									name="uname" required> <span class="text-danger wid"
									id="erruName"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Password"
									type="password" name="upass" required> <span
									class="text-danger wid" id="emailPass"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Phone Number"
									type="text" name="cmob" required> <span
									class="text-danger wid" id="errMob"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Email" type="email"
									name="email" required> <span class="text-danger wid"
									id="emailErr"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<textarea class="textarea" placeholder="Address" name="cadd"
									required></textarea>
								<span class="text-danger wid" id="erradd"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Area" type="text"
									name="carea" required> <span class="text-danger wid"
									id="errland"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="City" type="text"
									name="ccity" required> <span class="text-danger wid"
									id="errcity"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Security Question"
									type="text" name="secq" required> <span
									class="text-danger wid" id="errsecq"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<input class="form-control" placeholder="Security Answer"
									type="text" name="ans" required> <span
									class="text-danger wid" id="errans"></span>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
								<button type="submit" class="send"
									style="background-color: gray; margin-left: 180px">Register</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row my-4">
				<div class="col-md-12 d-flex justify-content-center">
					<div class="title">
						<h2>
							<a href="frmLogin.jsp" style="font-size: 20px; color: white">Login
								Now</a>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="includes/links2.html"%>
</body>
</html>