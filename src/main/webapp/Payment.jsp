<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();

    String vehicleNumber = request.getParameter("vehicleNumber");
    String carName = request.getParameter("carName");
    String slotTime = request.getParameter("slotTime");
    String selectedDate = request.getParameter("selectedDate");
    String serviceType = request.getParameter("serviceType");

    if(vehicleNumber == null || carName == null || 
       slotTime == null || selectedDate == null ||
       serviceType == null){

        response.sendRedirect(path + "/SelectSlot.jsp");
        return;
    }

    String serviceName = serviceType;
    String serviceAmount = "0";

    if(serviceType.contains("-")){
        String parts[] = serviceType.split("-");
        serviceName = parts[0].trim();
        if(parts.length > 1){
            serviceAmount = parts[1].trim();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

/* ===== PAGE FADE ===== */
body{
    min-height:100vh;
    background: 
        linear-gradient(rgba(0,0,0,0.75), rgba(10,0,0,0.9)),
        url('<%=path%>/images/payment.jpg');
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
    color:white;
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
    font-size:22px;
    font-weight:bold;
    color:#ff2e2e;
}

.nav-links a{
    text-decoration:none;
    color:white;
    margin-left:30px;
    transition:0.3s;
}

.nav-links a:hover{
    color:#ff2e2e;
}

/* ===== MAIN LAYOUT ===== */
.main{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:40px 8%;
    height:calc(100vh - 70px);
}

/* ===== HERO TEXT ANIMATION ===== */
.hero-text{
    max-width:500px;
    animation: slideLeft 1s ease-out;
}

@keyframes slideLeft{
    from{opacity:0; transform:translateX(-60px);}
    to{opacity:1; transform:translateX(0);}
}

.hero-text h1{
    font-size:48px;
    margin-bottom:20px;
    animation: textReveal 1.2s ease;
}

@keyframes textReveal{
    0%{letter-spacing:6px; opacity:0;}
    100%{letter-spacing:1px; opacity:1;}
}

.hero-text p{
    color:#ccc;
    line-height:1.6;
}

/* ===== PAYMENT CARD ===== */
.container{
    width:480px;
    background:#111;
    padding:40px;
    border-radius:25px;
    box-shadow:0 30px 70px rgba(0,0,0,0.9);
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
    text-align:center;
    margin-bottom:25px;
    color:#ff2e2e;
    animation: fadeUp 1s ease;
}

@keyframes fadeUp{
    from{opacity:0; transform:translateY(20px);}
    to{opacity:1; transform:translateY(0);}
}

/* ===== DETAILS BOX ===== */
.details{
    background:#1a1a1a;
    padding:15px;
    border-radius:12px;
    margin-bottom:25px;
    line-height:1.8;
}

.details p{
    opacity:0;
    animation: fadeDetail 0.6s forwards;
}

.details p:nth-child(1){animation-delay:0.2s;}
.details p:nth-child(2){animation-delay:0.4s;}
.details p:nth-child(3){animation-delay:0.6s;}
.details p:nth-child(4){animation-delay:0.8s;}
.details p:nth-child(5){animation-delay:1s;}
.details p:nth-child(6){animation-delay:1.2s;}

@keyframes fadeDetail{
    to{opacity:1;}
}

/* ===== PAYMENT OPTIONS ===== */
.payment-option{
    margin-bottom:15px;
    padding:15px;
    background:#1c1c1c;
    border-radius:12px;
    border:1px solid #333;
    transition:0.3s;
}

.payment-option:hover{
    border-color:#ff2e2e;
    transform:translateX(5px);
}

/* ===== RADIO EFFECT ===== */
input[type="radio"]{
    margin-right:10px;
    accent-color:#ff2e2e;
}

/* ===== BUTTON ANIMATION ===== */
button{
    width:100%;
    padding:14px;
    border:none;
    border-radius:30px;
    background:#ff2e2e;
    color:white;
    font-weight:bold;
    cursor:pointer;
    margin-top:15px;
    transition:all 0.3s ease;
    animation: pulseBtn 2.5s infinite;
}

@keyframes pulseBtn{
    0%{ box-shadow:0 0 0 0 rgba(255,0,0,0.6); }
    70%{ box-shadow:0 0 0 18px rgba(255,0,0,0); }
    100%{ box-shadow:0 0 0 0 rgba(255,0,0,0); }
}

button:hover{
    transform:translateY(-4px) scale(1.05);
    box-shadow:0 15px 40px rgba(255,0,0,0.7);
}

/* ===== FOOTER ===== */
footer{
    text-align:center;
    padding:8px 0;
    background:#0f0f0f;
    color:#aaa;
    font-size:12px;
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
        <a href="<%=path%>/SelectSlot.jsp">Select Slot</a>
        <a href="<%=path%>/Availability.jsp">Available Time Slots</a>
        <a href="<%= path %>/About.jsp">About</a>
        <a href="<%=path%>/Contact.jsp">Contact Us</a>
    </div>
</div>

<div class="main">

    <div class="hero-text">
        <h1>Premium Car Care</h1>
        <p>
            Professional mechanics. Trusted service. 
            High-quality performance care for your vehicle.
        </p>
    </div>

    <div class="container">

        <h2>Complete Your Payment</h2>

        <div class="details">
      
            <p><b>Car:</b> <%= carName %></p>
            <p><b>Vehicle No:</b> <%= vehicleNumber %></p>
            <p><b>Service:</b> <%= serviceName %></p>
            <p><b>Date:</b> <%= selectedDate %></p>
            <p><b>Time:</b> <%= slotTime %></p>
            <p><b>Service Charge:</b> ₹<%= serviceAmount %></p>
        </div>

        <!-- FORM -->
        <form action="<%=path%>/BookingSuccess.jsp" method="post">

            <!-- Hidden Data -->
            <input type="hidden" name="vehicleNumber" value="<%=vehicleNumber%>">
            <input type="hidden" name="carName" value="<%=carName%>">
            <input type="hidden" name="slotTime" value="<%=slotTime%>">
            <input type="hidden" name="selectedDate" value="<%=selectedDate%>">
            <input type="hidden" name="serviceType" value="<%=serviceType%>">

            <div class="payment-option">
                <label>
                    <input type="radio" name="paymentMethod" value="Online Payment" required>
                    💳 Pay Online (UPI / Card / Net Banking)
                </label>
            </div>

            <div class="payment-option">
                <label>
                    <input type="radio" name="paymentMethod" value="Cash">
                    💵 Cash on Service
                </label>
            </div>

            <button type="submit">Confirm Payment</button>

        </form>

    </div>

</div>

<footer>
    © 2026 CarCure | Premium Automobile Service Experience
</footer>

</body>
</html>