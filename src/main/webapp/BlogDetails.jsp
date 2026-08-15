<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();

    String post = request.getParameter("post");
    String custom = request.getParameter("custom");

    String title = "";
    String content = "";
    String category = "Maintenance";
    String image = path + "/images/blog-bg.jpg";

    /* ===== DEFAULT BLOGS ===== */

    if("service".equals(post)){
        title = "5 Signs Your Car Needs Immediate Service";
        content = "Unusual engine noises, warning lights, reduced fuel efficiency, vibrations, and brake issues are early warning signs. Ignoring them may lead to expensive repairs and breakdowns.";
        category = "Car Maintenance";
    }
    else if("monsoon".equals(post)){
        title = "Monsoon Car Care Tips";
        content = "Check wipers, inspect brakes, clean battery terminals, and protect paint coating. Monsoon maintenance keeps your car safe and reliable during heavy rainfall.";
        category = "Seasonal Care";
    }
    else if("interval".equals(post)){
        title = "How Often Should You Service Your Car?";
        content = "Experts recommend servicing every 6 months or 5,000–10,000 km depending on usage. Regular servicing increases performance and longevity.";
        category = "Service Guide";
    }
    else if("mileage".equals(post)){
        title = "Improve Your Car’s Mileage";
        content = "Maintaining proper tire pressure, avoiding sudden acceleration and regular servicing improves mileage.";
        category = "Performance";
    }
    else if("alignment".equals(post)){
        title = "Importance of Wheel Alignment";
        content = "Proper wheel alignment ensures smooth handling, even tire wear and better fuel efficiency.";
        category = "Safety";
    }
    else if("diagnostic".equals(post)){
        title = "New Diagnostic Tools at CarCure";
        content = "Advanced diagnostic machines help detect issues quickly and improve service accuracy.";
        category = "Technology";
    }

    /* ===== CUSTOM BLOGS FROM POPUP ===== */

    if("true".equals(custom)){
        title = request.getParameter("title");
        content = request.getParameter("content");
        category = "Custom Blog";
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= title %> | CarCure Blog</title>

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:
linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.9)),
url('<%=path%>/images/Blogdetail.jpg');
background-size:cover;
background-position:center;
color:white;
overflow-x:hidden;
animation:pageFade 1s ease;
}

/* ===== NAVBAR (NOT CHANGED) ===== */
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
.logo{font-size:26px;font-weight:bold;color:#ff3b3b;}
.nav-links a{color:white;margin-left:30px;text-decoration:none;transition:0.3s;}
.nav-links a:hover{
color:#ff3b3b;
text-shadow:0 0 10px #ff3b3b;
}

/* ===== HERO ===== */
.hero{
height:30vh;
display:flex;
align-items:center;
justify-content:center;
text-align:center;
}

.hero h1{
font-size:48px;
color:#ff3b3b;
animation:titleZoom 1s ease;
}

/* ===== CONTENT CARD ===== */
.container{
max-width:900px;
margin:-40px auto 80px auto;
background:#1a1a1a;
padding:50px;
border-radius:20px;
box-shadow:0 30px 60px rgba(0,0,0,0.7);
animation:cardSlide 0.9s ease;
transition:0.4s;
}

.container:hover{
transform:translateY(-5px);
box-shadow:0 35px 70px rgba(255,0,0,0.3);
}

.meta{
margin-bottom:20px;
color:#aaa;
font-size:14px;
animation:fadeIn 1.2s ease;
}

.container p{
line-height:1.9;
font-size:17px;
color:#ddd;
margin-bottom:20px;
word-break:break-word;
opacity:0;
animation:paragraphFade 1s ease forwards;
animation-delay:0.4s;
}

/* ===== QUOTE ANIMATION ===== */
.quote{
background:#111;
border-left:4px solid #ff3b3b;
padding:20px;
margin:30px 0;
font-style:italic;
color:#ccc;
transform:scale(0.95);
opacity:0;
animation:quotePop 0.8s ease forwards;
animation-delay:0.6s;
}

/* ===== BACK BUTTON ===== */
.back-btn{
margin-top:30px;
padding:10px 25px;
border:none;
border-radius:25px;
background:linear-gradient(45deg,#ff3b3b,#b30000);
color:white;
cursor:pointer;
transition:0.4s;
}

.back-btn:hover{
transform:translateY(-3px) scale(1.05);
box-shadow:0 15px 30px rgba(255,59,59,0.6);
}

/* ===== FOOTER (NOT CHANGED) ===== */
.footer{
text-align:center;
padding:20px;
background:#111;
color:#888;
}

/* ===== KEYFRAMES ===== */

@keyframes pageFade{
from{opacity:0;}
to{opacity:1;}
}

@keyframes titleZoom{
from{opacity:0; transform:scale(0.7);}
to{opacity:1; transform:scale(1);}
}

@keyframes cardSlide{
from{opacity:0; transform:translateY(60px);}
to{opacity:1; transform:translateY(0);}
}

@keyframes fadeIn{
from{opacity:0;}
to{opacity:1;}
}

@keyframes paragraphFade{
to{opacity:1;}
}

@keyframes quotePop{
to{opacity:1; transform:scale(1);}
}
</style>
</head>

<body>

<div class="navbar">
<div class="logo">CarCure</div>
<div class="nav-links">
<a href="<%= path %>/Home.jsp">Home</a>
<a href="<%= path %>/About.jsp">About</a>
<a href="<%= path %>/Contact.jsp">Contact Us</a>
</div>
</div>

<div class="hero">
<h1><%= title %></h1>
</div>

<div class="container">

<div class="meta">
Category: <%= category %> | Published: 28 Feb 2026
</div>

<p><%= content %></p>

<div class="quote">
“Regular vehicle maintenance not only improves performance but also ensures your safety on the road.”
</div>

<p>
At CarCure, our certified technicians use advanced tools and genuine spare parts to ensure your vehicle gets the premium care it deserves.
</p>

<button onclick="window.location.href='<%= path %>/Blog.jsp'" class="back-btn">
← Back to Blog
</button>

</div>

<div class="footer">
© 2026 CarCure Blog. All Rights Reserved.
</div>

</body>
</html>