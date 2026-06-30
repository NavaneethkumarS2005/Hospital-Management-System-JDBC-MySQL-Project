
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Patient Registration</title>

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

.register-wrapper{

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

padding:40px;
}

.register-card{

width:100%;

max-width:520px;

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

.title{

font-size:34px;

font-weight:700;

text-align:center;

margin-bottom:10px;

color:white;
}

.subtitle{

text-align:center;

color:#cbd5e1;

margin-bottom:35px;

font-size:15px;
}

.register-btn{

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
#7c3aed,
#4f46e5,
#2563eb
);

transition:0.3s ease;

box-shadow:
0 10px 25px rgba(79,70,229,0.4);
}

.register-btn:hover{

transform:
translateY(-3px);

box-shadow:
0 15px 35px rgba(79,70,229,0.6);
}

.back-link{

text-align:center;

margin-top:18px;
}

.back-link a{

text-decoration:none;

font-size:15px;

font-weight:500;

color:#a78bfa;

transition:0.3s ease;
}

.back-link a:hover{

color:white;
}

</style>

</head>

<body>

<div class="register-wrapper">

    <div class="register-card">

        <div class="title">

            Patient Registration

        </div>

        <div class="subtitle">

            Create patient HMS profile

        </div>

<form action="PatientServlet"
      method="post">

            <div class="mb-3">

                <input type="text"
                       name="patientName"
                       class="form-control"
                       placeholder="Patient Name"
                       required>

            </div>

            <div class="mb-3">

                <input type="number"
                       name="age"
                       class="form-control"
                       placeholder="Age"
                       required>

            </div>

            <div class="mb-3">

                <select name="gender"
                        class="form-control custom-select"
                        required>

                    <option value="">

                        Select Gender

                    </option>

                    <option>

                        Male

                    </option>

                    <option>

                        Female

                    </option>

                </select>

            </div>

            <div class="mb-3">

                <input type="text"
                       name="disease"
                       class="form-control"
                       placeholder="Disease / Condition"
                       required>

            </div>

            <div class="mb-4">

                <input type="text"
                       name="phone"
                       class="form-control"
                       placeholder="Phone Number"
                       required>

            </div>

            <button type="submit"
                    class="register-btn">

                Register Patient

            </button>

        </form>

        <div class="back-link">

            <a href="dashboard.jsp">

                Back

            </a>

        </div>

    </div>

</div>

</body>

</html>