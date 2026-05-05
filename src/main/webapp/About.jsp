<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<title>About | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    color:white;
    overflow-x:hidden;
    background: 
        linear-gradient(rgba(0,0,0,0.20), rgba(10,0,0,0.9)),
        url('<%=path%>/images/about2.jpg');
    background-size:cover;
    background-position:center 20%;   /* adjust this */
    background-attachment:fixed;
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

/* HEADER ANIMATION */
.header{
    text-align:center;
    margin-top:90px;   /* increased */
    opacity:0;
    transform:translateY(40px);
    animation:fadeDown 1s ease forwards;
}

@keyframes fadeDown{
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.header h1{
    font-size:42px;
}

.header p{
    color:#aaa;
    margin-top:10px;
}

/* MAIN CONTENT */
.about-container{
    display:flex;
    justify-content:space-between;
    padding:80px 10%;
    flex-wrap:wrap;
}

/* LEFT SIDE */
.about-text{
    width:48%;
    opacity:0;
    transform:translateX(-60px);
    animation:slideLeft 1s ease forwards;
    animation-delay:0.3s;
}

@keyframes slideLeft{
    to{
        opacity:1;
        transform:translateX(0);
    }
}

.about-text h2{
    color:#ff3b3b;
    margin-bottom:20px;
}

.about-text p{
    color:#ccc;
    line-height:1.8;
    margin-bottom:20px;
}

/* RIGHT SIDE CARDS */
.about-cards{
    width:45%;
    opacity:0;
    transform:translateX(60px);
    animation:slideRight 1s ease forwards;
    animation-delay:0.5s;
}

@keyframes slideRight{
    to{
        opacity:1;
        transform:translateX(0);
    }
}

.card{
    background:#1a1a1a;
    padding:25px;
    border-radius:15px;
    margin-bottom:20px;
    box-shadow:0 15px 40px rgba(0,0,0,0.6);
    transition:0.3s ease;
}

.card:hover{
    transform:translateY(-5px);
    box-shadow:0 20px 45px rgba(255,59,59,0.3);
}

.card h3{
    color:#ff3b3b;
    margin-bottom:10px;
}

/* FOOTER */
.footer-main{
    background:#1a1a1a;
    padding:60px 10%;
    margin-top:80px;
    opacity:0;
    transform:translateY(40px);
    animation:fadeUp 1s ease forwards;
    animation-delay:0.8s;
    
}

@keyframes fadeUp{
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.footer-container{
    display:flex;
    justify-content:space-between;
    flex-wrap:wrap;
    border-bottom:1px solid #333;
    padding-bottom:40px;
}

.footer-col{
    width:22%;
    margin-bottom:20px;
}

.footer-col h3{
    margin-bottom:20px;
    font-size:18px;
}

.footer-col ul{
    list-style:none;
}

.footer-col ul li{
    margin-bottom:12px;
}

.footer-col ul li a{
    text-decoration:none;
    color:#aaa;
    font-size:14px;
    transition:0.3s;
}

.footer-col ul li a:hover{
    color:#ff3b3b;
}

.footer-bottom{
    text-align:center;
    padding-top:20px;
    font-size:13px;
    color:#888;
}

/* RESPONSIVE */
@media(max-width:900px){
    .about-text,
    .about-cards{
        width:100%;
        margin-bottom:40px;
    }

    .footer-col{
        width:100%;
    }
}
</style>
</head>

<body>

<div class="navbar">
    
    <div class="logo">
        CarCure
    </div>

    <div class="nav-links">
        <a href="<%= path %>/Home.jsp">Home</a>
        <a href="<%= path %>/Contact.jsp">Contact Us</a>
        <a href="<%= path %>/Blog.jsp">Blog</a>
        <a href="<%= path %>/SignIn.jsp">Sign In</a>
    </div>

</div>

<div class="header">
    <h1>About CarCure</h1>
    <p>Delivering premium automobile service with trust and precision.</p>
</div>

<div class="about-container">

    <div class="about-text">
        <h2>Who We Are</h2>
        <p>
            CarCure is a modern vehicle service booking platform designed to
            simplify car maintenance. We combine professional expertise with
            digital convenience.
        </p>

        <h2>Our Mission</h2>
        <p>
            To provide reliable, affordable, and high-quality automotive
            servicing through certified professionals and advanced technology.
        </p>
    </div>

    <div class="about-cards">
        <div class="card">
            <h3>Online Booking</h3>
            <p>Choose your service and select a convenient time slot easily.</p>
        </div>

        <div class="card">
            <h3>Certified Mechanics</h3>
            <p>Our trained technicians ensure high standards of vehicle care.</p>
        </div>

        <div class="card">
            <h3>Quality Assurance</h3>
            <p>We perform thorough checks before delivering your vehicle.</p>
        </div>
    </div>

</div>

<div class="footer-main">
    <div class="footer-container">
        <div class="footer-col">
            <h3>Company</h3>
            <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="PrivacyPolicy.jsp">Privacy Policy</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h3>Contact Info</h3>
            <ul>
                <li>Email: support@carcure.com</li>
                <li>Phone: +91 9024315252, +91 7262808628</li>
                <li>CarCure Auto Care Pvt. Ltd. Baner Road, Pune – 411045 Maharashtra, India</li>
            </ul>
        </div>
    </div>

    <div class="footer-bottom">
        © 2026 CarCure. All Rights Reserved.
    </div>
</div>

</body>
</html>