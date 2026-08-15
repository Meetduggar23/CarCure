<p align="center">
  <img src="C:\Users\Meet duggar\Desktop\Portfolio\CarCure\src\main\webapp\images\carcure.png" alt="ResumeIQ — AI Resume Analyzer" width="140" />
</p>

# CarCure

CarCure is a Java web application for managing vehicle service slot bookings. It uses JSP/Servlets (Javax) and stores booking data in MySQL. The app is designed to run on **Apache Tomcat v9.0**.

## Requirements

- **Java (JDK 8+ recommended)**
- **Apache Tomcat v9.0**
- **MySQL**
- **Eclipse IDE** (recommended for importing and managing the project)
- **Maven** (optional: for building a WAR if you add/maintain a Maven build)

> Note: MySQL Connector/J is already included in the project under `src/main/webapp/WEB-INF/lib/`, so you don’t need to add it separately.

## Run (Eclipse + Tomcat)

1. Open Eclipse.
2. Import the project:
   - `File` → `Import...` → `Existing Projects into Workspace`
3. Configure Tomcat 9 in Eclipse:
   - `Window` → `Preferences` → `Server` → `Runtime Environments` → add **Apache Tomcat v9.0**
4. Add the project to the Tomcat server and start the server.

## Run (Build WAR + Deploy to Tomcat 9)

This project follows the standard webapp layout (`src/main/java`, `src/main/webapp`) and can be deployed as a WAR on Tomcat 9 (Javax Servlet).

- If you use Eclipse, you can export a WAR and deploy it to Tomcat 9.
- If you maintain a Maven build for this project, you can build a WAR with Maven and deploy it to Tomcat 9.

## Database

1. Create a MySQL database and required tables (schema depends on your local setup).
2. Update database connection settings in:
   - `src/main/java/com/db/DBConnection.java`

