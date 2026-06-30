
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>HMS Register</title>

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

.register-container{

width:100%;

max-width:1050px;

display:grid;

grid-template-columns:1fr 1fr;

background:
rgba(255,255,255,0.06);

backdrop-filter:blur(22px);

border:
1px solid rgba(255,255,255,0.08);

border-radius:35px;

overflow:hidden;

box-shadow:
0 10px 45px rgba(0,0,0,0.45);
}

/* LEFT PANEL */

.register-left{

padding:60px;

display:flex;

flex-direction:column;

justify-content:center;

background:
linear-gradient(
135deg,
rgba(124,58,237,0.35),
rgba(37,99,235,0.2)
);
}

.brand-title{

font-size:48px;

font-weight:700;

color:white;

margin-bottom:20px;
}

.brand-subtitle{

font-size:16px;

line-height:1.8;

color:#dbeafe;
}

/* RIGHT PANEL */

.register-right{

padding:50px;
}

.form-title{

font-size:32px;

font-weight:700;

color:white;

margin-bottom:10px;
}

.form-subtitle{

color:#cbd5e1;

margin-bottom:35px;
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

.custom-select{

appearance:none;

-webkit-appearance:none;

-moz-appearance:none;

background:
rgba(255,255,255,0.06);

color:white;

cursor:pointer;
}

.custom-select option{

background:#111827;

color:white;
}

.bottom-links{

display:flex;

justify-content:space-between;

margin-top:22px;
}

.bottom-links a{

text-decoration:none;

color:#a78bfa;

font-size:14px;

transition:0.3s ease;
}

.bottom-links a:hover{

color:white;
}

.alert{

border-radius:16px;

font-size:14px;
}

@media(max-width:900px){

.register-container{

grid-template-columns:1fr;
}

.register-left{

display:none;
}
}

</style>

</head>

<body>

<div class="register-wrapper">

    <div class="register-container">

        <!-- LEFT SIDE -->

        <div class="register-left">

            <div class="brand-title">

                HMS AI

            </div>

            <div class="brand-subtitle">

                Smart Hospital Management System
                with futuristic healthcare dashboard,
                AI assistant, patient management,
                appointments and secure authentication.

            </div>

        </div>

        <!-- RIGHT SIDE -->

        <div class="register-right">

            <div class="form-title">

                Create Account

            </div>

            <div class="form-subtitle">

                Register your HMS account

            </div>

            <%

            String successMessage =

            (String)
            request.getAttribute(
            "successMessage");

            String errorMessage =

            (String)
            request.getAttribute(
            "errorMessage");

            %>

            <% if(successMessage != null){ %>

            <div class="alert alert-success text-center">

                <%= successMessage %>

            </div>

            <% } %>

            <% if(errorMessage != null){ %>

            <div class="alert alert-danger text-center">

                <%= errorMessage %>

            </div>

            <% } %>

            <form action="RegisterServlet"
                  method="post">

                <div class="mb-3">

                    <input type="text"
                           name="name"
                           class="form-control"
                           placeholder="Full Name"
                           required>

                </div>

                <div class="mb-3">

                    <input type="email"
                           name="email"
                           class="form-control"
                           placeholder="Email Address"
                           required>

                </div>

                <div class="mb-3">

                    <input type="password"
                           name="password"
                           class="form-control"
                           placeholder="Password"
                           required>

                </div>

                <div class="mb-4">

                    <select name="role"
                            class="form-control custom-select"
                            required>

                        <option value="">

                            Select Role

                        </option>

                        <option>

                            Admin

                        </option>

                        <option>

                            Doctor

                        </option>

                        <option>

                            Receptionist

                        </option>

                    </select>

                </div>

                <button type="submit"
                        class="register-btn">

                    Create Account

                </button>

            </form>

            <div class="bottom-links">

                <a href="login.jsp">

                    Login

                </a>

                <a href="login.jsp">

                    Back

                </a>

            </div>

        </div>

    </div>

</div>

</body>

</html>