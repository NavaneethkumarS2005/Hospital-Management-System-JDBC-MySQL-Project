<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hms.model.Appointment" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Appointments</title>

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
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet"
href="css/style.css">

<style>

.custom-select{

appearance:none;

-webkit-appearance:none;

-moz-appearance:none;

background:
rgba(255,255,255,0.06);

color:white;
}

.custom-select option{

background:#111827;

color:white;
}

.search-box{

background:
rgba(255,255,255,0.08);

border:none;

outline:none;

padding:12px 18px;

border-radius:14px;

width:280px;

color:white;
}

.search-box::placeholder{

color:rgba(255,255,255,0.6);
}

.queue-badge{

padding:8px 14px;

border-radius:12px;

background:
rgba(99,102,241,0.18);

color:#a5b4fc;

font-weight:600;

font-size:13px;
}

.status-confirmed{

padding:8px 14px;

border-radius:12px;

background:
rgba(34,197,94,0.15);

color:#4ade80;

font-size:13px;

font-weight:600;
}

.status-pending{

padding:8px 14px;

border-radius:12px;

background:
rgba(245,158,11,0.15);

color:#fbbf24;

font-size:13px;

font-weight:600;
}

.status-emergency{

padding:8px 14px;

border-radius:12px;

background:
rgba(239,68,68,0.18);

color:#f87171;

font-size:13px;

font-weight:600;
}

.table{

color:white;
}

.table tbody tr{

transition:0.3s ease;
}

.table tbody tr:hover{

background:
rgba(255,255,255,0.06);
}

.action-btn{

border:none;

padding:8px 14px;

border-radius:12px;

font-weight:600;

transition:0.3s ease;
}

.edit-btn{

background:
linear-gradient(
135deg,
#f59e0b,
#fbbf24
);

color:white;
}

.delete-btn{

background:
linear-gradient(
135deg,
#ef4444,
#dc2626
);

color:white;
}

.action-btn:hover{

transform:translateY(-2px);
}

.top-controls{

display:flex;

justify-content:space-between;

align-items:center;

margin-bottom:25px;

flex-wrap:wrap;

gap:15px;
}

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

    <div class="page-title">

        Smart Appointment Management

    </div>

    <!-- BOOK APPOINTMENT -->

    <div class="glass-card">

        <h4 class="mb-4 fw-bold">

            📅 Book New Appointment

        </h4>

        <form action="AddAppointmentServlet"
              method="post">

            <div class="row g-4">

                <div class="col-md-6">

                    <input type="text"
                           name="patientName"
                           class="form-control"
                           placeholder="Patient Name"
                           required>

                </div>

                <div class="col-md-6">

                    <input type="text"
                           name="doctorName"
                           class="form-control"
                           placeholder="Doctor Name"
                           required>

                </div>

                <div class="col-md-4">

                    <input type="date"
                           name="appointmentDate"
                           class="form-control"
                           required>

                </div>

                <div class="col-md-4">

                    <select name="status"
                            class="form-control custom-select">

                        <option>

                            Pending

                        </option>

                        <option>

                            Confirmed

                        </option>

                        <option>

                            Emergency

                        </option>

                    </select>

                </div>

                <div class="col-md-4">

                    <select class="form-control custom-select">

                        <option>

                            Morning Slot

                        </option>

                        <option>

                            Afternoon Slot

                        </option>

                        <option>

                            Evening Slot

                        </option>

                    </select>

                </div>

                <div class="col-md-12">

                    <button type="submit"
                            class="primary-btn">

                        Book Appointment

                    </button>

                </div>

            </div>

        </form>

    </div>

    <!-- RECENT APPOINTMENTS -->

    <div class="glass-card mt-4">

        <div class="top-controls">

            <h4 class="fw-bold m-0">

                🩺 Recent Appointments

            </h4>

            <div class="d-flex gap-3">

                <input type="text"
                       id="appointmentSearch"
                       class="search-box"
                       placeholder="Search patient...">

                <select class="form-control custom-select"
                        style="width:180px;">

                    <option>

                        Sort By Latest

                    </option>

                    <option>

                        Sort By Name

                    </option>

                    <option>

                        Sort By Priority

                    </option>

                </select>

            </div>

        </div>

        <div class="table-responsive">

        <table class="table table-borderless align-middle">

            <thead>

                <tr>

                    <th>Queue</th>
                    <th>ID</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>

                </tr>

            </thead>

            <tbody id="appointmentTable">

<%

ArrayList<Appointment> appointments =

(ArrayList<Appointment>)
request.getAttribute(
"appointments");

int queue = 1;

if(appointments != null){

for(Appointment ap : appointments){

%>

<tr>

<td>

<span class="queue-badge">

Q-<%= queue++ %>

</span>

</td>

<td>

<%= ap.getId() %>

</td>

<td class="patient-name">

<%= ap.getPatientName() %>

</td>

<td>

<%= ap.getDoctorName() %>

</td>

<td>

<%= ap.getAppointmentDate() %>

</td>

<td>

<%

if(ap.getStatus().equalsIgnoreCase(
"Confirmed")){

%>

<span class="status-confirmed">

Confirmed

</span>

<%

}

else if(ap.getStatus().equalsIgnoreCase(
"Emergency")){

%>

<span class="status-emergency">

Emergency

</span>

<%

}

else{

%>

<span class="status-pending">

Pending

</span>

<%

}

%>

</td>

<td>

<div class="d-flex gap-2">

<a href="editAppointment.jsp
?id=<%= ap.getId() %>
&patientName=<%= ap.getPatientName() %>
&doctorName=<%= ap.getDoctorName() %>
&appointmentDate=<%= ap.getAppointmentDate() %>
&status=<%= ap.getStatus() %>"

class="action-btn edit-btn text-decoration-none">

<i class="bi bi-pencil-fill"></i>

</a>

<a href="DeleteAppointmentServlet?id=<%= ap.getId() %>"

class="action-btn delete-btn text-decoration-none">

<i class="bi bi-trash-fill"></i>

</a>

</div>

</td>

</tr>

<%

}

}

else{

%>

<tr>

<td colspan="7"
    class="text-center text-warning">

    No appointments available

</td>

</tr>

<%

}

%>

            </tbody>

        </table>

        </div>

    </div>

</div>

<script>

const searchInput =

document.getElementById(
"appointmentSearch");

searchInput.addEventListener(
"keyup",

function(){

let filter =

searchInput.value.toLowerCase();

let rows =

document.querySelectorAll(
"#appointmentTable tr");

rows.forEach(row => {

let patient =

row.querySelector(
".patient-name");

if(patient){

let text =

patient.innerText.toLowerCase();

row.style.display =

text.includes(filter)
? ""
: "none";
}

});

});

</script>

</body>

</html>