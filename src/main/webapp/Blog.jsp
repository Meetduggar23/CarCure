<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarCure Blog | AutoCare Insights</title>

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
        linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.9)),
        url('<%=path%>/images/Blog.jpg');
    background-size:cover;
    background-position:center;
    animation:fadePage 1s ease;
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
    margin-left:35px;
    transition:0.3s;
}
.nav-links a:hover{
    color:#ff3b3b;
    text-shadow:0 0 10px #ff3b3b;
}

/* ===== HERO ===== */
.hero{
    text-align:center;
    padding:60px 10% 30px;
}
.hero h1{
    font-size:50px;
    margin-bottom:15px;
    animation:slideDown 1s ease;
}
.hero p{
    color:#ccc;
    font-size:18px;
    animation:fadeIn 1.5s ease;
}

/* ===== BLOG SECTION ===== */
.blog-section{
    padding:30px 10% 80px;
}

/* ===== ADD BUTTON ===== */
.add-blog-container{
    display:flex;
    justify-content:flex-end;
    margin-bottom:30px;
}

.add-blog-btn{
    width:55px;
    height:55px;
    border-radius:50%;
    border:none;
    font-size:28px;
    font-weight:bold;
    background:#ffffff;
    color:#ff3b3b;
    cursor:pointer;
    transition:0.4s;
    animation:pulse 2s infinite;
}

.add-blog-btn:hover{
    background:#ff3b3b;
    color:white;
    transform:scale(1.15);
    box-shadow:0 0 20px #ff3b3b;
}

/* ===== GRID ===== */
.blog-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(300px,1fr));
    gap:30px;
}

/* ===== BLOG CARD ===== */
.blog-card{
    background:#1a1a1a;
    border-radius:15px;
    padding:25px;
    transition:0.4s;
    opacity:0;
    transform:translateY(40px);
    animation:cardFade 0.8s forwards;
}

.blog-card:nth-child(1){animation-delay:0.2s;}
.blog-card:nth-child(2){animation-delay:0.4s;}
.blog-card:nth-child(3){animation-delay:0.6s;}
.blog-card:nth-child(4){animation-delay:0.8s;}
.blog-card:nth-child(5){animation-delay:1s;}
.blog-card:nth-child(6){animation-delay:1.2s;}

.blog-card:hover{
    transform:translateY(-10px) scale(1.02);
    box-shadow:0 20px 40px rgba(255,59,59,0.4);
}

.blog-card h3{
    color:#ff3b3b;
    margin-bottom:10px;
}

.blog-card p{
    color:#ccc;
    font-size:14px;
}

/* ===== READ BUTTON ===== */
.read-btn{
    margin-top:15px;
    padding:8px 18px;
    background:linear-gradient(45deg,#ff3b3b,#b30000);
    border:none;
    border-radius:20px;
    color:white;
    cursor:pointer;
    transition:0.4s;
}

.read-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 25px rgba(255,59,59,0.6);
}

/* ===== POPUP ===== */
.blog-popup{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.75);
    backdrop-filter:blur(6px);
    display:none;
    justify-content:center;
    align-items:center;
    z-index:9999;
    animation:fadeIn 0.4s ease;
}

.popup-content{
    background:#1a1a1a;
    width:400px;
    padding:30px;
    border-radius:20px;
    text-align:center;
    position:relative;
    transform:scale(0.8);
    animation:popupZoom 0.4s forwards;
}

.popup-content h2{
    color:#ff3b3b;
    margin-bottom:20px;
}

.popup-content input,
.popup-content textarea{
    width:100%;
    padding:10px;
    margin-bottom:15px;
    border-radius:10px;
    border:1px solid #333;
    background:#111;
    color:white;
}

.popup-content textarea{
    resize:none;
    height:90px;
}

.popup-btn{
    width:100%;
    padding:10px;
    border:none;
    border-radius:20px;
    background:linear-gradient(45deg,#ff3b3b,#b30000);
    color:white;
    cursor:pointer;
    transition:0.3s;
}

.popup-btn:hover{
    box-shadow:0 0 20px #ff3b3b;
}

.close-popup{
    position:absolute;
    right:15px;
    top:10px;
    font-size:22px;
    cursor:pointer;
    color:#aaa;
    transition:0.3s;
}

.close-popup:hover{
    color:white;
    transform:rotate(90deg);
}

/* ===== ANIMATIONS ===== */
@keyframes fadePage{
    from{opacity:0;}
    to{opacity:1;}
}

@keyframes slideDown{
    from{opacity:0; transform:translateY(-50px);}
    to{opacity:1; transform:translateY(0);}
}

@keyframes fadeIn{
    from{opacity:0;}
    to{opacity:1;}
}

@keyframes cardFade{
    to{
        opacity:1;
        transform:translateY(0);
    }
}

@keyframes popupZoom{
    to{
        transform:scale(1);
    }
}

@keyframes pulse{
    0%{box-shadow:0 0 0 rgba(255,59,59,0.6);}
    50%{box-shadow:0 0 20px rgba(255,59,59,0.8);}
    100%{box-shadow:0 0 0 rgba(255,59,59,0.6);}
}

/* ===== MINIMAL FOOTER ===== */
.footer{
text-align:center;
padding:20px;
background:#111;
color:#888;
}
</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">CarCure</div>
    <div class="nav-links">
        <a href="<%= path %>/Home.jsp">Home</a>
        <a href="<%= path %>/About.jsp">About</a>
        <a href="<%= path %>/Contact.jsp">Contact Us </a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    <h1>CarCure Blog</h1>
    <p>Expert Tips, Maintenance Guides & Automotive Insights</p>
</div>

<!-- BLOG SECTION -->
<div class="blog-section">

    <div class="add-blog-container">
        <button class="add-blog-btn" onclick="openBlogPopup()">+</button>
    </div>

   <div class="blog-grid" id="blogGrid">

    <div class="blog-card">
        <h3>5 Signs Your Car Needs Immediate Service</h3>
        <p>Learn how to identify early warning signs before they turn into costly repairs.</p>
        <a href="<%= path %>/BlogDetails.jsp?post=service">
            <button class="read-btn">Read More</button>
        </a>
    </div>

    <div class="blog-card">
        <h3>How Often Should You Service Your Car?</h3>
        <p>Understand the recommended service intervals to keep your vehicle running smoothly.</p>
        <a href="<%= path %>/BlogDetails.jsp?post=interval">
            <button class="read-btn">Read More</button>
        </a>
    </div>

    <div class="blog-card">
        <h3>Monsoon Car Care Tips</h3>
        <p>Protect your vehicle during rainy seasons with these essential maintenance tips.</p>
        <a href="<%= path %>/BlogDetails.jsp?post=monsoon">
            <button class="read-btn">Read More</button>
        </a>
    </div>

    <div class="blog-card">
        <h3>Improve Your Car’s Mileage</h3>
        <p>Simple driving habits and maintenance routines that boost fuel efficiency.</p>
        <a href="<%= path %>/BlogDetails.jsp?post=mileage">
            <button class="read-btn">Read More</button>
        </a>
    </div>

    <div class="blog-card">
        <h3>Importance of Wheel Alignment</h3>
        <p>Ensure better handling and longer tire life with proper alignment and balancing.</p>
        <a href="<%= path %>/BlogDetails.jsp?post=alignment">
            <button class="read-btn">Read More</button>
        </a>
    </div>

    <div class="blog-card">
        <h3>New Diagnostic Tools at CarCure</h3>
        <p>Discover how advanced technology is improving vehicle servicing accuracy.</p>
        <a href="<%= path %>/BlogDetails.jsp?post=diagnostic">
            <button class="read-btn">Read More</button>
        </a>
    </div>

</div>
</div>

<!-- POPUP -->
<div class="blog-popup" id="blogPopup">
    <div class="popup-content">
        <span class="close-popup" onclick="closeBlogPopup()">×</span>
        <h2>Add New Blog</h2>

        <input type="text" id="blogTitle" placeholder="Enter Blog Title">
        <textarea id="blogDesc" placeholder="Enter Blog Description"></textarea>

        <button class="popup-btn" onclick="saveBlog()">Add Blog</button>
    </div>
</div>



<script>
function openBlogPopup(){
    document.getElementById("blogPopup").style.display="flex";
}

function closeBlogPopup(){
    document.getElementById("blogPopup").style.display="none";
}

function saveBlog(){
    const title = document.getElementById("blogTitle").value.trim();
    const desc = document.getElementById("blogDesc").value.trim();

    if(title === "" || desc === ""){
        alert("Please fill all fields");
        return;
    }

    const blogGrid = document.getElementById("blogGrid");

    const newCard = document.createElement("div");
    newCard.className = "blog-card";

    newCard.innerHTML = `
        <h3>${title}</h3>
        <p>${desc}</p>
        <button class="read-btn">Read More</button>
    `;

    blogGrid.appendChild(newCard);

    document.getElementById("blogTitle").value="";
    document.getElementById("blogDesc").value="";
    closeBlogPopup();
}
</script>

</body>
<div class="footer">
    <div class="footer-content">
        <p>© 2026 CarCure | Driven by Performance & Precision</p>
    </div>
</div>
</html>