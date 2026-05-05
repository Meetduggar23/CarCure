<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<%
    String path = request.getContextPath();

    String selectedDate = request.getParameter("selectedDate");
    if(selectedDate == null){
        selectedDate = java.time.LocalDate.now().toString();
    }

    String[] allSlots = {
        "09:00 AM","10:00 AM","11:00 AM",
        "12:00 PM","01:00 PM","02:00 PM",
        "03:00 PM","04:00 PM","05:00 PM",
        "06:00 PM","07:00 PM","08:00 PM"
    };
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Slots | CarCure</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

/* BODY */

body{
min-height:100vh;
display:flex;
flex-direction:column;
background:
linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.9)),
url('<%= path %>/images/available.jpg') no-repeat left center;
background-size:cover;
color:white;
animation:fadeIn 1s ease;
}

/* ANIMATION */

@keyframes fadeIn{
from{opacity:0;}
to{opacity:1;}
}

/* NAVBAR */

.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:20px 80px;
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
font-size:28px;
font-weight:bold;
color:#ff2e2e;
letter-spacing:1px;
transition:0.3s;
}


.nav-links a{
text-decoration:none;
color:#ddd;
margin-left:30px;
font-size:15px;
position:relative;
transition:0.3s;
}

.nav-links a:hover{
color:#ff2e2e;
}

/* CONTAINER */

.container{
width:900px;
margin:80px 120px 60px auto;

background:rgba(20,20,20,0.9);
backdrop-filter:blur(12px);

padding:45px;
border-radius:22px;

border:1px solid rgba(255,0,0,0.15);

box-shadow:
0 0 40px rgba(255,0,0,0.12),
0 20px 60px rgba(0,0,0,0.7);

animation:slideUp .9s ease;
flex:1;
}

/* SLIDE ANIMATION */

@keyframes slideUp{
from{
transform:translateY(40px);
opacity:0;
}
to{
transform:translateY(0);
opacity:1;
}
}

h2{
text-align:center;
margin-bottom:30px;
color:#ff2e2e;
font-size:26px;
letter-spacing:.5px;
}

/* FILTER */

.filter{
text-align:center;
margin-bottom:35px;
display:flex;
justify-content:center;
gap:20px;
}

/* DATE INPUT */

input[type="date"]{
padding:14px 20px;
border-radius:12px;
border:1px solid #333;
background:#1c1c1c;
color:white;
font-size:15px;
transition:.3s;
width:220px;
}

input[type="date"]:hover{
border:1px solid #ff2e2e;
box-shadow:0 0 12px rgba(255,0,0,0.4);
}

input[type="date"]:focus{
outline:none;
border:1px solid #ff2e2e;
}

/* BUTTON */

button{
padding:14px 30px;
border:none;
border-radius:12px;

background:linear-gradient(45deg,#ff2e2e,#b80000);

color:white;
font-size:15px;
cursor:pointer;

transition:.3s;
}

button:hover{
transform:translateY(-3px);
box-shadow:0 0 18px rgba(255,0,0,0.5);
}

/* SLOTS GRID */

.slots{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:22px;
}

/* SLOT CARD */

.slot-card{
padding:22px;
border-radius:16px;

background:#1a1a1a;

border:1px solid #2c2c2c;

text-align:center;

font-size:16px;
letter-spacing:.5px;

transition:.35s;

cursor:pointer;
position:relative;
overflow:hidden;
}

/* HOVER EFFECT */

.slot-card:hover{
transform:translateY(-6px);

border:1px solid #ff2e2e;

box-shadow:
0 0 18px rgba(255,0,0,0.45),
0 10px 25px rgba(0,0,0,0.8);
}

/* GLOW EFFECT */

.slot-card::before{
content:"";
position:absolute;
top:0;
left:-100%;
width:100%;
height:100%;
background:linear-gradient(
120deg,
transparent,
rgba(255,0,0,0.35),
transparent
);

transition:.6s;
}

.slot-card:hover::before{
left:100%;
}

/* NO SLOT MESSAGE */

.no-slots{
text-align:center;
padding:35px;
font-size:19px;
color:#ff2e2e;
}

/* FOOTER */

footer{
text-align:center;
padding:16px;
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
        <a href="<%=path%>/Home.jsp">Home</a>
        <a href="<%=path%>/About.jsp">About</a>
        <a href="<%=path%>/Contact.jsp">Contact Us</a>
        <a href="<%=path%>/SignIn.jsp">Sign In</a>
    </div>
</div>

<div class="container">

<h2>Available Slots - <%= selectedDate %></h2>

<form method="get" class="filter">
    <input type="date" name="selectedDate"
           value="<%= selectedDate %>"
           min="<%= java.time.LocalDate.now() %>">
    <button type="submit">Check</button>
</form>

<div class="slots">

<%
boolean anyAvailable = false;

for(String slot : allSlots){

    boolean isBooked = false;

    try{
        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM slot_bookings WHERE slot=? AND date=?"
        );

        ps.setString(1, slot);
        ps.setString(2, selectedDate);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            isBooked = true;
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    if(!isBooked){
        anyAvailable = true;
%>

    <div class="slot-card">
        <%= slot %>
    </div>

<%
    }
}

if(!anyAvailable){
%>

<div class="no-slots">
    All slots are booked for this date.
</div>

<%
}
%>

</div>
</div>
<footer>
    © 2026 CarCure | Premium Automobile Service Experience
</footer>
</body>
</html>