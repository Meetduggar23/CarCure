<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();

String bookingId = (String) request.getAttribute("bookingId");
String vehicleNumber = (String) request.getAttribute("vehicleNumber");
String carName = (String) request.getAttribute("carName");
String selectedDate = (String) request.getAttribute("selectedDate");
String slotTime = (String) request.getAttribute("slotTime");
String serviceName = (String) request.getAttribute("serviceName");
Integer serviceAmount = (Integer) request.getAttribute("serviceAmount");

if(bookingId == null){
    response.sendRedirect("SelectSlot.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Confirmation | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

/* ===== PAGE FADE ===== */
body{
    min-height:100vh;
    background: linear-gradient(rgba(0,0,0,0.65), rgba(0,0,0,0.65)),
                url('<%=path%>/images/confirm1.jpg') no-repeat center center;
    background-size:cover;
    color:white;
    display:flex;
    flex-direction:column;
    animation: pageFade 0.8s ease-in-out;
}

@keyframes pageFade{
    from{opacity:0;}
    to{opacity:1;}
}

/* ===== NAVBAR (UNCHANGED) ===== */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 60px;
    background:#111;
    position:relative;
}

.navbar::after{
    content:"";
    position:absolute;
    bottom:0;
    left:0;
    width:100%;
    height:2px;
    background:#ff2e2e;
}

.logo{
    font-size:26px;
    font-weight:bold;
    color:#ff3b3b;
}

.nav-links a{
    text-decoration:none;
    color:white;
    margin-left:30px;
}

/* ===== MAIN ===== */
.main{
    flex:1;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:60px 8%;
}

/* ===== LEFT CONTENT ANIMATION ===== */
.left-content{
    width:45%;
    animation: slideLeft 1s ease-out;
}

@keyframes slideLeft{
    from{opacity:0; transform:translateX(-60px);}
    to{opacity:1; transform:translateX(0);}
}

.left-content h1{
    font-size:45px;
    margin-bottom:15px;
    animation: textReveal 1.2s ease;
}

@keyframes textReveal{
    0%{letter-spacing:6px; opacity:0;}
    100%{letter-spacing:1px; opacity:1;}
}

.left-content span{
    color:#00ffcc;
    animation: glowText 2s infinite alternate;
}

@keyframes glowText{
    from{ text-shadow:0 0 5px #00ffcc; }
    to{ text-shadow:0 0 25px #00ffcc; }
}

.left-content p{
    font-size:18px;
    color:#ff3b3b;
    margin-bottom:15px;
}

.left-content h3{
    font-size:16px;
    color:#ccc;
}

/* ===== CONFIRMATION CARD ===== */
.container{
    width:480px;
    padding:45px;
    border-radius:25px;
    box-shadow:
        0 30px 70px rgba(0,0,0,0.9),
        inset 0 0 0 1px rgba(255,255,255,0.05);
    background:rgba(0,0,0,0.55);
    backdrop-filter:blur(10px);
    text-align:center;

    animation: cardZoom 0.9s cubic-bezier(.68,-0.55,.27,1.55);
}

@keyframes cardZoom{
    0%{
        opacity:0;
        transform:scale(0.8) translateY(50px);
    }
    60%{
        opacity:1;
        transform:scale(1.05) translateY(-5px);
    }
    100%{
        transform:scale(1) translateY(0);
    }
}

/* ===== HEADING ===== */
h2{
    margin-bottom:20px;
    color:#ff3b3b;
    animation: fadeUp 1s ease;
}

@keyframes fadeUp{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

/* ===== SUCCESS BOX ===== */
.success-box{
    padding:15px;
    border-radius:12px;
    margin-bottom:25px;
    animation: fadeIn 1.2s ease;
}

@keyframes fadeIn{
    from{opacity:0;}
    to{opacity:1;}
}

/* ===== DETAILS ANIMATION ===== */
.details{
    text-align:left;
    margin-bottom:30px;
    line-height:2;
    font-size:16px;
}

.details div{
    opacity:0;
    animation: fadeDetail 0.6s forwards;
}

.details div:nth-child(1){animation-delay:0.2s;}
.details div:nth-child(2){animation-delay:0.4s;}
.details div:nth-child(3){animation-delay:0.6s;}
.details div:nth-child(4){animation-delay:0.8s;}
.details div:nth-child(5){animation-delay:1s;}
.details div:nth-child(6){animation-delay:1.2s;}
.details div:nth-child(7){animation-delay:1.4s;}

@keyframes fadeDetail{
    to{opacity:1;}
}

.details span{
    color:#ff3b3b;
    font-weight:bold;
}

/* ===== BUTTON ANIMATION ===== */
.book-btn{
    padding:12px 25px;
    border:none;
    border-radius:25px;
    font-weight:bold;
    background:linear-gradient(45deg,#ff3b3b,#b30000);
    color:white;
    cursor:pointer;
    transition:all 0.3s ease;

    animation: pulseBtn 2.5s infinite;
}

@keyframes pulseBtn{
    0%{ box-shadow:0 0 0 0 rgba(255,0,0,0.6); }
    70%{ box-shadow:0 0 0 18px rgba(255,0,0,0); }
    100%{ box-shadow:0 0 0 0 rgba(255,0,0,0); }
}

.book-btn:hover{
    transform:translateY(-4px) scale(1.05);
    box-shadow:0 15px 40px rgba(255,0,0,0.7);
}

/* ===== FOOTER ===== */
footer{
    text-align:center;
    padding:8px 0;
    background:#0f0f0f;
    color:#666;
    font-size:12px;
    border-top:1px solid #1f1f1f;
    position:fixed;
    bottom:0;
    width:100%;
}
</style>
</head>

<body>

<div class="navbar">


    <div class="logo">CarCure</div>
    <div class="nav-links">
        <a href="<%=path%>/Home.jsp">Home</a>
        <a href="<%=path%>/SelectSlot.jsp">Slot Again</a>
        <a href="<%=path%>/Availability.jsp">Available Time Slots</a>
        <a href="<%= path %>/About.jsp">About</a>
        <a href="<%=path%>/Contact.jsp">Contact Us</a>
        <a href="<%=path%>/SignIn.jsp">Sign In</a>
    </div>
</div>

<div class="main">

<div class="left-content">
    <h1>Your <span>Booking Confirmed</span></h1>
    <p>Premium automobile service scheduled successfully.</p>
    <h3><span>Drive Safe. Drive Smart. Drive CarCure.</span></h3>
</div>

<div class="container">

    <h2>✔ Booking Confirmed</h2>

    <div class="success-box" style="background:rgba(0,255,0,0.15); border:1px solid green;">
        Your vehicle service has been successfully scheduled!
    </div>

    <div class="details">
        <div><span>Booking ID:</span> <%= bookingId %></div>
        <div><span>Vehicle Number:</span> <%= vehicleNumber %></div>
        <div><span>Car Name:</span> <%= carName %></div>
        <div><span>Service Type:</span> <%= serviceName %></div>
        <div><span>Service Charge:</span> ₹<%= serviceAmount %></div>
        <div><span>Selected Slot:</span> <%= slotTime %></div>
        <div><span>Date:</span> <%= selectedDate %></div>
    </div>

    <form action="<%=path%>/Payment.jsp" method="post">
        <input type="hidden" name="vehicleNumber" value="<%=vehicleNumber%>">
        <input type="hidden" name="carName" value="<%=carName%>">
        <input type="hidden" name="slotTime" value="<%=slotTime%>">
        <input type="hidden" name="selectedDate" value="<%=selectedDate%>">
        <input type="hidden" name="serviceType" value="<%=serviceName%> - <%=serviceAmount%>">
                <button type="submit" class="book-btn">
            Proceed to Payment Gateway
        </button>
    </form>

</div>

</div>

<footer>
    © 2026 CarCure All Rights Reserved. | Designed for Premium Automobile Service Experience.
</footer>

</body>
</html>