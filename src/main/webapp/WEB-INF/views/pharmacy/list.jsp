<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Pharmacy - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-8"><h2><span class="glyphicon glyphicon-briefcase"></span> Pharmacy / Medicine Store <small>${totalMedicines} medicines</small></h2></div>
        <div class="col-md-4 text-right">
            <a href="${pageContext.request.contextPath}/pharmacy/add" class="btn btn-primary">
                <span class="glyphicon glyphicon-plus"></span> Add Medicine</a>
        </div>
    </div>
    <c:if test="${not empty success}"><div class="alert alert-success alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${success}</div></c:if>

    <!-- Low Stock Alert -->
    <c:if test="${not empty lowStockMedicines}">
    <div class="alert alert-warning">
        <strong><span class="glyphicon glyphicon-exclamation-sign"></span> Low Stock Alert!</strong>
        ${lowStockMedicines.size()} medicine(s) need restocking.
    </div>
    </c:if>

    <!-- Search -->
    <div class="panel panel-default">
        <div class="panel-body">
            <form method="get" action="${pageContext.request.contextPath}/pharmacy" class="form-inline">
                <div class="input-group" style="width:400px;">
                    <input type="text" class="form-control" name="search" value="${search}" placeholder="Search medicines...">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                        <a href="${pageContext.request.contextPath}/pharmacy" class="btn btn-default">Clear</a>
                    </span>
                </div>
            </form>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr><th>#</th><th>Code</th><th>Medicine Name</th><th>Generic Name</th><th>Category</th><th>Manufacturer</th><th>Unit Price</th><th>Stock</th><th>Expiry</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty medicines}">
                        <c:forEach var="m" items="${medicines}" varStatus="s">
                        <tr class="${m.quantityInStock <= 10 ? 'warning' : ''}">
                            <td>${s.count}</td>
                            <td><span class="label label-default">${m.medicineCode}</span></td>
                            <td><strong>${m.medicineName}</strong></td>
                            <td>${m.genericName}</td>
                            <td>${m.category}</td>
                            <td>${m.manufacturer}</td>
                            <td>&#8377;<fmt:formatNumber value="${m.unitPrice}" pattern="0.00"/></td>
                            <td><span class="badge ${m.quantityInStock <= 10 ? 'badge-danger' : 'badge-success'}">${m.quantityInStock}</span></td>
                            <td><fmt:formatDate value="${m.expiryDate}" pattern="MMM-yyyy"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/pharmacy/edit/${m.medicineId}" class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-edit"></span></a>
                                <a href="${pageContext.request.contextPath}/pharmacy/delete/${m.medicineId}" class="btn btn-xs btn-danger btn-delete"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="10" class="text-center text-muted">No medicines found.</td></tr>
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
