
<style>

.notification-container{

position:fixed;

top:110px;

right:25px;

z-index:9999;
}

.notification{

min-width:320px;

padding:18px 22px;

margin-bottom:18px;

background:rgba(255,255,255,0.08);

backdrop-filter:blur(20px);

border-radius:20px;

border-left:5px solid #8b5cf6;

color:white;

box-shadow:
0 8px 32px rgba(0,0,0,0.35);

animation:
slideIn 0.5s ease,
fadeOut 0.5s ease 4.5s forwards;
}

@keyframes slideIn{

from{

opacity:0;

transform:translateX(100px);
}

to{

opacity:1;

transform:translateX(0);
}
}

@keyframes fadeOut{

to{

opacity:0;

transform:translateX(100px);
}
}

.notification-title{

font-weight:600;

font-size:16px;
}

.notification-message{

opacity:0.8;

font-size:14px;

margin-top:4px;
}

</style>

<div class="notification-container">

    <div class="notification">

        <div class="notification-title">

            Appointment Added

        </div>

        <div class="notification-message">

            New patient appointment created successfully.

        </div>

    </div>

</div>
