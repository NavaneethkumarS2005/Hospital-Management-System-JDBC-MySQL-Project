
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hms.model.Patient" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Patients</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

margin:0;

font-family:'Poppins',sans-serif;

background:
linear-gradient(
135deg,
#0f172a,
#111827,
#312e81
);

min-height:100vh;

overflow-x:hidden;

color:white;
}

.main-content{

margin-left:260px;

padding:120px 30px 30px 30px;
}

.page-title{

font-size:34px;

font-weight:700;

margin-bottom:30px;
}

.glass-card{

background:
rgba(255,255,255,0.08);

backdrop-filter:blur(20px);

border-radius:30px;

padding:30px;

border:1px solid rgba(255,255,255,0.1);

box-shadow:
0 8px 32px rgba(0,0,0,0.35);
}

.table{

color:white;
}

.table tbody tr:hover{

background:
rgba(255,255,255,0.08);
}

.btn{

border-radius:12px;
}

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

<h1 class="page-title">

Patients Management

</h1>

<div class="glass-card">

<table class="table table-borderless align-middle">

<thead>

<tr>

<th>ID</th>
<th>Name</th>
<th>Age</th>
<th>Gender</th>
<th>Disease</th>
<th>Phone</th>
<th>Actions</th>

</tr>

</thead>

<tbody>

<%

ArrayList<Patient> patients =

(ArrayList<Patient>)
request.getAttribute("patients");

if(patients != null){

for(Patient p : patients){

%>

<tr>

<td><%= p.getId() %></td>

<td><%= p.getPatientName() %></td>

<td><%= p.getAge() %></td>

<td><%= p.getGender() %></td>

<td><%= p.getDisease() %></td>

<td><%= p.getPhone() %></td>

<td>

<a href="editPatient.jsp?id=<%= p.getId() %>"
class="btn btn-warning btn-sm">

Edit

</a>

<a href="DeletePatientServlet?id=<%= p.getId() %>"
class="btn btn-danger btn-sm">

Delete

</a>

</td>

</tr>

<%

}

}else{

%>

<tr>

<td colspan="7"
class="text-center text-warning">

No patients available

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