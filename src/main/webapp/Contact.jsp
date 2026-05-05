<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<title>Contact | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    background:#0d0d0d;
    color:white;
    overflow-x:hidden;
    background: 
        linear-gradient(rgba(0,0,0,0.20), rgba(10,0,0,0.9)),
        url('<%=path%>/images/contact.jpg');
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
    margin-top:50px;
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
    font-size:40px;
}

.header p{
    color:#aaa;
    margin-top:10px;
}

/* CONTACT SECTION */
.contact-container{
    display:flex;
    justify-content:space-between;
    padding:70px 10%;
    flex-wrap:wrap;
}

/* LEFT SIDE ANIMATION */
.contact-info{
    width:45%;
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

.contact-info h3{
    color:#ff3b3b;
    margin-bottom:20px;
}

.contact-info p{
    margin-bottom:15px;
    color:#ccc;
}

/* RIGHT SIDE FORM ANIMATION */
.contact-form{
    width:45%;
    background:#1a1a1a;
    padding:35px;
    border-radius:18px;
    box-shadow:0 20px 40px rgba(0,0,0,0.6);
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

.contact-form input,
.contact-form textarea{
    width:100%;
    padding:12px;
    margin-bottom:15px;
    border:none;
    border-radius:8px;
    background:#333;
    color:white;
    transition:0.3s;
}

.contact-form input:focus,
.contact-form textarea:focus{
    outline:none;
    box-shadow:0 0 8px rgba(255,59,59,0.4);
}

.contact-form button{
    width:100%;
    padding:12px;
    background:linear-gradient(45deg,#ff3b3b,#b30000);
    border:none;
    border-radius:25px;
    font-weight:bold;
    color:white;
    cursor:pointer;
    transition:0.3s ease;
}

.contact-form button:hover{
    transform:translateY(-3px);
    box-shadow:0 12px 30px rgba(255,59,59,0.5);
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

.app-btn{
    margin-top:10px;
    display:block;
    padding:8px 15px;
    background:#333;
    border:none;
    border-radius:20px;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

.app-btn:hover{
    background:#ff3b3b;
}

.footer-bottom{
    text-align:center;
    padding-top:20px;
    font-size:13px;
    color:#888;
}

/* RESPONSIVE */
@media(max-width:900px){
    .contact-info,
    .contact-form{
        width:100%;
        margin-bottom:30px;
    }

    .footer-col{
        width:100%;
    }
    
    /* CURSOR GLOW EFFECT */

.cursor-glow{
position:fixed;
width:300px;
height:300px;
border-radius:50%;
background:radial-gradient(circle, rgba(255,50,50,0.25), transparent 60%);
pointer-events:none;
transform:translate(-50%,-50%);
z-index:0;
filter:blur(40px);
}
    
}}
</style>
</head>

<body>
<div class="cursor-glow" id="cursorGlow"></div>


<div class="navbar">
    <div class="logo">CarCure</div>
    <div class="nav-links">
        <a href="<%= path %>/Home.jsp">Home</a>
        <a href="<%= path %>/About.jsp">About</a>
         <a href="<%= path %>/Blog.jsp">Blog</a>
        <a href="<%= path %>/SignIn.jsp">Sign In</a>
    </div>
</div>

<div class="header">
    <h1>Contact CarCure</h1>
    <p>Nova here to assist you with your vehicle service needs.</p>
</div>

<div class="contact-container">

    <div class="contact-info">
        <h3>Get In Touch with Nova </h3>
        <p>Email: support@carcure.com</p>
        <p>Phone: +91 9024315252 , +91 72628 08628</p>
        
        <p>
            Address: CarCure Auto Care Pvt. Ltd.<br>
            Baner Road, Pune – 411045 Maharashtra, India
        </p>
        <p>Working Hours: Mon - Sat (9 AM - 8 PM)</p>
    </div>

    <div class="contact-form">
        <form action="#" method="post">
            <input type="text" placeholder="Your Name" required>
            <input type="email" placeholder="Your Email" required>
            <input type="text" placeholder="Phone Number">
            <textarea rows="4" placeholder="Your Message" required></textarea>
            <button type="submit">Send Message</button>
        </form>
    </div>

</div>

<div class="footer-main">
    <div class="footer-container">
        <div class="footer-col">
            <h3>About Us</h3>
            <ul>
                <li><a href="Home.jsp">Company</a></li>
                <li><a href="Blog.jsp">Blog</a></li>
                <li><a href="Contact.jsp">Contact Us</a></li>
            </ul>
        </div>

        <div class="footer-col">
            <h3>Contact Info</h3>
            <ul>
               <li> <p><strong>Email:</strong> support@carcure.com</p></li>
            <li><p><strong>Phone:</strong> +91 9024315252 , +91 7262808628</p></li>
                
            </ul>
        </div>
    </div>

    <div class="footer-bottom">
        © 2026 CarCure. All Rights Reserved.
    </div>
</div>

</body>
<script>
const glow = document.getElementById("cursorGlow");

document.addEventListener("mousemove", (e) => {
    glow.style.left = e.clientX + "px";
    glow.style.top = e.clientY + "px";
});
</script>

</html>