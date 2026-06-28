<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Generate Bill - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-warning">
                <div class="panel-heading"><h3 class="panel-title"><span class="glyphicon glyphicon-usd"></span> Generate Patient Bill</h3></div>
                <div class="panel-body">
                    <form action="${pageContext.request.contextPath}/billing/generate" method="post" id="billForm">
                        <div class="form-group">
                            <label>Patient <span class="text-danger">*</span></label>
                            <select class="form-control" name="patientId" required>
                                <option value="">-- Select Patient --</option>
                                <c:forEach var="p" items="${patients}">
                                    <option value="${p.patientId}">${p.patientCode} - ${p.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Appointment (Optional)</label>
                            <select class="form-control" name="appointmentId">
                                <option value="">-- No appointment --</option>
                                <c:forEach var="a" items="${appointments}">
                                    <option value="${a.appointmentId}">${a.appointmentNo} - ${a.patient.fullName} with ${a.doctor.fullName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <hr>
                        <h5><strong>Charges Breakdown</strong></h5>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Consultation Fee (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control charge-input" name="consultationFee" value="0" min="0">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Lab Charges (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control charge-input" name="labCharges" value="0" min="0">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Medicine Charges (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control charge-input" name="medicineCharges" value="0" min="0">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Other Charges (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control charge-input" name="otherCharges" value="0" min="0">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Discount (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control" name="discount" id="discountInput" value="0" min="0">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Estimated Total</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">&#8377;</span>
                                        <input type="text" class="form-control" id="totalPreview" readonly value="0.00">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning btn-lg btn-block">
                                <span class="glyphicon glyphicon-print"></span> Generate Bill
                            </button>
                            <a href="${pageContext.request.contextPath}/billing" class="btn btn-default btn-block">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function () {
    function calcTotal() {
        var total = 0;
        $('.charge-input').each(function () { total += parseFloat($(this).val()) || 0; });
        var discount = parseFloat($('#discountInput').val()) || 0;
        $('#totalPreview').val((total - discount).toFixed(2));
    }
    $('.charge-input, #discountInput').on('input', calcTotal);
});
</script>
</body>
</html>
