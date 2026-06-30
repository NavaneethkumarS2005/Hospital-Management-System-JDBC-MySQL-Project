
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String doctor =
(String) session.getAttribute("doctor");

if(doctor == null) {

    response.sendRedirect("doctorLogin.jsp");

    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Doctor Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">
<link rel="stylesheet"
href="css/style.css">
</head>

<body class="bg-light">

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-body text-center">

            <h1 class="mb-4">

                Welcome Doctor

            </h1>

            <h3 class="text-primary">

                Dr. <%= doctor %>

            </h3>

            <hr>

            <a href="GetAppointmentsServlet"
               class="btn btn-primary m-2">

               View Appointments

            </a>

            <a href="GetPrescriptionsServlet"
               class="btn btn-success m-2">

               View Prescriptions

            </a>

            <a href="LogoutServlet"
               class="btn btn-danger m-2">

               Logout

            </a>

        </div>

    </div>

</div>

</body>

</html>