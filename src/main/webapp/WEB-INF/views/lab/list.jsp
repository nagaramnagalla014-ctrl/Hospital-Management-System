<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Laboratory - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-8"><h2><span class="glyphicon glyphicon-search"></span> Laboratory Reports <small>${totalReports} total</small></h2></div>
        <div class="col-md-4 text-right">
            <a href="${pageContext.request.contextPath}/lab/add" class="btn btn-info">
                <span class="glyphicon glyphicon-plus"></span> Add Lab Report</a>
        </div>
    </div>
    <c:if test="${not empty success}"><div class="alert alert-success alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${success}</div></c:if>

    <div class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr><th>#</th><th>Report No.</th><th>Patient</th><th>Doctor</th><th>Test Name</th><th>Category</th><th>Test Date</th><th>Charges</th><th>Status</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty reports}">
                        <c:forEach var="r" items="${reports}" varStatus="s">
                        <tr>
                            <td>${s.count}</td>
                            <td><span class="label label-info">${r.reportNo}</span></td>
                            <td>${r.patient.fullName}</td>
                            <td>${r.doctor.fullName}</td>
                            <td><strong>${r.testName}</strong></td>
                            <td>${r.testCategory}</td>
                            <td><fmt:formatDate value="${r.testDate}" pattern="dd-MMM-yyyy"/></td>
                            <td>&#8377;${r.charges}</td>
                            <td><span class="label label-${r.status == 'COMPLETED' ? 'success' : 'warning'}">${r.status}</span></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/lab/update/${r.reportId}" class="btn btn-xs btn-primary"><span class="glyphicon glyphicon-pencil"></span> Update</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="10" class="text-center text-muted">No lab reports found.</td></tr>
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
