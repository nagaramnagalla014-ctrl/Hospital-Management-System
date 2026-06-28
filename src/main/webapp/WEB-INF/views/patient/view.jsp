<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Patient Details - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> Patient Details</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3 text-center">
                            <div class="patient-avatar"><span class="glyphicon glyphicon-user" style="font-size:80px;color:#1565c0;"></span></div>
                            <h4>${patient.fullName}</h4>
                            <span class="label label-primary label-lg">${patient.patientCode}</span>
                        </div>
                        <div class="col-md-9">
                            <table class="table table-bordered detail-table">
                                <tr><th width="35%">Patient Code</th><td>${patient.patientCode}</td></tr>
                                <tr><th>Full Name</th><td>${patient.fullName}</td></tr>
                                <tr><th>Gender</th><td>${patient.gender}</td></tr>
                                <tr><th>Date of Birth</th><td><fmt:formatDate value="${patient.dob}" pattern="dd-MMM-yyyy"/></td></tr>
                                <tr><th>Blood Group</th><td><span class="label label-danger">${patient.bloodGroup}</span></td></tr>
                                <tr><th>Phone</th><td>${patient.phone}</td></tr>
                                <tr><th>Email</th><td>${patient.email}</td></tr>
                                <tr><th>Address</th><td>${patient.address}</td></tr>
                                <tr><th>City</th><td>${patient.city}</td></tr>
                                <tr><th>Registered On</th><td><fmt:formatDate value="${patient.createdOn}" pattern="dd-MMM-yyyy"/></td></tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <a href="${pageContext.request.contextPath}/patients/edit/${patient.patientId}" class="btn btn-warning">
                        <span class="glyphicon glyphicon-edit"></span> Edit</a>
                    <a href="${pageContext.request.contextPath}/appointments/book" class="btn btn-success">
                        <span class="glyphicon glyphicon-calendar"></span> Book Appointment</a>
                    <a href="${pageContext.request.contextPath}/patients" class="btn btn-default">
                        <span class="glyphicon glyphicon-arrow-left"></span> Back</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
