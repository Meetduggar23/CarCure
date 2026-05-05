<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarCure | Premium Vehicle Service</title>

<style>
html,body{
    margin:0;
    padding:0;
    font-family:'Segoe UI',sans-serif;
}

/* ================= NAVBAR ================= */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 60px;
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

.logo span{
    font-size:28px;
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

/* ================= HERO ================= */
/* ================= HERO ================= */
.hero{
    height:100vh;
    background:
        linear-gradient(rgba(0,0,0,0.75), rgba(0,0,0,0.75)),
        url('<%= path %>/images/home1.jpg') center/cover no-repeat;
    
    background-attachment: fixed;   /* 🔥 THIS MAKES BACKGROUND STAY */
    
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
    color:white;
    position:relative;
    overflow:hidden;
}

/* Slow zoom background animation */
@keyframes zoomBg{
    from{
        background-size:100%;
    }
    to{
        background-size:110%;
    }
}
.hero-title{
    font-size:50px;
    animation:slideDown 1s ease;
}

.hero-title span{
    color:#ff3b3b;
}

.hero p{
    margin-top:20px;
    font-size:18px;
    color:#ddd;
    animation:fadeUp 1.2s ease;
}



.hero::before{
    top:-100px;
    left:-100px;
}

.hero::after{
    bottom:-120px;
    right:-120px;
}

.hero-content{
    animation:floatContent 4s ease-in-out infinite alternate;
}

@keyframes floatContent{
    from{
        transform:translateY(0px);
    }
    to{
        transform:translateY(15px);
    }
}

.cta-btn{
    margin-top:35px;
    padding:14px 40px;
    background:linear-gradient(45deg,#ff3b3b,#b30000);
    border:none;
    border-radius:30px;
    color:white;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
    animation:fadeUp 1.5s ease;
}

.cta-btn:hover{
    transform:scale(1.05);
    box-shadow:0 10px 25px rgba(255,59,59,0.5);
}

/* HERO LOGO POSITION */
.hero-logo-right{
    position:absolute;
    right:20%;
    top:53%;
    width:230px;
    height:auto;

    opacity:0;
    transform:translate(350px,-104%);
    animation:logoSlide 1s ease forwards;
}

/* Logo slide from right */
@keyframes logoSlide{
    to{
        opacity:1;
        transform:translate(0,-104%);
    }
}



/* HERO ANIMATIONS */
@keyframes slideDown{
    from{opacity:0; transform:translateY(-40px);}
    to{opacity:1; transform:translateY(0);}
}

@keyframes fadeUp{
    from{opacity:0; transform:translateY(30px);}
    to{opacity:1; transform:translateY(0);}
}

/* ================= FEATURES ================= */
.features{
    background:#f5f5f5;
    padding:100px 10%;
    text-align:center;
}

.features h2{
    font-size:36px;
    margin-bottom:60px;
    color:#b30000;
}

.feature-box{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:40px;
}

.card{
    background:white;
    padding:40px 30px;
    border-radius:18px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
    transition:0.3s;
    opacity:0;
    transform:translateY(40px);
    animation:cardReveal 0.8s ease forwards;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 20px 40px rgba(255,59,59,0.2);
}

.card h3{
    margin-bottom:15px;
    color:#ff3b3b;
}

.card p{
    color:#555;
    line-height:1.7;
}

@keyframes cardReveal{
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.card:nth-child(1){ animation-delay:0.1s; }
.card:nth-child(2){ animation-delay:0.2s; }
.card:nth-child(3){ animation-delay:0.3s; }
.card:nth-child(4){ animation-delay:0.4s; }
.card:nth-child(5){ animation-delay:0.5s; }
.card:nth-child(6){ animation-delay:0.6s; }

/* ================= FOOTER ================= */
.footer{
    background:#111;
    color:#ccc;
    padding:60px 10% 20px;
    
}

.footer-container{
    display:flex;
    justify-content:space-between;
    flex-wrap:wrap;
    gap:40px;
}

.footer-col{
    flex:1;
    min-width:220px;
}

.footer-col h4{
    color:#ff3b3b;
    margin-bottom:15px;
}

.footer-col p{
    margin-bottom:10px;
    line-height:1.6;
}

.footer-link{
    display:block;
    color:#ccc;
    text-decoration:none;
    margin-bottom:8px;
    transition:0.3s;
}

.footer-link:hover{
    color:#ff3b3b;
}

.app-btn{
    display:block;
    width:180px;
    padding:10px;
    margin-bottom:10px;
    background:#000;
    color:white;
    border:1px solid #444;
    border-radius:8px;
    cursor:pointer;
    transition:0.3s;
}

.app-btn:hover{
    background:#ff3b3b;
}

.footer-bottom{
    text-align:center;
    margin-top:40px;
    border-top:1px solid #222;
    padding-top:15px;
    font-size:14px;
    color:#888;
}

/* RESPONSIVE */
@media(max-width:900px){
    .navbar{
        flex-direction:column;
        gap:15px;
    }

    .hero-logo-right{
        position:static;
        margin-top:20px;
        width:150px;
    }
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">
        <span>CarCure</span>
    </div>

    <div class="nav-links">
        <a href="<%= path %>/About.jsp">About</a>
        <a href="<%= path %>/Blog.jsp">Blog</a>
        <a href="<%= path %>/Contact.jsp">Contact</a>
        <a href="<%= path %>/SignIn.jsp">Sign In</a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    
    <h1 class="hero-title">
        Welcome to <span>CarCure</span>
    </h1>

    <img src="<%= path %>/images/logo.jpg" class="hero-logo-right" alt="CarCure Logo">

    <p>Luxury Care for Every Car.</p>

    <form action="<%= path %>/SignIn.jsp">
        <button class="cta-btn">Get Started</button>
    </form>

</div>

<!-- FEATURES -->
<div class="features">
    <h2>Why Choose CarCure?</h2>

    <div class="feature-box">
        <div class="card">
            <h3>Easy Booking</h3>
            <p>Schedule your vehicle service online in just a few clicks.</p>
        </div>

        <div class="card">
            <h3>Certified Mechanics</h3>
            <p>Experienced professionals ensuring quality and reliability.</p>
        </div>

        <div class="card">
            <h3>Genuine Spare Parts</h3>
            <p>We use 100% genuine and high-quality spare parts to ensure long-lasting performance and safety for your vehicle.</p>
        </div>

        <div class="card">
            <h3>Advanced Diagnostics</h3>
            <p>Our modern diagnostic tools quickly detect issues and ensure accurate, efficient servicing every time.</p>
        </div>

        <div class="card">
            <h3>Service Warranty</h3>
            <p>All our services come with a limited warranty for complete peace of mind and customer satisfaction.</p>
        </div>

        <div class="card">
            <h3>Transparent Pricing</h3>
            <p>No hidden charges. Get clear service estimates before work begins so you always stay in control.</p>
        </div>
    </div>
</div>

<!-- FOOTER --> <div class="footer"> 
<div class="footer-container"> 
<div class="footer-col"> <h4>CarCure</h4>
 <p> CarCure Auto Care Pvt. Ltd. Baner Road, Pune – 411045 Maharashtra, India</p> 
 </div> <div class="footer-col"> <h4>Contact</h4> <p>Email: support@carcure.com</p> 
 <p>Phone: +91 9024315252 | <br> +91 72628 08628</p> </div> <div class="footer-col">
  <h4>Quick Links</h4> <a href="<%= path %>/About.jsp" class="footer-link">About Us</a>
   <a href="<%= path %>/Blog.jsp" class="footer-link">Blog</a> <a href="<%= path %>/Contact.jsp" class="footer-link">Contact</a>
    <a href="<%= path %>/PrivacyPolicy.jsp" class="footer-link">Privacy Policy</a> </div> <div class="footer-col"> 
    <h4>Download Our App</h4> <button class="app-btn">Google Play</button> <button class="app-btn">App Store</button> </div> 
    </div> <div class="footer-bottom"> © 2026 CarCure Service Center. All Rights Reserved. </div> </div>

</body>
</html>