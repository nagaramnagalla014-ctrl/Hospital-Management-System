<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Patients - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-8"><h2><span class="glyphicon glyphicon-user"></span> Patient Registry <small>${totalPatients} total</small></h2></div>
        <div class="col-md-4 text-right">
            <a href="${pageContext.request.contextPath}/patients/register" class="btn btn-primary">
                <span class="glyphicon glyphicon-plus"></span> Register Patient</a>
        </div>
    </div>
    <c:if test="${not empty success}"><div class="alert alert-success alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${success}</div></c:if>
    <c:if test="${not empty error}"><div class="alert alert-danger alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${error}</div></c:if>

    <!-- Search -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form method="get" action="${pageContext.request.contextPath}/patients" class="form-inline">
                <div class="input-group" style="width:400px;">
                    <input type="text" class="form-control" name="search" value="${search}" placeholder="Search by name, code or phone...">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                        <a href="${pageContext.request.contextPath}/patients" class="btn btn-default">Clear</a>
                    </span>
                </div>
            </form>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr><th>#</th><th>Code</th><th>Name</th><th>Gender</th><th>Blood Group</th><th>Phone</th><th>City</th><th>Registered</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty patients}">
                        <c:forEach var="p" items="${patients}" varStatus="s">
                        <tr>
                            <td>${s.count}</td>
                            <td><span class="label label-primary">${p.patientCode}</span></td>
                            <td><strong>${p.fullName}</strong></td>
                            <td>${p.gender}</td>
                            <td><span class="label label-danger">${p.bloodGroup}</span></td>
                            <td>${p.phone}</td>
                            <td>${p.city}</td>
                            <td><fmt:formatDate value="${p.createdOn}" pattern="dd-MMM-yyyy"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/patients/view/${p.patientId}" class="btn btn-xs btn-info" title="View"><span class="glyphicon glyphicon-eye-open"></span></a>
                                <a href="${pageContext.request.contextPath}/patients/edit/${p.patientId}" class="btn btn-xs btn-warning" title="Edit"><span class="glyphicon glyphicon-edit"></span></a>
                                <a href="${pageContext.request.contextPath}/patients/delete/${p.patientId}" class="btn btn-xs btn-danger btn-delete" title="Delete"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="9" class="text-center text-muted">No patients found.</td></tr>
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
