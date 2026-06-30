
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.hms.db.DBConnection" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lab Reports</title>

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

<style>

.table{
color:white;
}

.table thead{
background:
rgba(255,255,255,0.08);
}

.table tbody tr{
transition:0.3s ease;
}

.table tbody tr:hover{
background:
rgba(255,255,255,0.08);
}

.report-box{

max-width:300px;

white-space:normal;
}

.page-title{

font-size:34px;

font-weight:700;

margin-bottom:30px;

color:white;
}

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

<div class="page-title">

    Lab Reports List

</div>

<div class="glass-card">

<table class="table align-middle">

<thead>

<tr>

<th>ID</th>
<th>Patient</th>
<th>Test</th>
<th>Result</th>
<th>Date</th>
<th>Remarks</th>

</tr>

</thead>

<tbody>

<%

try{

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM lab_reports");

ResultSet rs =
ps.executeQuery();

while(rs.next()){

%>

<tr>

<td>
<%= rs.getInt("id") %>
</td>

<td>
<%= rs.getString("patient_name") %>
</td>

<td>
<%= rs.getString("test_name") %>
</td>

<td class="report-box">
<%= rs.getString("result") %>
</td>

<td>
<%= rs.getString("report_date") %>
</td>

<td class="report-box">
<%= rs.getString("remarks") %>
</td>

</tr>

<%

}

}catch(Exception e){

e.printStackTrace();
}

%>

</tbody>

</table>

</div>

</div>

</body>

</html>