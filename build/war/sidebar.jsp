<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

.sidebar{

position:fixed;

top:20px;

left:20px;

width:240px;

height:95vh;

background:
rgba(255,255,255,0.08);

backdrop-filter:blur(20px);

border:1px solid rgba(255,255,255,0.1);

border-radius:30px;

padding:25px;

box-shadow:
0 8px 32px rgba(0,0,0,0.35);

z-index:1000;

overflow-y:auto;
}

.logo{

font-size:28px;

font-weight:700;

color:white;

margin-bottom:40px;

text-align:center;

letter-spacing:1px;
}

.nav-link-custom{

display:flex;

align-items:center;

gap:14px;

padding:14px 18px;

margin-bottom:14px;

border-radius:18px;

text-decoration:none;

color:white;

font-weight:500;

transition:0.3s ease;

font-size:16px;
}

.nav-link-custom:hover{

background:
rgba(255,255,255,0.12);

transform:
translateX(8px);

color:#8b5cf6;

box-shadow:
0 0 20px rgba(139,92,246,0.5);
}

.nav-link-custom i{

font-size:20px;
}

.logout-btn{

margin-top:25px;

background:
linear-gradient(
135deg,
#ef4444,
#dc2626
);

justify-content:center;
}

.logout-btn:hover{

color:white;
}

.sidebar::-webkit-scrollbar{

width:6px;
}

.sidebar::-webkit-scrollbar-thumb{

background:
rgba(255,255,255,0.15);

border-radius:10px;
}

</style>

<div class="sidebar">

    <div class="logo">

        HMS

    </div>

    <a href="DashboardServlet"
       class="nav-link-custom">

       <i class="bi bi-grid-fill"></i>

       Dashboard

    </a>

    <a href="patientRegister.jsp"
       class="nav-link-custom">

       <i class="bi bi-people-fill"></i>

       Add Patient

    </a>

    <a href="doctorRegister.jsp"
       class="nav-link-custom">

       <i class="bi bi-person-badge-fill"></i>

       Add Doctor

    </a>

    <a href="GetAppointmentsServlet"
       class="nav-link-custom">

       <i class="bi bi-calendar-check-fill"></i>

       Appointments

    </a>

    <a href="labReport.jsp"
       class="nav-link-custom">

       <i class="bi bi-file-earmark-medical-fill"></i>

       Lab Reports

    </a>

    <a href="GetMedicinesServlet"
       class="nav-link-custom">

       <i class="bi bi-capsule-pill"></i>

       Pharmacy

    </a>

    <a href="GetPatientsServlet"
       class="nav-link-custom">

       <i class="bi bi-person-lines-fill"></i>

       View Patients

    </a>

    <a href="GetDoctorsServlet"
       class="nav-link-custom">

       <i class="bi bi-hospital-fill"></i>

       View Doctors

    </a>

    <a href="GetAppointmentsServlet"
       class="nav-link-custom">

       <i class="bi bi-journal-medical"></i>

       View Appointments

    </a>


</div>