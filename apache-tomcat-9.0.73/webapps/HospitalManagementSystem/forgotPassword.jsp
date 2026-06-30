
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Forgot Password</title>

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

.forgot-wrapper{

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

padding:40px;
}

.forgot-card{

width:100%;

max-width:500px;

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

font-size:32px;

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

.reset-btn{

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

.reset-btn:hover{

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

<div class="forgot-wrapper">

    <div class="forgot-card">

        <div class="title">

            Forgot Password

        </div>

        <div class="subtitle">

            Reset your HMS account password

        </div>

        <form action="ForgotPasswordServlet"
              method="post">

            <div class="mb-3">

                <input type="email"
                       name="email"
                       class="form-control"
                       placeholder="Enter Registered Email"
                       required>

            </div>

            <div class="mb-4">

                <input type="password"
                       name="newPassword"
                       class="form-control"
                       placeholder="Enter New Password"
                       required>

            </div>

            <button type="submit"
                    class="reset-btn">

                Reset Password

            </button>

        </form>

        <div class="back-link">

            <a href="login.jsp">

                Back to Login

            </a>

        </div>

    </div>

</div>

</body>

</html>