
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Search Patient</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

</head>

<body class="bg-light">

<jsp:include page="navbar.jsp" />

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card shadow">

                <div class="card-body">

                    <h3 class="text-center mb-4">
                        Search Patient
                    </h3>

                    <form action="SearchPatientServlet"
                          method="get">

                        <div class="mb-3">

                            <label>Patient Name</label>

                            <input type="text"
                                   name="patientName"
                                   class="form-control"
                                   required>

                        </div>

                        <button class="btn btn-primary w-100">
                            Search
                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>
