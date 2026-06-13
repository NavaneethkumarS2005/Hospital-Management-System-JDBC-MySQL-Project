
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Doctor Login</title>

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

</head>

<body>

<div class="login-card">

    <div class="title">

        Doctor Login

    </div>

    <div class="subtitle">

        Access HMS Doctor Portal

    </div>

    <form action="DoctorLoginServlet"
          method="post">

        <div class="mb-4">

            <input type="email"
                   name="email"
                   class="form-control"
                   placeholder="Enter Email"
                   required>

        </div>

        <div class="mb-4">

            <input type="password"
                   name="password"
                   class="form-control"
                   placeholder="Enter Password"
                   required>

        </div>

        <button type="submit"
                class="login-btn">

            Login

        </button>

    </form>

    <div class="register-link">

        <a href="doctorRegister.jsp">

            New Doctor? Register Here

        </a>

    </div>

</div>

</body>

</html>