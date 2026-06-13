
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Doctor</title>

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

.edit-wrapper{

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

padding:40px;
}

.edit-card{

width:100%;

max-width:600px;

background:
rgba(255,255,255,0.06);

backdrop-filter:blur(22px);

border:
1px solid rgba(255,255,255,0.08);

border-radius:30px;

padding:40px;

box-shadow:
0 10px 40px rgba(0,0,0,0.45);
}

.edit-title{

font-size:34px;

font-weight:700;

text-align:center;

margin-bottom:10px;

color:white;
}

.edit-subtitle{

text-align:center;

color:#cbd5e1;

margin-bottom:35px;

font-size:15px;
}

.update-btn{

width:100%;

padding:15px;

border:none;

border-radius:18px;

font-size:16px;

font-weight:600;

color:white;

background:
linear-gradient(
135deg,
#f59e0b,
#f97316
);

transition:0.3s ease;

box-shadow:
0 10px 25px rgba(249,115,22,0.35);
}

.update-btn:hover{

transform:
translateY(-3px);

box-shadow:
0 15px 35px rgba(249,115,22,0.5);
}

.back-link{

text-align:center;

margin-top:20px;
}

.back-link a{

text-decoration:none;

color:#a78bfa;

font-size:15px;

transition:0.3s ease;
}

.back-link a:hover{

color:white;
}

</style>

</head>

<body>

<div class="edit-wrapper">

    <div class="edit-card">

        <div class="edit-title">

            Edit Doctor

        </div>

        <div class="edit-subtitle">

            Update doctor information

        </div>

        <form action="UpdateDoctorServlet"
              method="post">

            <input type="hidden"
                   name="id"
                   value="<%= request.getParameter("id") %>">

            <div class="mb-3">

                <input type="text"
                       name="doctorName"
                       class="form-control"
                       placeholder="Doctor Name"
                       value="<%= request.getParameter("doctorName") %>"
                       required>

            </div>

            <div class="mb-3">

                <input type="text"
                       name="specialization"
                       class="form-control"
                       placeholder="Specialization"
                       value="<%= request.getParameter("specialization") %>"
                       required>

            </div>

            <div class="mb-3">

                <input type="number"
                       name="experience"
                       class="form-control"
                       placeholder="Years of Experience"
                       value="<%= request.getParameter("experience") %>"
                       required>

            </div>

            <div class="mb-4">

                <input type="text"
                       name="phone"
                       class="form-control"
                       placeholder="Phone Number"
                       value="<%= request.getParameter("phone") %>"
                       required>

            </div>

            <button type="submit"
                    class="update-btn">

                Update Doctor

            </button>

        </form>

        <div class="back-link">

            <a href="GetDoctorsServlet">

                Back

            </a>

        </div>

    </div>

</div>

</body>

</html>