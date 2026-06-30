# Hospital Management System

A Java web application for hospital management built with Servlets, JSP, JDBC, and MySQL.

## Features

- Secure login and logout
- Doctor management
- Patient management
- Appointment management
- Lab report upload and viewing
- Pharmacy and medicine management
- Bills and prescription management
- Dashboard statistics

## Technologies Used

- Java
- JSP
- Servlets
- JDBC
- MySQL
- Apache Tomcat 9
- Bootstrap 5

## Prerequisites

- Java 17 or later
- Apache Tomcat 9
- MySQL server
- Eclipse, IntelliJ IDEA, or VS Code with Java extensions

## Setup

1. Clone the repository.
2. Open the project in your IDE.
3. Configure MySQL and create the `hospital_management` database.
4. Update database settings in `src/main/java/com/hms/db/DBConnection.java` or set these environment variables:
   - `DB_URL`
   - `DB_USER`
   - `DB_PASS`
5. Use Tomcat 9 to run the project.

## Running In VS Code

Build and deploy the project:

```powershell
.\build-and-deploy.ps1
```

Start Tomcat:

```powershell
.\run-tomcat.bat
```

Open:

```text
http://localhost:8081/HospitalManagementSystem/login.jsp
```

## Notes

- This project uses `javax.servlet.*`, so use Tomcat 9 instead of Tomcat 10.
- The included run script sets `CATALINA_HOME` and `CATALINA_BASE` automatically.
- Email sending is currently logged to the console unless a mail dependency is added back.

## Repository

`https://github.com/NavaneethkumarS2005/Hospital-Management-System-JDBC-MySQL-Project`
