<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Bill ${bill.billNo} - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        @media print { .no-print { display: none; } .main-content { margin-top: 0; } }
    </style>
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-8"><h3 class="panel-title"><span class="glyphicon glyphicon-print"></span> Bill Receipt - ${bill.billNo}</h3></div>
                        <div class="col-md-4 text-right no-print">
                            <button onclick="window.print()" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-print"></span> Print</button>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="text-center" style="margin-bottom:20px;">
                        <h3>City General Hospital</h3>
                        <p>123 Medical Center Road, Hyderabad - 500001</p>
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Bill No:</strong> ${bill.billNo}</p>
                            <p><strong>Patient:</strong> ${bill.patient.fullName}</p>
                            <p><strong>Patient Code:</strong> ${bill.patient.patientCode}</p>
                            <p><strong>Phone:</strong> ${bill.patient.phone}</p>
                        </div>
                        <div class="col-md-6 text-right">
                            <p><strong>Bill Date:</strong> <fmt:formatDate value="${bill.billDate}" pattern="dd-MMM-yyyy"/></p>
                            <p><strong>Status:</strong> <span class="label label-${bill.status == 'PAID' ? 'success' : 'warning'}">${bill.status}</span></p>
                        </div>
                    </div>
                    <hr>
                    <table class="table table-bordered">
                        <thead class="active"><tr><th>Description</th><th class="text-right">Amount (&#8377;)</th></tr></thead>
                        <tbody>
                            <tr><td>Consultation Fee</td><td class="text-right"><fmt:formatNumber value="${bill.consultationFee}" pattern="#,##0.00"/></td></tr>
                            <tr><td>Laboratory Charges</td><td class="text-right"><fmt:formatNumber value="${bill.labCharges}" pattern="#,##0.00"/></td></tr>
                            <tr><td>Medicine Charges</td><td class="text-right"><fmt:formatNumber value="${bill.medicineCharges}" pattern="#,##0.00"/></td></tr>
                            <tr><td>Other Charges</td><td class="text-right"><fmt:formatNumber value="${bill.otherCharges}" pattern="#,##0.00"/></td></tr>
                            <tr class="warning"><td>Discount</td><td class="text-right">- <fmt:formatNumber value="${bill.discount}" pattern="#,##0.00"/></td></tr>
                            <tr class="success"><td><strong>TOTAL AMOUNT</strong></td><td class="text-right"><strong>&#8377; <fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/></strong></td></tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer no-print">
                    <c:if test="${bill.status == 'PENDING'}">
                        <a href="${pageContext.request.contextPath}/billing/pay/${bill.billId}" class="btn btn-success">
                            <span class="glyphicon glyphicon-ok"></span> Mark as Paid</a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/billing" class="btn btn-default">Back to Billing</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
