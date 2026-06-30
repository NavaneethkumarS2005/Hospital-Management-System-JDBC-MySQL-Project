
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.search-container{

position:relative;
}

.suggestions-box{

position:absolute;

top:55px;

left:0;

width:100%;

background:
rgba(15,23,42,0.95);

border:
1px solid rgba(255,255,255,0.08);

border-radius:16px;

overflow:hidden;

backdrop-filter:blur(15px);

display:none;

z-index:9999;
}

.suggestion-item{

padding:12px 16px;

color:white;

cursor:pointer;

transition:0.2s ease;
}

.suggestion-item:hover{

background:
rgba(139,92,246,0.25);
}

.topbar{

position:fixed;

top:20px;

left:280px;

right:20px;

height:80px;

background:
rgba(255,255,255,0.08);

backdrop-filter:blur(20px);

border:
1px solid rgba(255,255,255,0.1);

border-radius:25px;

display:flex;

align-items:center;

justify-content:space-between;

padding:0 30px;

z-index:999;

box-shadow:
0 8px 32px rgba(0,0,0,0.35);
}

.search-box{

background:
rgba(255,255,255,0.08);

border:none;

outline:none;

padding:12px 18px;

border-radius:14px;

width:280px;

color:white;

font-size:14px;
}

.search-box::placeholder{

color:
rgba(255,255,255,0.7);
}

.user-section{

display:flex;

align-items:center;

gap:18px;
}

.user-profile{

display:flex;

align-items:center;

gap:10px;

font-weight:600;

color:white;

font-size:15px;
}

.user-profile i{

font-size:26px;

color:#a78bfa;
}

.logout-link{

text-decoration:none;

padding:10px 18px;

border-radius:14px;

background:
rgba(239,68,68,0.18);

color:#f87171;

font-weight:600;

transition:0.3s ease;
}

.logout-link:hover{

background:
rgba(239,68,68,0.3);

color:white;
}

.profile-section{

display:flex;

align-items:center;

gap:20px;
}

.clock{

font-size:18px;

font-weight:500;

color:white;
}

.profile-circle{

width:48px;

height:48px;

border-radius:50%;

background:
linear-gradient(
135deg,
#8b5cf6,
#6366f1
);

display:flex;

align-items:center;

justify-content:center;

font-weight:700;

font-size:18px;

color:white;

box-shadow:
0 0 20px rgba(139,92,246,0.5);
}

</style>

<div class="topbar">

<div class="search-container">

    <input type="text"
           id="moduleSearch"
           class="search-box"
           placeholder="Search modules..."
           onkeyup="showSuggestions()"
           onkeydown="searchModule(event)">

    <div class="suggestions-box"
         id="suggestionsBox">

    </div>

</div>

    <div class="user-section">

        <div class="user-profile">

            <i class="bi bi-person-circle"></i>

            <span>

                Admin

            </span>

        </div>

        <a href="LogoutServlet"
           class="logout-link">

           Logout

        </a>

    </div>

    <div class="profile-section">

        <div class="clock"
             id="liveClock">

        </div>

        <div class="profile-circle">

            A

        </div>

    </div>

</div>

<script>

function updateClock(){

const now =
new Date();

document.getElementById(
'liveClock')

.innerHTML =

now.toLocaleTimeString();
}

setInterval(
updateClock,
1000);

updateClock();

function searchModule(event){

if(event.key === "Enter"){

event.preventDefault();

let value =

document.getElementById(
"moduleSearch")

.value.toLowerCase();

if(value.includes("dashboard")){

window.location.href =
"DashboardServlet";
}

else if(value.includes("patient")){

window.location.href =
"patientRegister.jsp";
}

else if(value.includes("doctor")){

window.location.href =
"doctorRegister.jsp";
}

else if(value.includes("appointment")){

window.location.href =
"appointment.jsp";
}

else if(value.includes("ai")){

window.location.href =
"aiAssistant.jsp";
}

else if(value.includes("lab")){

window.location.href =
"labReport.jsp";
}

else{

alert(
"Module not found!");
}
}

}

const modules = [

"Dashboard",
"Patient",
"Doctor",
"Appointment",
"AI Assistant",
"Lab Report"
];

function showSuggestions(){

let input =

document.getElementById(
"moduleSearch")

.value.toLowerCase();

let box =

document.getElementById(
"suggestionsBox");

box.innerHTML = "";

if(input === ""){

box.style.display = "none";

return;
}

let filtered =

modules.filter(module =>

module.toLowerCase()
.includes(input)
);

filtered.forEach(module => {

let div =

document.createElement(
"div");

div.classList.add(
"suggestion-item");

div.innerText = module;

div.onclick = function(){

document.getElementById(
"moduleSearch")

.value = module;

box.style.display = "none";

redirectModule(module);
};

box.appendChild(div);
});

box.style.display =

filtered.length > 0
? "block"
: "none";
}

function redirectModule(module){

module = module.toLowerCase();

if(module.includes("dashboard")){

window.location.href =
"DashboardServlet";
}

else if(module.includes("patient")){

window.location.href =
"patientRegister.jsp";
}

else if(module.includes("doctor")){

window.location.href =
"doctorRegister.jsp";
}

else if(module.includes("appointment")){

window.location.href =
"appointment.jsp";
}

else if(module.includes("ai")){

window.location.href =
"aiAssistant.jsp";
}

else if(module.includes("lab")){

window.location.href =
"labReport.jsp";
}
}

</script>
