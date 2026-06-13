
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>

<%@ page import="com.hms.model.Doctor" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Doctors</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="css/style.css">

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

    <h1 class="page-title">

        Doctors Management

    </h1>

    <div class="glass-card">

        <table class="table table-borderless align-middle">

            <thead>

                <tr>

                    <th>ID</th>

                    <th>Name</th>

                    <th>Specialization</th>

                    <th>Experience</th>

                    <th>Phone</th>

                    <th>Actions</th>

                </tr>

            </thead>

            <tbody>

            <%

            ArrayList<Doctor> doctors =

            (ArrayList<Doctor>)
            request.getAttribute("doctors");

            if(doctors != null && !doctors.isEmpty()){

            for(Doctor d : doctors){

            %>

                <tr>

                    <td>

                        <%= d.getId() %>

                    </td>

                    <td>

                        <%= d.getDoctorName() %>

                    </td>

                    <td>

                        <%= d.getSpecialization() %>

                    </td>

                    <td>

                        <%= d.getExperience() %> Years

                    </td>

                    <td>

                        <%= d.getPhone() %>

                    </td>

                    <td>

                        <a href="editDoctor.jsp?id=<%= d.getId() %>"
                           class="btn btn-warning btn-sm">

                           Edit

                        </a>

                        <a href="DeleteDoctorServlet?id=<%= d.getId() %>"
                           class="btn btn-danger btn-sm">

                           Delete

                        </a>

                    </td>

                </tr>

            <%

            }

            } else {

            %>

                <tr>

                    <td colspan="6"
                        class="text-center text-warning fw-bold">

                        No doctors available

                    </td>

                </tr>

            <%

            }

            %>

            </tbody>

        </table>

    </div>

</div>

</body>

</html>