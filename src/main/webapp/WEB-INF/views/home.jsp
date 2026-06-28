<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Hospital Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-12">
            <h2><span class="glyphicon glyphicon-dashboard"></span> Hospital Dashboard</h2>
            <p class="text-muted">Overview of hospital operations</p>
        </div>
    </div>

    <!-- Flash Messages -->
    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert">&times;</button>${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert">&times;</button>${error}</div>
    </c:if>

    <!-- Stats Row -->
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <div class="panel panel-primary stat-card">
                <div class="panel-body text-center">
                    <div class="stat-icon"><span class="glyphicon glyphicon-user"></span></div>
                    <div class="stat-number">${totalPatients}</div>
                    <div class="stat-label">Total Patients</div>
                </div>
                <div class="panel-footer text-center"><a href="${pageContext.request.contextPath}/patients" class="text-white">View All &rarr;</a></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="panel panel-success stat-card">
                <div class="panel-body text-center">
                    <div class="stat-icon"><span class="glyphicon glyphicon-heart"></span></div>
                    <div class="stat-number">${totalDoctors}</div>
                    <div class="stat-label">Active Doctors</div>
                </div>
                <div class="panel-footer text-center"><a href="${pageContext.request.contextPath}/doctors" class="text-white">View All &rarr;</a></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="panel panel-warning stat-card">
                <div class="panel-body text-center">
                    <div class="stat-icon"><span class="glyphicon glyphicon-calendar"></span></div>
                    <div class="stat-number">${scheduledAppointments}</div>
                    <div class="stat-label">Scheduled Today</div>
                </div>
                <div class="panel-footer text-center"><a href="${pageContext.request.contextPath}/appointments" class="text-white">View All &rarr;</a></div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="panel panel-info stat-card">
                <div class="panel-body text-center">
                    <div class="stat-icon"><span class="glyphicon glyphicon-usd"></span></div>
                    <div class="stat-number">&#8377;<fmt:formatNumber value="${totalRevenue}" pattern="#,##0.00"/></div>
                    <div class="stat-label">Total Revenue</div>
                </div>
                <div class="panel-footer text-center"><a href="${pageContext.request.contextPath}/billing" class="text-white">View Billing &rarr;</a></div>
            </div>
        </div>
    </div>

    <!-- Secondary Stats -->
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default stat-mini">
                <div class="panel-body">
                    <span class="glyphicon glyphicon-search text-info stat-mini-icon"></span>
                    <div class="stat-mini-info">
                        <div class="stat-mini-number">${totalLabReports}</div>
                        <div class="stat-mini-label">Lab Reports</div>
                    </div>
                    <a href="${pageContext.request.contextPath}/lab" class="btn btn-xs btn-info pull-right">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default stat-mini">
                <div class="panel-body">
                    <span class="glyphicon glyphicon-briefcase text-warning stat-mini-icon"></span>
                    <div class="stat-mini-info">
                        <div class="stat-mini-number">${totalMedicines}</div>
                        <div class="stat-mini-label">Medicines in Stock</div>
                    </div>
                    <a href="${pageContext.request.contextPath}/pharmacy" class="btn btn-xs btn-warning pull-right">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6">
            <div class="panel panel-default stat-mini">
                <div class="panel-body">
                    <span class="glyphicon glyphicon-list-alt text-success stat-mini-icon"></span>
                    <div class="stat-mini-info">
                        <div class="stat-mini-number">${totalBills}</div>
                        <div class="stat-mini-label">Total Bills Generated</div>
                    </div>
                    <a href="${pageContext.request.contextPath}/billing" class="btn btn-xs btn-success pull-right">View</a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Upcoming Appointments -->
        <div class="col-md-7">
            <div class="panel panel-default">
                <div class="panel-heading"><h4><span class="glyphicon glyphicon-calendar"></span> Scheduled Appointments</h4></div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-condensed">
                        <thead><tr><th>#</th><th>No.</th><th>Patient</th><th>Doctor</th><th>Date</th><th>Time</th><th>Action</th></tr></thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty recentAppointments}">
                                <c:forEach var="appt" items="${recentAppointments}" varStatus="s">
                                    <c:if test="${s.index < 8}">
                                    <tr>
                                        <td>${s.count}</td>
                                        <td><small>${appt.appointmentNo}</small></td>
                                        <td>${appt.patient.fullName}</td>
                                        <td>${appt.doctor.fullName}</td>
                                        <td><fmt:formatDate value="${appt.appointmentDate}" pattern="dd-MMM-yyyy"/></td>
                                        <td>${appt.appointmentTime}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/appointments/complete/${appt.appointmentId}"
                                               class="btn btn-xs btn-success">Done</a>
                                        </td>
                                    </tr>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="7" class="text-center text-muted">No scheduled appointments.</td></tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer text-right">
                    <a href="${pageContext.request.contextPath}/appointments/book" class="btn btn-sm btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> Book Appointment</a>
                </div>
            </div>
        </div>

        <!-- Low Stock Alert -->
        <div class="col-md-5">
            <div class="panel panel-danger">
                <div class="panel-heading"><h4><span class="glyphicon glyphicon-exclamation-sign"></span> Low Stock Alert</h4></div>
                <div class="table-responsive">
                    <table class="table table-condensed">
                        <thead><tr><th>Medicine</th><th>Stock</th><th>Price</th></tr></thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty lowStockMedicines}">
                                <c:forEach var="med" items="${lowStockMedicines}">
                                <tr>
                                    <td>${med.medicineName}</td>
                                    <td><span class="badge ${med.quantityInStock <= 5 ? 'badge-danger' : 'badge-warning'}">${med.quantityInStock}</span></td>
                                    <td>&#8377;${med.unitPrice}</td>
                                </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="3" class="text-center text-success">All medicines well-stocked.</td></tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer text-right">
                    <a href="${pageContext.request.contextPath}/pharmacy" class="btn btn-sm btn-danger">
                        <span class="glyphicon glyphicon-briefcase"></span> Pharmacy</a>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="panel panel-default">
                <div class="panel-heading"><h4>Quick Actions</h4></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-6"><a href="${pageContext.request.contextPath}/patients/register" class="btn btn-primary btn-block btn-sm"><span class="glyphicon glyphicon-plus"></span> Register Patient</a></div>
                        <div class="col-xs-6"><a href="${pageContext.request.contextPath}/appointments/book" class="btn btn-success btn-block btn-sm"><span class="glyphicon glyphicon-calendar"></span> Book Appointment</a></div>
                    </div>
                    <div class="row" style="margin-top:8px;">
                        <div class="col-xs-6"><a href="${pageContext.request.contextPath}/lab/add" class="btn btn-info btn-block btn-sm"><span class="glyphicon glyphicon-search"></span> Add Lab Report</a></div>
                        <div class="col-xs-6"><a href="${pageContext.request.contextPath}/billing/generate" class="btn btn-warning btn-block btn-sm"><span class="glyphicon glyphicon-usd"></span> Generate Bill</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
