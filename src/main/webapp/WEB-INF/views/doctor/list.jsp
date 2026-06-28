<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Doctors - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-8"><h2><span class="glyphicon glyphicon-heart"></span> Doctors <small>${totalDoctors} active</small></h2></div>
        <div class="col-md-4 text-right">
            <a href="${pageContext.request.contextPath}/doctors/add" class="btn btn-primary">
                <span class="glyphicon glyphicon-plus"></span> Add Doctor</a>
        </div>
    </div>
    <c:if test="${not empty success}"><div class="alert alert-success alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${success}</div></c:if>
    <div class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr><th>#</th><th>Code</th><th>Name</th><th>Specialization</th><th>Qualification</th><th>Dept</th><th>Experience</th><th>Fee</th><th>Status</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty doctors}">
                        <c:forEach var="d" items="${doctors}" varStatus="s">
                        <tr class="${d.isActive == 0 ? 'text-muted' : ''}">
                            <td>${s.count}</td>
                            <td><span class="label label-success">${d.doctorCode}</span></td>
                            <td><strong>${d.fullName}</strong></td>
                            <td>${d.specialization}</td>
                            <td>${d.qualification}</td>
                            <td>${d.department.deptName}</td>
                            <td>${d.experience} yrs</td>
                            <td>&#8377;${d.consultationFee}</td>
                            <td><span class="label label-${d.isActive == 1 ? 'success' : 'default'}">${d.isActive == 1 ? 'Active' : 'Inactive'}</span></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/doctors/edit/${d.doctorId}" class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-edit"></span></a>
                                <a href="${pageContext.request.contextPath}/doctors/delete/${d.doctorId}" class="btn btn-xs btn-danger btn-delete"><span class="glyphicon glyphicon-remove"></span></a>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="10" class="text-center text-muted">No doctors found.</td></tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
