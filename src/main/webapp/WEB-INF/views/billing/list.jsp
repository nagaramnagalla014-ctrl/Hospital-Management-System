<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Billing - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container-fluid main-content">
    <div class="row page-header-row">
        <div class="col-md-7">
            <h2><span class="glyphicon glyphicon-usd"></span> Billing
                <small>${totalBills} bills | Revenue: &#8377;<fmt:formatNumber value="${totalRevenue}" pattern="#,##0.00"/></small>
            </h2>
        </div>
        <div class="col-md-5 text-right">
            <a href="${pageContext.request.contextPath}/billing/generate" class="btn btn-warning">
                <span class="glyphicon glyphicon-plus"></span> Generate Bill</a>
        </div>
    </div>
    <c:if test="${not empty success}"><div class="alert alert-success alert-dismissible"><button class="close" data-dismiss="alert">&times;</button>${success}</div></c:if>

    <div class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr><th>#</th><th>Bill No.</th><th>Patient</th><th>Consult Fee</th><th>Lab</th><th>Medicine</th><th>Other</th><th>Discount</th><th>Total</th><th>Status</th><th>Date</th><th>Actions</th></tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty bills}">
                        <c:forEach var="b" items="${bills}" varStatus="s">
                        <tr>
                            <td>${s.count}</td>
                            <td><span class="label label-default">${b.billNo}</span></td>
                            <td>${b.patient.fullName}<br><small class="text-muted">${b.patient.patientCode}</small></td>
                            <td>&#8377;<fmt:formatNumber value="${b.consultationFee}" pattern="0.00"/></td>
                            <td>&#8377;<fmt:formatNumber value="${b.labCharges}" pattern="0.00"/></td>
                            <td>&#8377;<fmt:formatNumber value="${b.medicineCharges}" pattern="0.00"/></td>
                            <td>&#8377;<fmt:formatNumber value="${b.otherCharges}" pattern="0.00"/></td>
                            <td>&#8377;<fmt:formatNumber value="${b.discount}" pattern="0.00"/></td>
                            <td><strong>&#8377;<fmt:formatNumber value="${b.totalAmount}" pattern="#,##0.00"/></strong></td>
                            <td><span class="label label-${b.status == 'PAID' ? 'success' : 'warning'}">${b.status}</span></td>
                            <td><fmt:formatDate value="${b.billDate}" pattern="dd-MMM-yyyy"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/billing/view/${b.billId}" class="btn btn-xs btn-info" title="View"><span class="glyphicon glyphicon-eye-open"></span></a>
                                <c:if test="${b.status == 'PENDING'}">
                                    <a href="${pageContext.request.contextPath}/billing/pay/${b.billId}" class="btn btn-xs btn-success" title="Mark Paid"><span class="glyphicon glyphicon-ok"></span> Pay</a>
                                </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="12" class="text-center text-muted">No bills generated yet.</td></tr>
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
