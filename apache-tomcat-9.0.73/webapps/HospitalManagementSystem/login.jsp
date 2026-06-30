
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>HMS Login</title>

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

*{

margin:0;

padding:0;

box-sizing:border-box;
}

body{

font-family:'Poppins',sans-serif;

background:
linear-gradient(
135deg,
#0f172a,
#111827,
#312e81
);

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

overflow:hidden;
}

.login-card{

width:420px;

padding:45px;

background:
rgba(255,255,255,0.08);

backdrop-filter:blur(20px);

border-radius:30px;

border:
1px solid rgba(255,255,255,0.1);

box-shadow:
0 8px 32px rgba(0,0,0,0.35);

color:white;

animation:fadeIn 0.8s ease;
}

@keyframes fadeIn{

from{

opacity:0;

transform:
translateY(30px);
}

to{

opacity:1;

transform:
translateY(0);
}
}

.logo{

font-size:42px;

font-weight:700;

text-align:center;

margin-bottom:10px;

letter-spacing:1px;
}

.subtitle{

text-align:center;

opacity:0.75;

margin-bottom:35px;

font-size:15px;
}

.form-control{

background:
rgba(255,255,255,0.08);

border:none;

border-radius:16px;

padding:15px;

color:white;

font-size:15px;
}

.form-control:focus{

background:
rgba(255,255,255,0.12);

box-shadow:none;

color:white;
}

.form-control::placeholder{

color:
rgba(255,255,255,0.55);
}

.login-btn{

width:100%;

padding:14px;

border:none;

border-radius:16px;

background:
linear-gradient(
135deg,
#8b5cf6,
#6366f1
);

font-size:16px;

font-weight:600;

color:white;

margin-top:10px;

transition:0.3s ease;

box-shadow:
0 10px 25px rgba(99,102,241,0.35);
}

.login-btn:hover{

transform:
translateY(-2px);

box-shadow:
0 15px 30px rgba(99,102,241,0.45);
}

.login-btn:disabled{

opacity:0.8;

cursor:not-allowed;
}

.auth-links{

display:flex;

justify-content:space-between;

margin-top:20px;
}

.auth-links a{

text-decoration:none;

color:#a78bfa;

font-size:14px;

transition:0.3s ease;
}

.auth-links a:hover{

color:white;
}

.error-popup{

position:fixed;

top:30px;

right:30px;

padding:14px 22px;

border-radius:16px;

background:
rgba(239,68,68,0.15);

border:
1px solid rgba(239,68,68,0.35);

color:#f87171;

font-weight:600;

backdrop-filter:blur(15px);

z-index:9999;

animation:slideIn 0.4s ease;
}

@keyframes slideIn{

from{

opacity:0;

transform:
translateY(-20px);
}

to{

opacity:1;

transform:
translateY(0);
}
}

</style>

</head>

<body>

<%

String errorMessage =

(String)
request.getAttribute(
"errorMessage");

%>

<% if(errorMessage != null){ %>

<div class="error-popup">

    <%= errorMessage %>

</div>

<% } %>

<div class="login-card">

    <div class="logo">

        HMS AI

    </div>

    <div class="subtitle">

        Hospital Management System

    </div>

    <form action="LoginServlet"
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
                class="login-btn"
                id="loginBtn">

            <span id="btnText">

                Login

            </span>

            <span id="btnLoader"
                  style="display:none;">

                Logging in...

            </span>

        </button>

        <div class="auth-links">

            <a href="forgotPassword.jsp">

                Forgot Password?

            </a>

            <a href="register.jsp">

                New User Signup

            </a>

        </div>

    </form>

</div>

<script>

const form =

document.querySelector(
'form');

form.addEventListener(
'submit',

function(){

document.getElementById(
'btnText')

.style.display='none';

document.getElementById(
'btnLoader')

.style.display='inline';

document.getElementById(
'loginBtn')

.disabled=true;

});

</script>

</body>

</html>