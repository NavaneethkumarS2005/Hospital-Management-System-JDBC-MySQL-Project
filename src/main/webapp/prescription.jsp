
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Prescription</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

</head>

<body class="bg-light">

<jsp:include page="sidebar.jsp" />

<div style="margin-left:270px; padding:30px;">

    <div class="row justify-content-center">

        <div class="col-md-8">

            <div class="card shadow">

                <div class="card-body">

                    <h3 class="text-center mb-4">
                        Add Prescription
                    </h3>

                    <form action="PrescriptionServlet"
                          method="post">

                        <div class="mb-3">

                            <label>Patient Name</label>

                            <input type="text"
                                   name="patientName"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Doctor Name</label>

                            <input type="text"
                                   name="doctorName"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Diagnosis</label>

                            <textarea name="diagnosis"
                                      class="form-control"
                                      rows="3"
                                      required></textarea>

                        </div>

                        <div class="mb-3">

                            <label>Medicines</label>

                            <textarea name="medicines"
                                      class="form-control"
                                      rows="3"
                                      required></textarea>

                        </div>

                        <div class="mb-3">

                            <label>Notes</label>

                            <textarea name="notes"
                                      class="form-control"
                                      rows="4"></textarea>

                        </div>

                        <button class="btn btn-primary w-100">
                            Save Prescription
                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>