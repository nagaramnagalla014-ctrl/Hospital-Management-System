# Hospital Management System

A full-stack Java EE enterprise application connecting multiple hospital departments including patient registration, doctor appointments, laboratory, pharmacy, and billing — built with Spring MVC, Hibernate ORM, and Oracle Database.

**Duration:** July 2016 – June 2017

---

## Overview

Developed to replace fragmented paper-based hospital workflows with a centralized digital system. The system eliminated duplicate patient records, streamlined inter-department data flow, and significantly reduced patient waiting time and billing errors.

---

## Features

### Patient Registration
- Register new patients with auto-generated patient codes (P-00001)
- Search patients by name, code, or phone
- View complete patient history

### Doctor Management
- Maintain doctor profiles with specializations, qualifications, and departments
- Track consultation fees per doctor
- Department-wise doctor listing

### Appointments
- Book appointments between patients and doctors with time slots
- Track appointment status (Scheduled / Completed / Cancelled)
- Dashboard view of today's scheduled appointments

### Laboratory
- Create lab test orders linked to patient and referring doctor
- Update test results and mark reports as completed
- Track lab charges per test

### Pharmacy / Medicine Store
- Complete medicine inventory with stock management
- Low stock alerts (threshold: 20 units)
- Search medicines by name or category
- Expiry date tracking

### Billing
- Generate detailed bills combining consultation, lab, medicine and other charges
- Discount and total calculation
- Mark bills as PAID
- **Printable bill receipt** (browser print)
- **PDF bill generation** via Jasper Reports

### Jasper Reports
- PDF bill receipts generated server-side using JasperReports 6.4.x
- JRXML template in `WEB-INF/reports/bill_report.jrxml`
- ReportService handles compilation, parameter injection, and PDF export

---

## Technologies Used

| Layer | Technology |
|-------|-----------|
| Language | Java 8 |
| Web Framework | Spring MVC 4.3 |
| ORM | Hibernate 5.2 |
| Database | Oracle 11g / Oracle XE |
| Connection Pool | C3P0 0.9.5 |
| Reports | Jasper Reports 6.4.3 |
| Frontend | JSP, JSTL, Bootstrap 3, jQuery |
| Build | Maven 3 |
| Server | Apache Tomcat 7/8 |
| IDE | Eclipse |
| Version Control | Git |

---

## Project Architecture

```
MVC Layered Architecture:
  Controller → Service → DAO → Hibernate ORM → Oracle DB

src/main/java/com/hospital/hms/
├── model/         Hibernate @Entity classes (7 entities)
├── dao/           Data Access interfaces (6 DAOs)
│   └── impl/      Hibernate implementations
├── service/       Business logic interfaces (6 services)
│   └── impl/      @Transactional service implementations
├── controller/    Spring MVC @Controller classes (7 controllers)
└── report/        JasperReports PDF generation service

src/main/webapp/
├── WEB-INF/
│   ├── web.xml                   Servlet configuration
│   ├── dispatcher-servlet.xml    Spring MVC configuration
│   ├── applicationContext.xml    Spring + Hibernate + C3P0 configuration
│   ├── reports/bill_report.jrxml Jasper report template
│   └── views/                    JSP views (15 pages)
└── resources/                    CSS, JS static assets
```

---

## Database Schema (Oracle)

| Table | Description |
|-------|-------------|
| DEPARTMENTS | Hospital departments master |
| DOCTORS | Doctor profiles with dept FK |
| PATIENTS | Patient registration with auto-code |
| APPOINTMENTS | Doctor-patient appointment records |
| LAB_REPORTS | Laboratory test orders and results |
| MEDICINES | Pharmacy medicine inventory |
| BILLS | Patient billing with charge breakdown |

All primary keys use Oracle SEQUENCES for auto-increment.

---

## Setup Instructions

### Prerequisites
- JDK 8+
- Apache Tomcat 7 or 8
- Oracle Database 11g (or Oracle XE for local dev)
- Maven 3.x

### Database Setup
```sql
-- Connect as DBA and create user
CREATE USER hospital_user IDENTIFIED BY hospital123;
GRANT CONNECT, RESOURCE TO hospital_user;

-- Run schema as hospital_user
sqlplus hospital_user/hospital123@localhost:1521:XE @database/oracle_schema.sql
```

### Configure DB Connection
Edit `src/main/webapp/WEB-INF/applicationContext.xml`:
```xml
<property name="jdbcUrl" value="jdbc:oracle:thin:@localhost:1521:XE"/>
<property name="user"    value="hospital_user"/>
<property name="password" value="hospital123"/>
```

### Build and Deploy
```bash
mvn clean package
# Copy target/hospital-management-system.war to $TOMCAT_HOME/webapps/
```

### Access
Open `http://localhost:8080/hospital-management-system/`

---

## Key Technical Decisions

- **Spring `@Transactional`** on service layer ensures atomic DB operations — e.g., appointment booking and balance updates happen in a single transaction.
- **C3P0 connection pool** avoids per-request Oracle connections, reducing latency under concurrent load.
- **Hibernate `SEQUENCE` strategy** is used instead of `AUTO` since Oracle doesn't support `AUTO_INCREMENT`.
- **Jasper Reports** compiled at runtime from `.jrxml` (JasperCompileManager) to keep source in version control rather than binary `.jasper` files.
- **Spring MVC `RedirectAttributes`** with flash attributes prevent form re-submission on browser refresh (POST-Redirect-GET pattern).

---

## Key Learnings

- Spring MVC + Hibernate integration with Oracle using C3P0 connection pooling
- Transaction management with `@Transactional` across service layer
- Jasper Reports integration for server-side PDF generation
- Oracle-specific Hibernate configuration (sequences, dialect)
- Role-based navigation across hospital departments
- POST-Redirect-GET pattern to prevent duplicate form submissions
