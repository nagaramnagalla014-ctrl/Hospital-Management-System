<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Appointments - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-8"><h2><span class="glyphicon glyphicon-calendar"></span> Appointments <small>${totalAppointments} total | ${scheduledCount} scheduled</small></h2></div>
        <div class="col-md-4 text-right">
            <a href="${pageContext.request.contextPath}/appointments/book" class="btn btn-primary">
                <span class="glyphicon glyphicon-plus"></span> Book Appointment</a>
        </div>
    </div>
    <c:if test="${not empty success}"><div class="alert alert-success alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${success}</div></c:if>

    <!-- Filter Tabs -->
    <ul class="nav nav-pills" style="margin-bottom:15px;">
        <li class="${empty filterStatus ? 'active' : ''}"><a href="${pageContext.request.contextPath}/appointments">All</a></li>
        <li class="${filterStatus == 'SCHEDULED' ? 'active' : ''}"><a href="?status=SCHEDULED">Scheduled</a></li>
        <li class="${filterStatus == 'COMPLETED' ? 'active' : ''}"><a href="?status=COMPLETED">Completed</a></li>
        <li class="${filterStatus == 'CANCELLED' ? 'active' : ''}"><a href="?status=CANCELLED">Cancelled</a></li>
    </ul>

    <div class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr><th>#</th><th>Appt. No.</th><th>Patient</th><th>Doctor</th><th>Date</th><th>Time</th><th>Symptoms</th><th>Status</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty appointments}">
                        <c:forEach var="a" items="${appointments}" varStatus="s">
                        <tr>
                            <td>${s.count}</td>
                            <td><span class="label label-info">${a.appointmentNo}</span></td>
                            <td>${a.patient.fullName}<br><small class="text-muted">${a.patient.patientCode}</small></td>
                            <td>${a.doctor.fullName}<br><small class="text-muted">${a.doctor.specialization}</small></td>
                            <td><fmt:formatDate value="${a.appointmentDate}" pattern="dd-MMM-yyyy"/></td>
                            <td>${a.appointmentTime}</td>
                            <td><small>${a.symptoms}</small></td>
                            <td>
                                <span class="label label-${a.status == 'SCHEDULED' ? 'warning' : a.status == 'COMPLETED' ? 'success' : 'danger'}">
                                    ${a.status}
                                </span>
                            </td>
                            <td>
                                <c:if test="${a.status == 'SCHEDULED'}">
                                    <a href="${pageContext.request.contextPath}/appointments/complete/${a.appointmentId}" class="btn btn-xs btn-success" title="Mark Complete"><span class="glyphicon glyphicon-ok"></span></a>
                                    <a href="${pageContext.request.contextPath}/appointments/cancel/${a.appointmentId}" class="btn btn-xs btn-danger" title="Cancel"><span class="glyphicon glyphicon-remove"></span></a>
                                </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="9" class="text-center text-muted">No appointments found.</td></tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
