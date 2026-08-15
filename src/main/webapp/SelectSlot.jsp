<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

    String path = request.getContextPath();
    String today = java.time.LocalDate.now().toString();

    String error = request.getParameter("error");

    String vehicleNumberVal = request.getParameter("vehicleNumber") != null ? request.getParameter("vehicleNumber") : "";
    String carNameVal = request.getParameter("carName") != null ? request.getParameter("carName") : "";
    String serviceTypeVal = request.getParameter("serviceType") != null ? request.getParameter("serviceType") : "";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Service Slot | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    min-height:100vh;
    background: linear-gradient(rgba(0,0,0,0.75), rgba(0,0,0,0.75)),
                url('<%= path %>/images/select.jpg') no-repeat center center;
    background-size:cover;
    color:white;
    position:relative;
}


.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 60px;
    background:#111;
    position:relative;
}

/* Slim Red Line */
.navbar::after{
    content:"";
    position:absolute;
    bottom:0;
    left:0;
    width:100%;
    height:2px;              /* perfect thickness */
    background:#ff2e2e;      /* simple red */
}

@keyframes moveLine{
    0%{background-position:0% 0%;}
    100%{background-position:200% 0%;}
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
    transition:0.3s;
}

.nav-links a:hover{
    color:#ff3b3b;
}

.main{
    display:flex;
    justify-content:space-between;
    align-items:center;
    
    padding:30px 8%;
    min-height:calc(100vh - 80px);
}

.left-content{
    width:45%;
    animation:fadeLeft 1s ease-in-out;
}

@keyframes fadeLeft{
    from{opacity:0; transform:translateX(-40px);}
    to{opacity:1; transform:translateX(0);}
}

.left-content h1{font-size:45px;}
.left-content span{color:#00ffcc;}
.left-content p{margin-top:15px;font-size:18px;color:red;}

.form-container{
    width:460px;
    background:linear-gradient(145deg,#111,#0a0a0a);
    padding:30px 35px;
    border-radius:25px;
    box-shadow:
        0 25px 60px rgba(0,0,0,0.9),
        inset 0 0 0 1px rgba(255,255,255,0.05);
    position:relative;
    backdrop-filter: blur(6px);

    /* NEW ANIMATION */
    animation: boxZoomIn 0.8s cubic-bezier(.68,-0.55,.27,1.55);
}

/* Smooth premium zoom animation */
@keyframes boxZoomIn{
    0%{
        opacity:0;
        transform:scale(0.8) translateY(40px);
    }
    60%{
        opacity:1;
        transform:scale(1.05) translateY(-5px);
    }
    100%{
        transform:scale(1) translateY(0);
    }
}

/* Badge */
.badge{
    position:absolute;
    top:-14px;
    right:25px;
    background:linear-gradient(45deg,#00ffcc,#00b894);
    padding:6px 18px;
    border-radius:30px;
    font-size:11px;
    font-weight:600;
    letter-spacing:1px;
    color:#000;
}

/* Steps Modern Style */
.steps{
    display:flex;
    justify-content:space-between;
    font-size:13px;
    margin-bottom:25px;
    color:#777;
}

.steps span{
    position:relative;
}

.steps .active{
    color:#ff2b2b;
    font-weight:600;
}

.steps .active::after{
    content:"";
    position:absolute;
    bottom:-6px;
    left:0;
    width:100%;
    height:2px;
    background:#ff2b2b;
    border-radius:2px;
}

/* Heading */
.form-container h2{
    text-align:center;
    margin-bottom:30px;
    font-size:24px;
    color:#ffffff;
    letter-spacing:1px;
}

/* Form Groups */
.form-group{
    margin-bottom:14px;
}

label{
    display:block;
    margin-bottom:8px;
    font-size:13px;
    color:#aaa;
    letter-spacing:0.5px;
}

/* Inputs */
input, select{
    width:100%;
    padding:12px;
    border-radius:14px;
    background:#1c1c1c;
    border:1px solid #2a2a2a;
    color:white;
    font-size:14px;
    transition:0.3s ease;
}

input::placeholder{
    color:#666;
}

input:focus, select:focus{
    outline:none;
    border:1px solid #ff2b2b;
    box-shadow:0 0 10px rgba(255,43,43,0.4);
    background:#222;
}
/* ===== DATE PICKER FIX ===== */
input[type="date"]{
    color:white;
    background:#1c1c1c;
}

/* Make calendar icon white */
input[type="date"]::-webkit-calendar-picker-indicator{
    filter: invert(1);
    cursor:pointer;
}

/* Optional: better hover effect */
input[type="date"]::-webkit-calendar-picker-indicator:hover{
    filter: invert(1) brightness(1.3);
}

/* Button Premium */
button{
    width:100%;
    padding:15px;
    margin-top:10px;
    border:none;
    border-radius:40px;
    font-weight:600;
    font-size:15px;
    color:white;
    background:linear-gradient(45deg,#ff1a1a,#b30000);
    cursor:pointer;
    transition:0.3s ease;
    letter-spacing:1px;
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(255,0,0,0.5);
}
/* ===== SLOT DROPDOWN PREMIUM STYLE ===== */

select[name="slotTime"] {
    background: linear-gradient(145deg,#1a1a1a,#0f0f0f);
    border: 1px solid #2c2c2c;
    border-radius: 16px;
    padding: 12px;
    font-size: 14px;
    color: #fff;
    transition: all 0.3s ease;
    box-shadow: 0 5px 15px rgba(0,0,0,0.6);
    cursor: pointer;
}

/* Focus Effect */
select[name="slotTime"]:focus {
    border: 1px solid #ff2b2b;
    box-shadow: 0 0 12px rgba(255,43,43,0.5);
    outline: none;
}

/* Hover Effect */
select[name="slotTime"]:hover {
    border: 1px solid #ff2b2b;
}

/* Dropdown option styling */
select[name="slotTime"] option {
    background-color: #111;
    color: #fff;
    padding: 10px;
}

/* Selected option */
select[name="slotTime"] option:checked {
    background-color: #ff2b2b;
    color: #fff;
}
footer{
    background:#111;
    color:#aaa;
    text-align:center;
    padding:20px;
    margin-top:40px;
    position:relative;
    z-index:2;
    font-size:14px;
}
/* ===== CUSTOM POPUP ===== */

.custom-popup{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.75);
    display:flex;
    justify-content:center;
    align-items:center;
    z-index:9999;
    animation:fadeIn 0.3s ease-in-out;
}

.popup-box{
    background:#111;
    padding:30px;
    width:350px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 0 20px rgba(255,0,0,0.25);
    animation:scaleIn 0.3s ease-in-out;
}

.popup-box h3{
    color:#ff3b3b;
    margin-bottom:15px;
}

.popup-box p{
    font-size:14px;
    margin-bottom:20px;
    color:#ccc;
}

.popup-box button{
    padding:10px 25px;
    border:none;
    border-radius:20px;
    background:#ff3b3b;
    color:white;
    cursor:pointer;
    font-weight:bold;
}

.popup-box button:hover{
    background:#cc0000;
}

.close-btn{
    position:absolute;
    top:10px;
    right:15px;
    cursor:pointer;
    color:#aaa;
    font-size:18px;
}

.close-btn:hover{
    color:white;
}

@keyframes fadeIn{
    from{opacity:0;}
    to{opacity:1;}
}

@keyframes scaleIn{
    from{transform:scale(0.8);}
    to{transform:scale(1);}
}


</style>
</head>

<body>

<div class="navbar">
    <div class="logo">CarCure</div>
    <div class="nav-links">
        <a href="Home.jsp">Home</a>
        <a href="About.jsp">About</a>
       <a href="Availability.jsp">Available Time Slots</a>
        <a href="Contact.jsp">Contact Us</a>
        <a href="SignIn.jsp">Sign In</a>
    </div>
</div>

<div class="main">

<div class="left-content">
    <h1>Book Your <span>Service Slot</span></h1>
    <p>Choose your preferred time and confirm your vehicle service in seconds.</p>
    <h3><span>Check ViewBook For Available Time Slots Before Confirming Your Booking.</span></h3>
</div>

<div class="form-container">
    <div class="badge">Fast Booking</div>

    <div class="steps">
        <span class="active">1. Select Slot</span>
        <span>2. Confirm</span>
        <span>3. Payment</span>
    </div>

    <h2>Select Service Slot</h2>

    <form action="bookSlot" method="post">
    

        <div class="form-group">
            <label>Vehicle Number</label>
          <input type="text" name="vehicleNumber"
       placeholder="Eg: RJ06CB5063"
       pattern="[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}"
       title="Enter valid vehicle number (e.g. RJ06CB5063)"
       style="text-transform:uppercase;"
       required>
        </div>
<div class="form-group">
    <label>Car</label>
    <input 
        list="carList"
        name="carName"
        value="<%=carNameVal%>"
        placeholder="Type to search your car..."
        required>

    <datalist id="carList">
    
    

        <!-- 🚗 Economy Cars -->
        <option value="Maruti Suzuki Swift">
        <option value="Maruti Suzuki Baleno">
        <option value="Maruti Suzuki Alto">
        <option value="Maruti Suzuki WagonR">
        <option value="Hyundai i10">
        <option value="Hyundai i20">
        <option value="Tata Tiago">
        <option value="Honda Amaze">

        <!-- 🚙 SUV Cars -->
        <option value="Hyundai Creta">
        <option value="Kia Seltos">
         <option value="Kia Sonet">
          <option value="kia carnival">
           <option value="kia Carens">
        <option value="Tata Nexon">
        <option value="Tata Harrier">
        <option value="Mahindra Scorpio">
        <option value="Mahindra Thar">
        <option value="Mahindra XUV700">
        <option value="Toyota Fortuner">
        <option value="Toyota Innova">

        <!-- ⚡ Electric Cars -->
        <option value="Tata Nexon EV">
        <option value="MG ZS EV">
        <option value="Hyundai Kona Electric">
        <option value="Mahindra XUV400">
        <option value="BYD Atto 3">

        <!-- 💎 Luxury Cars -->
        <option value="BMW 3 Series">
        <option value="BMW 5 Series">
        <option value="BMW 7 Series">
        <option value="BMW X5">
        <option value="BMW X7">
        <option value="Audi A4">
        <option value="Audi A6">
        <option value="Audi Q7">
        <option value="Audi Q8">
        <option value="Mercedes C-Class">
        <option value="Mercedes E-Class">
        <option value="Mercedes S-Class">
        <option value="Mercedes GLS">
        <option value="Mercedes G-Wagon">
        <option value="Jaguar F-Pace">
        <option value="Volvo XC60">
        <!-- 🏎️ Pagani Hypercars -->

<option value="Pagani Zonda">
<option value="Pagani Zonda C12">
<option value="Pagani Zonda F">
<option value="Pagani Zonda Cinque">
<option value="Pagani Zonda R">
<option value="Pagani Zonda HP Barchetta">
<option value="Pagani Huayra">
<option value="Pagani Huayra BC">
<option value="Pagani Huayra Roadster">
<option value="Pagani Huayra Roadster BC">
<option value="Pagani Huayra Imola">
<option value="Pagani Huayra Codalunga">
<option value="Pagani Utopia">
<option value="Pagani Utopia Roadster">
        <option value="Land Rover Defender">
        <option value="Land Rover Range Rover">
        <option value="Porsche Cayenne">
        <option value="Bentley Bentayga">
        <option value="Rolls Royce Ghost">
        <option value="Rolls Royce Phantom">
<option value="Rolls Royce Phantom Extended">
<option value="Rolls Royce Ghost">
<option value="Rolls Royce Ghost Extended">
<option value="Rolls Royce Cullinan">
<option value="Rolls Royce Cullinan Black Badge">
<option value="Rolls Royce Wraith">
<option value="Rolls Royce Dawn">
<option value="Rolls Royce Spectre">
<option value="Rolls Royce Silver Ghost">
<option value="Rolls Royce Silver Spur">
<option value="Rolls Royce Silver Shadow">
<option value="Rolls Royce Corniche">
<option value="Rolls Royce Sweptail">
<option value="Rolls Royce Boat Tail">
<option value="Rolls Royce Black Badge Ghost">
<option value="Rolls Royce Black Badge Wraith">
<option value="Rolls Royce Black Badge Cullinan">
        <option value="Lamborghini Urus">
        <option value="Lamborghini Aventador">
<option value="Lamborghini Aventador SVJ">
<option value="Lamborghini Huracan">
<option value="Lamborghini Huracan Evo">
<option value="Lamborghini Huracan STO">
<option value="Lamborghini Huracan Tecnica">
<option value="Lamborghini Urus">
<option value="Lamborghini Urus Performante">
<option value="Lamborghini Urus S">
<option value="Lamborghini Revuelto">
<option value="Lamborghini Gallardo">
<option value="Lamborghini Murcielago">
<option value="Lamborghini Diablo">
<option value="Lamborghini Countach">
<option value="Lamborghini Sian">
<option value="Lamborghini Centenario">
<option value="Lamborghini Veneno">
<option value="Lamborghini Reventon">
        <option value="Ferrari Roma">
        <option value="Aston Martin DB11">

    </datalist>
</div>
        <div class="form-group">
            <label>Select Service Date</label>
            <input type="date" name="selectedDate" min="<%= today %>" required>
        </div>

      <div class="form-group">
    <label>Select Service</label>
    <select name="serviceType" required>
        <option value="">-- Choose Service --</option>
        
         <!-- 👑 VIP Services -->
        <optgroup label="👑 VIP & Premium">
            <option value="VIP Priority Express Service - 14999" <%= "VIP Priority Express Service - 14999".equals(serviceTypeVal) ? "selected" : "" %>>
                VIP Priority Express Service – ₹21,999
            </option>
        </optgroup>
        

        <!-- 🔧 Regular Maintenance Services -->
        <optgroup label="🔧 Regular Maintenance">
            <option value="Full Car Service - 12999" <%= "Full Car Service - 12999".equals(serviceTypeVal) ? "selected" : "" %>>
                Full Car Service – ₹12,999
            </option>

            <option value="Engine Service - 9999" <%= "Engine Service - 9999".equals(serviceTypeVal) ? "selected" : "" %>>
                Engine Service – ₹9,999
            </option>

            <option value="Oil Change Service - 4999" <%= "Oil Change Service - 4999".equals(serviceTypeVal) ? "selected" : "" %>>
                Oil Change Service – ₹4,999
            </option>

            <option value="Brake Service - 6499" <%= "Brake Service - 6499".equals(serviceTypeVal) ? "selected" : "" %>>
                Brake Service – ₹6,499
            </option>

            <option value="Battery Service - 3999" <%= "Battery Service - 3999".equals(serviceTypeVal) ? "selected" : "" %>>
                Battery Service – ₹3,999
            </option>

            <option value="AC Service - 7499" <%= "AC Service - 7499".equals(serviceTypeVal) ? "selected" : "" %>>
                AC Service – ₹7,499
            </option>

            <option value="Wheel Alignment & Balancing - 4499" <%= "Wheel Alignment & Balancing - 4499".equals(serviceTypeVal) ? "selected" : "" %>>
                Wheel Alignment & Balancing – ₹4,499
            </option>
        </optgroup>


        <!-- 💎 Detailing & Protection Services -->
        <optgroup label="💎 Detailing & Protection">
            <option value="Premium Interior Detailing - 8999" <%= "Premium Interior Detailing - 8999".equals(serviceTypeVal) ? "selected" : "" %>>
                Premium Interior Detailing – ₹8,999
            </option>

            <option value="Complete Car Detailing - 15999" <%= "Complete Car Detailing - 15999".equals(serviceTypeVal) ? "selected" : "" %>>
                Complete Car Detailing – ₹15,999
            </option>

            <option value="Luxury Interior Restoration - 18999" <%= "Luxury Interior Restoration - 18999".equals(serviceTypeVal) ? "selected" : "" %>>
                Luxury Interior Restoration – ₹18,999
            </option>

            <option value="Exterior Ceramic Coating - 24999" <%= "Exterior Ceramic Coating - 24999".equals(serviceTypeVal) ? "selected" : "" %>>
                Exterior Ceramic Coating – ₹24,999
            </option>

            <option value="Paint Protection Film (PPF) - 45999" <%= "Paint Protection Film (PPF) - 45999".equals(serviceTypeVal) ? "selected" : "" %>>
                Paint Protection Film (PPF) – ₹45,999
            </option>

            <option value="Wheel Rim Repair & Polish - 7499" <%= "Wheel Rim Repair & Polish - 7499".equals(serviceTypeVal) ? "selected" : "" %>>
                Wheel Rim Repair & Polish – ₹7,499
            </option>
        </optgroup>


        <!-- 🏎 Performance & Inspection -->
        <optgroup label="🏎 Performance & Inspection">
            <option value="Suspension & Performance Check - 7999" <%= "Suspension & Performance Check - 7999".equals(serviceTypeVal) ? "selected" : "" %>>
                Suspension & Performance Check – ₹7,999
            </option>

            <option value="Transmission Service - 11999" <%= "Transmission Service - 11999".equals(serviceTypeVal) ? "selected" : "" %>>
                Transmission Service – ₹11,999
            </option>

            <option value="Turbocharger Inspection - 6999" <%= "Turbocharger Inspection - 6999".equals(serviceTypeVal) ? "selected" : "" %>>
                Turbocharger Inspection – ₹6,999
            </option>

            <option value="Exhaust System Upgrade Check - 5499" <%= "Exhaust System Upgrade Check - 5499".equals(serviceTypeVal) ? "selected" : "" %>>
                Exhaust System Upgrade Check – ₹5,499
            </option>

            <option value="Advanced Computer Diagnostics - 3999" <%= "Advanced Computer Diagnostics - 3999".equals(serviceTypeVal) ? "selected" : "" %>>
                Advanced Computer Diagnostics – ₹3,999
            </option>

            <option value="Supercar Handling Inspection - 19999" <%= "Supercar Handling Inspection - 19999".equals(serviceTypeVal) ? "selected" : "" %>>
                Supercar Handling Inspection – ₹19,999
            </option>
        </optgroup>

    </select>
</div>
        <div class="form-group">
            <label>Select Time Slot</label>
            <select name="slotTime" required>
                <option value="">-- Choose Slot --</option>
                <option>09:00 AM</option>
                <option>10:00 AM</option>
                <option>11:00 AM</option>
                <option>12:00 PM</option>
                <option>01:00 PM</option>
                <option>02:00 PM</option>
                <option>03:00 PM</option>
                <option>04:00 PM</option>
                <option>05:00 PM</option>
                <option>06:00 PM</option>
                <option>07:00 PM</option>
                <option>08:00 PM</option>
            </select>
        </div>

        <button type="submit">Confirm Slot</button>

    </form>
</div>
</div>

<footer>
    © 2026 CarCure All Rights Reserved. | Designed for Premium Automobile Service Experience.
</footer>

<!-- ✅ FIXED POPUP -->
<% if("notavailable".equals(error)){ %>
<div class="custom-popup" id="slotPopup">
    <div class="popup-box">
        <span class="close-btn" onclick="closePopup()">×</span>
       <h3>❌ Slot Unavailable</h3>
<p>Hard luck, this time slot has already been booked.<br>
Please choose another available time.</p>
        <button type="button" onclick="closePopup()">OK</button>
    </div>
</div>
<% } %>

<!-- ✅ JAVASCRIPT FIX -->
<script>
function closePopup(){
    var popup = document.getElementById("slotPopup");
    if(popup){
        popup.style.display = "none";
    }
}
</script>

</body>
</html>