# 🏥 Hospital Management System

A comprehensive Hospital Management System developed using **Java Full Stack Technologies** to manage hospital operations efficiently through a centralized web-based platform.

## 🚀 Features

### 🔐 Authentication

* Secure Login & Logout
* Session Management
* Protected Dashboard Access

### 👨‍⚕️ Doctor Management

* Add Doctor
* View Doctor Details
* Update Doctor Information
* Delete Doctor Records

### 🧑‍🤝‍🧑 Patient Management

* Add Patient
* View Patient Records
* Update Patient Details
* Delete Patient Records

### 📅 Appointment Management

* Book Appointments
* View Appointments
* Edit Appointment Details
* Delete Appointments

### 🧪 Lab Reports

* Upload Lab Reports
* View Lab Test Results
* Manage Patient Reports

### 💊 Pharmacy Management

* Add Medicines
* Manage Inventory
* Monitor Medicine Stock
* View Available Medicines

### 📊 Dashboard Analytics

* Total Patients
* Total Doctors
* Total Appointments
* Total Bills
* Interactive Charts and Statistics

## 🛠️ Technologies Used

### Frontend

* HTML5
* CSS3
* JavaScript
* Bootstrap 5

### Backend

* Java
* JSP
* Servlets
* JDBC

### Database

* MySQL

### Server

* Apache Tomcat

### IDE

* Eclipse IDE

## 📂 Project Structure

```text
HospitalManagementSystem
│
├── src/
│   ├── com.hms.servlet
│   ├── com.hms.dao
│   ├── com.hms.model
│   └── com.hms.db
│
├── WebContent/
│   ├── css/
│   ├── js/
│   ├── dashboard.jsp
│   ├── patientRegister.jsp
│   ├── doctorRegister.jsp
│   ├── appointment.jsp
│   ├── labReport.jsp
│   └── login.jsp
│
└── Database/

```
## 🧠 Algorithms & Concepts Used

* Queue Scheduling (Appointments)
* Search Operations
* Sorting Techniques
* Session Management
* CRUD Operations
* Database Connectivity using JDBC

## 🗄️ Database Tables

```sql
users
patients
doctors
appointments
lab_reports
medicines
bills
```

## ⚙️ Installation & Setup

### 1. Clone Repository

```bash
git clone https://github.com/your-username/Hospital-Management-System.git
```

### 2. Import Project

* Open Eclipse IDE
* Import Existing Dynamic Web Project

### 3. Configure Database

Create a MySQL database and import required tables.

Update database credentials inside:

```java
DBConnection.java
```

### 4. Configure Tomcat

* Install Apache Tomcat
* Add Server Runtime in Eclipse

### 5. Run Project

```text
http://localhost:8080/HospitalManagementSystem
```

## 🔮 Future Enhancements

* Online Consultation System
* Automated Appointment Reminders
* Advanced Health Analytics
* Email Notifications
* Mobile Application Integration

## 👨‍💻 Author

### Navaneeth Kumar S
