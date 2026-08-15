<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();

    String vehicleNumber = request.getParameter("vehicleNumber");
    String carName = request.getParameter("carName");
    String slotTime = request.getParameter("slotTime");
    String selectedDate = request.getParameter("selectedDate");
    String paymentMethod = request.getParameter("paymentMethod");
    String serviceType = request.getParameter("serviceType");

    if(vehicleNumber == null || carName == null ||
       slotTime == null || selectedDate == null ||
       paymentMethod == null || serviceType == null){

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

    String bookingId = "BK" + System.currentTimeMillis();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Receipt | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background: linear-gradient(rgba(0,0,0,0.80), rgba(0,0,0,0.80)),
                url('<%=path%>/images/success1.jpg') no-repeat center center;
    background-size:cover;
    color:white;
    animation:fadePage 1s ease-in-out;
}

/* Page fade */
@keyframes fadePage{
    from{opacity:0;}
    to{opacity:1;}
}

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 60px;
    background:#111;
    border-bottom:2px solid #ff2e2e;
}

.logo{
    font-size:22px;
    font-weight:bold;
    color:#ff2e2e;
}

.nav-links a{
    text-decoration:none;
    color:white;
    margin-left:25px;
    transition:0.3s;
}

.nav-links a:hover{
    color:#ff2e2e;
}

.main{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:60px 8%;
}

/* LEFT TEXT ANIMATION */
.left-content{
    width:45%;
    animation:slideLeft 1s ease-out;
}

@keyframes slideLeft{
    from{opacity:0; transform:translateX(-50px);}
    to{opacity:1; transform:translateX(0);}
}

.left-content h1{
    font-size:42px;
    margin-bottom:15px;
}

.left-content span{
    color:#00ffcc;
}

.left-content p{
    font-size:18px;
    color:#ccc;
}

/* RECEIPT BOX */
.receipt{
    width:500px;
    background:#111;
    padding:35px;
    border-radius:18px;
    box-shadow:0 15px 40px rgba(0,0,0,0.9);
    animation:slideUp 1s ease-out;
}

@keyframes slideUp{
    from{opacity:0; transform:translateY(40px);}
    to{opacity:1; transform:translateY(0);}
}

.receipt h2{
    text-align:center;
    margin-bottom:25px;
    color:#ff2e2e;
    letter-spacing:1px;
}

.line{
    height:1px;
    background:#333;
    margin:20px 0;
}

.row{
    display:flex;
    justify-content:space-between;
    margin:12px 0;
    font-size:15px;
}

.label{
    color:#ff2e2e;
    font-weight:600;
}

/* PAYMENT STATUS */
.status-online{
    color:#1cc88a;
    font-weight:bold;
    animation:pulse 1.5s infinite;
}

@keyframes pulse{
    0%{opacity:1;}
    50%{opacity:0.5;}
    100%{opacity:1;}
}

.status-cash{
    color:#ffc107;
    font-weight:bold;
}

/* QR CONTAINER */
/* QR CONTAINER */
.qr-container{
    position:relative;
    margin-top:30px;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* SMALL BOX */
.qr-box{
    width:200px;
    padding:20px;
    background:#1a1a1a;
    border-radius:15px;
    text-align:center;
    border:1px solid #333;
    cursor:pointer;
    z-index:2;
    transition:0.3s;
}

.qr-box h3{
    color:#ff2e2e;
}

.qr-box:hover{
    box-shadow:0 0 20px rgba(255,0,0,0.3);
}

/* POPUP QR */
.qr-popup{
    position:absolute;
    left:-250px;
    top:50%;
    transform:translateY(-50%) scale(0.8);
    opacity:0;
    background:white;
    padding:15px;
    border-radius:15px;
    box-shadow:0 0 25px rgba(255,0,0,0.5);
    transition:0.4s ease;
    z-index:10;   /* ADD THIS */
}

/* ACTIVE STATE */
.qr-popup.active{
    opacity:1;
    transform:translateY(-50%) scale(1);
}

/* QR IMAGE */
.qr-popup img{
    width:200px;
    height:200px;
    border-radius:12px;
}

/* CONNECTING LINES */
.qr-container::before,
.qr-container::after{
    content:"";
    position:absolute;
    top:50%;
    left:-120px;
    z-index:1;
    opacity:0;
    transition:0.3s;
}

.qr-container::before{
    width:120px;
    height:2px;
    background:#ff2e2e;
    transform:translateY(-50%);
}

.qr-container::after{
    width:2px;
    height:60px;
    background:#ff2e2e;
    transform:translateY(-50%);
}

/* SHOW LINES WHEN ACTIVE */
.qr-container.active::before,
.qr-container.active::after{
    opacity:1;
}
/* BUTTON */
.footer-section{
    text-align:center;
    margin-top:25px;
}

button{
    padding:10px 20px;
    border:none;
    border-radius:25px;
    background:#ff2e2e;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    transform:scale(1.08);
    box-shadow:0 0 20px red;
}

footer{
    text-align:center;
    padding:15px;
    background:#111;
    margin-top:40px;
    font-size:14px;
    color:#aaa;
}
</style>
</head>

<body>

<div class="navbar">
    <div class="logo">CarCure</div>
    <div class="nav-links">
        <a href="<%=path%>/About.jsp">About</a>
        <a href="<%=path%>/Availability.jsp">Available Time Slots</a>
        <a href="<%=path%>/Contact.jsp">Contact Us</a>
    </div>
</div>

<div class="main">

<div class="left-content">
    <h1>Appointment <span>Successfully Confirmed</span></h1>
    <p>Your vehicle service has been successfully scheduled.</p>
</div>

<div class="receipt">

<h2>Service Booking Receipt</h2>

<div class="line"></div>

<div class="row"><span class="label">Booking ID</span><span><%= bookingId %></span></div>
<div class="row"><span class="label">Vehicle</span><span><%= vehicleNumber %></span></div>
<div class="row"><span class="label">Car Name</span><span><%= carName %></span></div>
<div class="row"><span class="label">Service Type</span><span><%= serviceName %></span></div>
<div class="row"><span class="label">Service Date</span><span><%= selectedDate %></span></div>
<div class="row"><span class="label">Time Slot</span><span><%= slotTime %></span></div>
<div class="row"><span class="label">Service Charge</span><span>₹<%= serviceAmount %></span></div>
<div class="row"><span class="label">Payment Method</span><span><%= paymentMethod %></span></div>

<div class="row">
    <span class="label">Payment Status</span>
    <% if("Online Payment".equals(paymentMethod)){ %>
        <span class="status-online">Pay Now</span>
    <% } else { %>
        <span class="status-cash">Cash Pending</span>
    <% } %>
</div>

<% if("Online Payment".equals(paymentMethod)){ %>
<div class="qr-container">

    <div class="qr-box" onclick="toggleQR()">
        <h3>Click to Scan QR</h3>
    </div>

    <div class="qr-popup" id="qrPopup">
        <img src="<%=request.getContextPath()%>/images/qr.jpg" alt="QR Code">
    </div>

</div>
<% } %>

<div class="line"></div>

<div class="footer-section">
    <form action="<%=path%>/SignIn.jsp">
        <button type="submit">Log Out </button>
    </form>
</div>

</div>
</div>

<footer>
    © 2026 CarCure | Premium Automobile Service Experience
</footer>

</body>
<script>
function toggleQR(){
    const popup = document.getElementById("qrPopup");
    const container = document.querySelector(".qr-container");

    popup.classList.toggle("active");
    container.classList.toggle("active");
}
</script>
</html>