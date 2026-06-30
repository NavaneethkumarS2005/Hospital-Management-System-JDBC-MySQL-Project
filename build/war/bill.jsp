
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Billing</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
<link rel="stylesheet"
href="css/style.css">
</head>

<body class="bg-light">

<jsp:include page="navbar.jsp" />

<div class="container mt-5" data-target="...">
<div class="stat-value counter"
     data-target="<%= request.getAttribute("patientCount") %>">

</div>
    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card shadow">

                <div class="card-body">

                    <h3 class="text-center mb-4">
                        Add Bill
                    </h3>

                    <form action="BillServlet"
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

                            <label>Amount</label>

                            <input type="number"
                                   step="0.01"
                                   name="amount"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Payment Status</label>

                            <select name="paymentStatus"
                                    class="form-control">

                                <option>Paid</option>
                                <option>Pending</option>

                            </select>

                        </div>

                        <button class="btn btn-success w-100">
                            Generate Bill
                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>