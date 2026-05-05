<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Privacy Policy | CarCure</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Arial, sans-serif;
}

body{
    background:#0f0f0f;     /* DARK BACKGROUND */
    color:#f5f5f5;          /* WHITE TEXT */
    line-height:1.9;
}

/* NAVBAR */
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

.logo{
    font-size:24px;
    font-weight:700;
    color:#ff2e2e;
}

.nav-links a{
    text-decoration:none;
    color:#ffffff;
    margin-left:30px;
    font-size:14px;
}

.nav-links a:hover{
    color:#ff2e2e;
}

/* HEADER */
.page-header{
    padding:30px 30px 20px 80px;
}

.page-header h1{
    font-size:42px;
    font-weight:700;
    color:#ffffff;
}

.red-line{
    width:80px;
    height:4px;
    background:#ff2e2e;
    margin-top:15px;
}

/* CONTENT FULL WIDTH */
.container{
    padding:0px 50px 80px 80px;
    width:100%;
}

.container p{
    font-size:16px;
    color:#d6d6d6;        /* soft white for readability */
    margin-bottom:8px;
}

.container p strong{
    font-size:20px;
    color:#ffffff;        /* bright white headings */
   
}

/* FOOTER */
.footer{
    background:#111;
    padding:50px 80px;
    border-top:1px solid white ;
}

.footer-container{
    display:flex;
    justify-content:space-between;
    flex-wrap:wrap;
    gap:30px;
}

.footer-col{
    flex:1;
    min-width:250px;
}

.footer-col h3{
    margin-bottom:15px;
    font-size:16px;
    color:#ffffff;
}

.footer-col p{
    margin-bottom:8px;
    font-size:14px;
    color:#bdbdbd;
}

.footer-col a{
    text-decoration:none;
    color:#bdbdbd;
}

.footer-col a:hover{
    color:#ff2e2e;
}

.footer-bottom{
    margin-top:30px;
    border-top:1px solid #1f1f1f;
    padding-top:15px;
    text-align:center;
    font-size:13px;
    color:#888;
}

/* RESPONSIVE */
@media(max-width:768px){
    .navbar,
    .page-header,
    .container,
    .footer{
        padding:25px;
    }

    .footer-container{
        flex-direction:column;
    }
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
        <a href="<%= path %>/Contact.jsp">Contact Us</a>
    </div>
</div>
<!-- HEADER -->
<div class="page-header">
    <h1>Privacy Policy</h1>
    <div class="red-line"></div>
</div>
<!-- CONTENT -->
<div class="container">
<p><strong>Effective Date: 2 June 1975</strong></p>
<p><strong>Last Updated:   11 January 1978</strong></p>
<p>
At CarCure, we are committed to protecting your privacy and ensuring that your personal information is handled in a secure, transparent, and responsible manner. This Privacy Policy explains how we collect, use, process, store, and safeguard your information when you access our automobile service booking platform, website, and related services. By using our services, you agree to the practices described in this policy.
</p>

<p><strong>Information We Collect</strong></p>

<p>
When you use our platform to book vehicle services, contact our support team, or browse our website, we may collect certain personal and technical information necessary to provide you with a smooth and efficient experience. This may include your full name, mobile number, and email address so that we can communicate with you regarding your bookings and service updates. Since our platform is specifically designed for vehicle servicing, we also collect vehicle-related information such as your vehicle registration number, car model, brand details, and the type of services requested. Additionally, we collect booking-related information including your selected service date, preferred time slot, and any special instructions or service preferences you provide. If you make payments through our platform, we may collect billing references and transaction records required to process and confirm your payment securely. Sensitive financial data such as full card details are processed only through secure and authorized payment gateway providers and are not stored on our servers unless required for legal or accounting compliance.
</p>

<p>
We may also automatically collect technical data such as your IP address, browser type, device information, operating system, and browsing behavior on our website. This information helps us improve performance, enhance security, and prevent fraudulent activities. Furthermore, if you provide feedback, reviews, or communicate with our support team, those records may be maintained to improve service quality and ensure effective communication.
</p>

<p><strong>How We Use Your Information</strong></p>

<p>
The information we collect is primarily used to manage and confirm your vehicle service appointments. Your personal and vehicle details allow us to allocate appropriate technicians, prepare service materials, and ensure that your booking is accurately recorded in our system. We also use your contact information to send booking confirmations, appointment reminders, service updates, and important notifications related to your scheduled service. Your information helps us process payments securely and generate invoices or receipts. In addition, we may use collected data to improve our website functionality, enhance user experience, analyze service trends, and strengthen our overall business operations. In certain situations, we may process information to comply with applicable laws, regulatory requirements, or legal obligations.
</p>

<p><strong>Legal Basis for Processing</strong></p>

<p>
We process your personal data based on lawful grounds. In most cases, processing is necessary for the performance of a contract, especially when you book a vehicle service through our platform. We may also process information to comply with legal obligations such as taxation or regulatory requirements. Where required, we rely on your consent for specific processing activities. Additionally, we may process certain data based on legitimate business interests, provided such interests do not override your privacy rights.
</p>

<p><strong>Sharing of Information</strong></p>

<p>
CarCure does not sell, rent, or trade your personal information to third parties. However, in order to provide our services efficiently, we may share necessary information with authorized service partners and technicians who perform vehicle servicing on our behalf. Payment-related information may be shared with secure payment gateway providers strictly for transaction processing purposes. We may also work with IT service providers who assist in maintaining our website infrastructure, servers, and security systems. These service providers are bound by confidentiality agreements and are permitted to use your information only for operational support purposes. In cases where disclosure is required by law, regulation, or court order, we may share information with government authorities or law enforcement agencies.CarCure does not sell, rent, or trade your personal information to third parties. However, in order to provide our services efficiently, we may share necessary information with authorized service partners and technicians who perform vehicle servicing on our behalf. Payment-related information may be shared with secure payment gateway providers strictly for transaction processing purposes. We may also work with IT service providers who assist in maintaining our website infrastructure, servers, and security systems. These service providers are bound by confidentiality agreements and are permitted to use your information only for operational support purposes. In cases where disclosure is required by law, regulation, or court order, we may share information with government authorities or law enforcement agencies
</p>

<p><strong>Data Security</strong></p>

<p>
We implement appropriate technical and organizational security measures to protect your personal information from unauthorized access, misuse, alteration, or disclosure. Our systems are secured using encryption protocols, restricted access controls, secure servers, and continuous monitoring mechanisms. We regularly review and update our security practices to maintain high industry standards. Although no online system can guarantee absolute security, we take all reasonable steps to protect your data.
</p>

<p><strong>Data Retention</strong></p>

<p>
We retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy. Booking records, transaction details, and communication history may be stored for operational, legal, or regulatory requirements. Once the data is no longer required, it is securely deleted or anonymized in accordance with applicable laws.
</p>

<p><strong>Cookies and Tracking Technologies</strong></p>

<p>
Our website may use cookies and similar tracking technologies to improve user experience and maintain session functionality. Cookies help us remember user preferences, analyze website performance, and enhance navigation. You may manage or disable cookies through your browser settings; however, doing so may affect certain features of the website.
</p>

<p><strong>Your Rights</strong></p>

<p>
You have the right to access your personal information held by us and request corrections if the data is inaccurate or incomplete. Subject to applicable laws, you may also request deletion of your personal data or withdraw consent where processing is based on consent. We respect your privacy rights and will respond to requests within a reasonable timeframe.
</p>

<p><strong>Third-Party Links</strong></p>

<p>
Our website may contain links to third-party websites for informational purposes. We are not responsible for the privacy practices or content of external websites. We recommend reviewing their privacy policies before sharing personal information.Our website may contain links to third-party websites. We are not responsible for their privacy practices.
</p>

<p><strong>Updates to This Policy</strong></p>

<p>
We may update this Privacy Policy from time to time to reflect changes in legal requirements, business operations, or service offerings. Any updates will be posted on this page along with the revised effective date. Continued use of our services after updates constitutes acceptance of the revised policy We may update this Privacy Policy periodically. Continued use of our services after updates indicates acceptance of the revised terms.
</p>

<p><strong>Contact Us</strong></p>

<p>
If you have any questions, concerns, or requests regarding this Privacy Policy, you may contact us at [ support@carcure.com ] or call +91 9024315252 or +91 72628 08628. Our registered office is located in CarCure Auto Care Pvt. Ltd. Baner Road, Pune – 411045 Maharashtra, India We are committed to addressing your concerns promptly and transparently.
</p>

</div>

<!-- FOOTER -->
<div class="footer">
    <div class="footer-container">
        <div class="footer-col">
            <h3>CarCure</h3>
            <h5>CarCure Auto Care Pvt. Ltd. Baner Road, Pune – 411045 Maharashtra, India</h4>
            <p>Premium automobile service with trust and transparency.</p>
        </div>

        <div class="footer-col">
            <h3>Support</h3>
            <p>Email: support@carcure.com</p>
            <p>Phone: +91 9024315252 | +91 72628 08628</p>
            
        </div>

        <div class="footer-col">
            <h3>Quick Links</h3>
            <p><a href="<%= path %>/Home.jsp">Home</a></p>
            <p><a href="<%= path %>/About.jsp">About</a></p>
            <p><a href="<%= path %>/Contact.jsp">Contact</a></p>
        </div>
    </div>

    <div class="footer-bottom">
        © 2026 CarCure. All Rights Reserved.
    </div>
</div>

</body>
</html>