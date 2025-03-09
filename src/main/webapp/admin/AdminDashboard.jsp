<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="../includes/conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        h4 {
            font-family: Arial, Verdana;
            font-weight: 800;
            font-size: 26px;
            color: #091f2f;
            text-transform: uppercase;
            padding: 10px;
        }
        .fun {
            color: white;
            font-size: 20px;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .mar {
            margin-top: 20px;
        }
    </style>
    <script>
        function noBack() {
            window.history.forward();
        }
        noBack();
        window.onload = noBack;
        window.onpageshow = function(evt) {
            if (evt.persisted) noBack();
        }
        window.onunload = function() {
            void (0);
        }

        function addpack() {
            loadPage("frmAddPackage.jsp");
        }
        function addservices() {
            loadPage("frmAddservices.jsp");
        }
        function viewpack() {
            loadPage("frmViewpack.jsp");
        }
        function viewservices() {
            loadPage("frmViewservice.jsp");
        }
        function viewappoint() {
            loadPage("frmViewappoint.jsp");
        }
        function viewcontactus() {
            loadPage("frmlistcontactus.jsp");
        }
        function viewuser() {
            loadPage("frmViewuser.jsp");
        }
        function updatepack() {
            loadPage("frmupdatePack1.jsp");
        }

        function loadPage(page) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", page, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("frm").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
    <link href="dashboard.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-sidebar collapse" style="background-image: url(../images/chku.jpg)">
                <div class="sidebar-sticky pt-3 text-center" style="color: black">
                    <a class="navbar-brand btn-" href="AdminDashboard.jsp" style="background: padding:0px; color: gray">
                        <h4 class="text-center">ADMINSIDE</h4>
                    </a>
                    <br><br>
                    <ul class="nav flex-column">
                        <li class="nav-item mar"><a class="nav-link active fun btn btn-warning" href="#">Dashboard</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="addpack()">Add Packages</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="addservices()">Add Services</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="viewpack()">View Packages</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="viewservices()">View Services</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="viewappoint()">View Appointment</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="viewcontactus()">View Contact</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-warning" onclick="viewuser()">View All Users</a><br></li>
                        <li class="nav-item mar"><a class="nav-link fun btn btn-info" href="logout.jsp">Logout</a><br></li>
                    </ul>
                    <br>
                </div>
            </nav>
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom container bg-">
                    <a class="navbar-brand btn-" href="AdminDashboard.jsp" style="background: padding:0px; color: gray">
                        <h4 class="text-center">ADMINSIDE</h4>
                    </a>
                    <a class="nav-link fun btn btn-info float-left" href="logout.jsp">Logout</a>
                </div>
                <div id="frm">
                    <img src="../images/sallon.jpg" style="margin: 100px; height: 400px">
                </div>
            </main>
        </div>
    </div>
</body>
</html>