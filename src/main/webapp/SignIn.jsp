<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
String path = request.getContextPath();

/* ===== GLOBAL USERS LIST ===== */
List<Map<String,String>> users =
    (List<Map<String,String>>) application.getAttribute("users");

if(users == null){
    users = new ArrayList<>();
    application.setAttribute("users", users);
}

String message = "";
boolean showLogin = false;

/* ===== HANDLE FORM ===== */
if ("POST".equalsIgnoreCase(request.getMethod())) {

    String action = request.getParameter("action");
    String name = request.getParameter("name");
    String phone = request.getParameter("phoneNumber");

    /* ===== REGISTER ===== */
    if("register".equals(action)){

        boolean phoneExists = false;

        for(Map<String,String> u : users){
            if(phone.equals(u.get("phoneNumber"))){
                phoneExists = true;
                break;
            }
        }

        if(phoneExists){
            message = "Phone number already registered. Please login.";
            showLogin = true;   // 🔥 SHOW LOGIN BOX
        } else {

            Map<String,String> newUser = new HashMap<>();
            newUser.put("name", name);
            newUser.put("phoneNumber", phone);

            users.add(newUser);
            application.setAttribute("users", users);

            session.setAttribute("userName", name);
            session.setAttribute("userPhone", phone);

            response.sendRedirect("SelectSlot.jsp");
            return;
        }
    }

    /* ===== LOGIN ===== */
    if("login".equals(action)){

        boolean validUser = false;
        String userName = "";

        for(Map<String,String> u : users){
            if(phone.equals(u.get("phoneNumber"))){
                validUser = true;
                userName = u.get("name");
                break;
            }
        }

        if(validUser){
            session.setAttribute("userPhone", phone);
            session.setAttribute("userName", userName);

            response.sendRedirect("SelectSlot.jsp");
            return;
        } else {
            message = "Phone number not found!";
            showLogin = true;
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    flex-direction:column;
    background: linear-gradient(rgba(0,0,0,0.70), rgba(0,0,0,0.70)),
                url('<%= path %>/images/sign.jpg') no-repeat center center;
    background-size: cover;
    color:white;
}

/* NAVBAR (NO ANIMATION) */
.navbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:12px 60px;
    background:#111;
    border-bottom:2px solid #ff2e2e;
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

/* MAIN */
.main{
    flex:1;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 8%;
}

/* LEFT CONTENT ANIMATION */
.left-content{
    width:45%;
    animation: slideLeft 1s ease;
}

@keyframes slideLeft{
    from{ transform:translateX(-60px); opacity:0; }
    to{ transform:translateX(0); opacity:1; }
}

.left-content h1{
    font-size:45px;
    margin-bottom:15px;
}

.left-content span{
    color:#ff3b3b;
}

.left-content p{
    font-size:18px;
    color:#ddd;
}

/* FORM BOX ANIMATION */
.form-box{
    width:400px;
    padding:45px;
    border-radius:20px;
    background:rgba(20,20,20,0.95);
    box-shadow:0 0 30px rgba(255,46,46,0.3);
    text-align:center;
    animation: fadeUp 1s ease;
}

@keyframes fadeUp{
    from{ transform:translateY(60px); opacity:0; }
    to{ transform:translateY(0); opacity:1; }
}

.form-box h2{
    margin-bottom:20px;
    color:#ff3b3b;
    animation: textPop 1.2s ease;
}

@keyframes textPop{
    0%{ letter-spacing:3px; opacity:0; }
    100%{ letter-spacing:0; opacity:1; }
}

.form-box input{
    width:100%;
    padding:14px;
    margin-bottom:18px;
    border:none;
    border-radius:10px;
    background:#2a2a2a;
    color:white;
    transition:0.4s;
}

.form-box input:focus{
    outline:none;
    border:1px solid #ff3b3b;
    box-shadow:0 0 15px rgba(255,46,46,0.7);
    transform:scale(1.03);
}

.form-box button{
    width:100%;
    padding:14px;
    border:none;
    border-radius:30px;
    font-weight:bold;
    color:white;
    background:#ff2e2e;
    cursor:pointer;
    transition:0.3s;
    animation: pulse 2s infinite;
}

@keyframes pulse{
    0%{ box-shadow:0 0 0 0 rgba(255,46,46,0.6); }
    70%{ box-shadow:0 0 0 15px rgba(255,46,46,0); }
    100%{ box-shadow:0 0 0 0 rgba(255,46,46,0); }
}

.form-box button:hover{
    transform:scale(1.08);
    box-shadow:0 0 25px rgba(255,46,46,0.8);
}

.error{
    background:rgba(0,255,120,0.12);
    color:#00ff88;
    padding:12px;
    border-radius:10px;
    margin-bottom:15px;
    border:1px solid rgba(0,255,120,0.4);
    animation: fadeIn 1s ease;
}

@keyframes fadeIn{
    from{ opacity:0; }
    to{ opacity:1; }
}

/* FOOTER */
footer{
    text-align:center;
    padding:12px 0;
    background:#111;
    color:#aaa;
    font-size:13px;
}

footer span{
    color:#ff2e2e;
    font-weight:bold;
}
</style>
</head>

<body>

<div class="navbar">
    <div class="logo">CarCure</div>
    <div class="nav-links">
        <a href="<%= path %>/Home.jsp">Home</a>
        <a href="<%= path %>/About.jsp">About</a>
        <a href="Availability.jsp">Check slots</a>
        <a href="<%= path %>/Contact.jsp">Contact Us</a>
    </div>
</div>

<div class="main">

<div class="left-content">
    <h1><span>CarCure</span> Service Portal</h1>
    <p>Reliable. Professional. Hassle-Free.</p>
</div>

<div class="form-box">
    <h2>Vehicle Service Booking</h2>

    <% if(!message.isEmpty()){ %>
        <div class="error"><%= message %></div>
    <% } %>

    <!-- REGISTER FORM -->
    <% if(!showLogin){ %>
    <form method="post">
    
        <input type="hidden" name="action" value="register">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="tel" name="phoneNumber"
               placeholder="Phone Number"
               pattern="[0-9]{10}"
               maxlength="10"
               required>
        <button type="submit">Continue →</button>
    </form>
    <% } %>

    <!-- LOGIN FORM -->
    <% if(showLogin){ %>
    <form method="post">
        <input type="hidden" name="action" value="login">
        <input type="tel" name="phoneNumber"
               placeholder="Enter Registered Phone Number"
               pattern="[0-9]{10}"
               maxlength="10"
               required>
        <button type="submit">Login & Continue →</button>
    </form>
    <% } %>
</div>

</div>

<footer> © 2026 <span>CarCure</span>. All Rights Reserved.<br> Premium Automobile Service Experience. </footer>

</body>
</html>