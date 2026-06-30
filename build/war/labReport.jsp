
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
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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

font-size:38px;

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

margin-bottom:35px;
}

.form-control{

background:
rgba(255,255,255,0.08);

border:none;

border-radius:16px;

padding:14px;

color:white;
}

.form-control:focus{

background:
rgba(255,255,255,0.12);

box-shadow:none;

color:white;
}

.form-control::placeholder{

color:rgba(255,255,255,0.6);
}

textarea.form-control{

resize:none;
}

.upload-btn{

width:100%;

padding:15px;

border:none;

border-radius:18px;

background:
linear-gradient(
135deg,
#8b5cf6,
#6366f1
);

font-weight:600;

font-size:16px;

color:white;

transition:0.3s ease;
}

.upload-btn:hover{

transform:translateY(-3px);

box-shadow:
0 12px 25px rgba(99,102,241,0.4);
}

.table{

color:white;

margin-top:10px;
}

.table thead tr{

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

.status-badge{

padding:8px 14px;

border-radius:12px;

font-size:13px;

font-weight:600;

background:
rgba(34,197,94,0.15);

color:#4ade80;
}

.view-btn{

border:none;

padding:8px 14px;

border-radius:12px;

background:
linear-gradient(
135deg,
#f59e0b,
#fbbf24
);

color:white;

font-weight:600;

transition:0.3s ease;
}

.view-btn:hover{

transform:scale(1.05);
}

.section-title{

font-size:24px;

font-weight:600;

margin-bottom:20px;
}

</style>

</head>

<body>

<jsp:include page="sidebar.jsp" />

<jsp:include page="topbar.jsp" />

<div class="main-content">

    <div class="page-title">

        Lab Reports Management

    </div>

    <!-- Upload Form -->

    <div class="glass-card">

        <div class="section-title">

            Upload New Report

        </div>

        <form action="UploadLabReportServlet"
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
                           name="testName"
                           class="form-control"
                           placeholder="Test Name"
                           required>

                </div>

                <div class="col-md-12">

                    <textarea name="reportResult"
                              class="form-control"
                              rows="4"
                              placeholder="Report Result"
                              required></textarea>

                </div>

                <div class="col-md-12">

                    <button type="submit"
                            class="upload-btn">

                        Upload Report

                    </button>

                </div>

            </div>

        </form>

    </div>

    <!-- Reports Table -->

    <div class="glass-card">

        <div class="d-flex
                    justify-content-between
                    align-items-center
                    mb-4">

            <div class="section-title m-0">

                Recent Lab Reports

            </div>

            <a href="GetLabReportsServlet"
               class="btn btn-light">

               View All Reports

            </a>

        </div>

        <div class="table-responsive">

            <table class="table
                           table-borderless
                           align-middle">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Patient</th>
                        <th>Test Name</th>
                        <th>Status</th>
                        <th>Action</th>

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

<td>

<span class="status-badge">

Completed

</span>

</td>

<td>

<a href="GetLabReportsServlet"
   class="view-btn text-decoration-none">

   View

</a>

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

</div>

</body>

</html>
