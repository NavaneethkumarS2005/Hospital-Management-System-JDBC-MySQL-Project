
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>

<%

response.setHeader(
"Cache-Control",
"no-cache, no-store, must-revalidate");

response.setHeader(
"Pragma",
"no-cache");

response.setDateHeader(
"Expires", 0);

if(session.getAttribute("user") == null){

    response.sendRedirect(
    "login.jsp");

    return;
}

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Hospital Dashboard</title>

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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<link rel="stylesheet"
href="css/style.css">

<style>

.reminder-item{

display:flex;

align-items:center;

padding:14px;

border-radius:16px;

background:
rgba(255,255,255,0.05);

margin-bottom:15px;

transition:0.3s ease;
}

.reminder-item:hover{

background:
rgba(255,255,255,0.08);

transform:
translateX(5px);
}

.reminder-dot{

width:12px;

height:12px;

border-radius:50%;

background:#4ade80;

margin-right:15px;

box-shadow:
0 0 12px #4ade80;
}

.reminder-text{

color:white;

font-size:15px;

font-weight:500;
}

.empty-reminder{

color:#cbd5e1;

font-size:15px;
}

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

    <!-- TITLE -->

    <h1 class="dashboard-title">

        Hospital Management Dashboard

    </h1>

    <!-- STATS -->

    <div class="row g-4 mb-5">

        <div class="col-md-3">

            <div class="glass-card stat-card">

                <div class="stat-icon">

                    <i class="bi bi-people-fill"></i>

                </div>

                <div class="stat-title">

                    Total Patients

                </div>

                <div class="stat-value">

                    <%= request.getAttribute("patientCount") != null
                    ? request.getAttribute("patientCount")
                    : 0 %>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="glass-card stat-card">

                <div class="stat-icon">

                    <i class="bi bi-person-badge-fill"></i>

                </div>

                <div class="stat-title">

                    Total Doctors

                </div>

                <div class="stat-value">

                    <%= request.getAttribute("doctorCount") != null
                    ? request.getAttribute("doctorCount")
                    : 0 %>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="glass-card stat-card">

                <div class="stat-icon">

                    <i class="bi bi-calendar-check-fill"></i>

                </div>

                <div class="stat-title">

                    Appointments

                </div>

                <div class="stat-value">

                    <%= request.getAttribute("appointmentCount") != null
                    ? request.getAttribute("appointmentCount")
                    : 0 %>

                </div>

            </div>

        </div>

        <div class="col-md-3">

            <div class="glass-card stat-card">

                <div class="stat-icon">

                    <i class="bi bi-receipt-cutoff"></i>

                </div>

                <div class="stat-title">

                    Bills

                </div>

                <div class="stat-value">

                    <%= request.getAttribute("billCount") != null
                    ? request.getAttribute("billCount")
                    : 0 %>

                </div>

            </div>

        </div>

    </div>

    <!-- QUICK ACTIONS -->

    <h2 class="section-title">

        Quick Actions

    </h2>

    <div class="row g-4 mb-5">

        <div class="col-md-4">

            <div class="glass-card action-card">

                <h3>Appointments</h3>

                <p>

                    Book and manage appointments.

                </p>

                <a href="appointment.jsp"
                   class="btn btn-primary modern-btn">

                   Open Module

                </a>

            </div>

        </div>

        <div class="col-md-4">

            <div class="glass-card action-card">

                <h3>Patients</h3>

                <p>

                    Manage patient records.

                </p>

                <a href="patientRegister.jsp"
                   class="btn btn-success modern-btn">

                   Open Module

                </a>

            </div>

        </div>

        <div class="col-md-4">

            <div class="glass-card action-card">

                <h3>Doctors</h3>

                <p>

                    Manage doctor information.

                </p>

                <a href="doctorRegister.jsp"
                   class="btn btn-warning modern-btn">

                   Open Module

                </a>

            </div>

        </div>

    </div>

    <!-- APPOINTMENT REMINDERS -->

    <h2 class="section-title">

        Today's Appointment Reminders

    </h2>

    <div class="glass-card mb-5">

<%

ArrayList<String> reminders =

(ArrayList<String>)
request.getAttribute(
"reminders");

if(reminders != null
   && !reminders.isEmpty()){

for(String reminder : reminders){

%>

<div class="reminder-item">

    <div class="reminder-dot"></div>

    <div class="reminder-text">

        <%= reminder %>

    </div>

</div>

<%

}

}else{

%>

<div class="empty-reminder">

    No appointments scheduled today.

</div>

<%

}

%>

    </div>

    <!-- ANALYTICS -->

    <h2 class="section-title">

        Hospital Analytics

    </h2>

    <div class="glass-card chart-card">

        <canvas id="hospitalChart"></canvas>

    </div>

</div>

<!-- FLOATING SHORTCUTS -->

<div class="floating-widgets">

    <a href="patientRegister.jsp"
       class="floating-widget">

       <i class="bi bi-people-fill"></i>

    </a>

    <a href="appointment.jsp"
       class="floating-widget">

       <i class="bi bi-calendar-check-fill"></i>

    </a>

    <a href="aiAssistant.jsp"
       class="floating-widget">

       <i class="bi bi-cpu-fill"></i>

    </a>

    <a href="labReport.jsp"
       class="floating-widget emergency-widget">

       <i class="bi bi-file-earmark-medical-fill"></i>

    </a>

</div>

<script>

const ctx =
document.getElementById(
'hospitalChart');

new Chart(ctx, {

type:'bar',

data:{

labels:[

'Patients',
'Doctors',
'Appointments',
'Bills'

],

datasets:[{

label:'Hospital Statistics',

data:[

<%= request.getAttribute("patientCount") != null ? request.getAttribute("patientCount") : 0 %>,

<%= request.getAttribute("doctorCount") != null ? request.getAttribute("doctorCount") : 0 %>,

<%= request.getAttribute("appointmentCount") != null ? request.getAttribute("appointmentCount") : 0 %>,

<%= request.getAttribute("billCount") != null ? request.getAttribute("billCount") : 0 %>

],

borderRadius:12

}]

},

options:{

responsive:true,

plugins:{

legend:{

labels:{

color:'white'

}

}

},

scales:{

x:{

ticks:{

color:'white'

},

grid:{

color:'rgba(255,255,255,0.08)'

}

},

y:{

ticks:{

color:'white'

},

grid:{

color:'rgba(255,255,255,0.08)'

}

}

}

}

});

</script>

</body>

</html>