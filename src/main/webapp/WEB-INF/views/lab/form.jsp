<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Add Lab Report - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-info">
                <div class="panel-heading"><h3 class="panel-title"><span class="glyphicon glyphicon-search"></span> Add Lab Test Report</h3></div>
                <div class="panel-body">
                    <form action="${pageContext.request.contextPath}/lab/add" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Patient <span class="text-danger">*</span></label>
                                    <select class="form-control" name="patientId" required>
                                        <option value="">-- Select Patient --</option>
                                        <c:forEach var="p" items="${patients}">
                                            <option value="${p.patientId}">${p.patientCode} - ${p.fullName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Referring Doctor <span class="text-danger">*</span></label>
                                    <select class="form-control" name="doctorId" required>
                                        <option value="">-- Select Doctor --</option>
                                        <c:forEach var="d" items="${doctors}">
                                            <option value="${d.doctorId}">${d.fullName} - ${d.specialization}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Test Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="testName" required placeholder="e.g. Complete Blood Count">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select class="form-control" name="testCategory">
                                        <option value="">-- Select --</option>
                                        <option value="Hematology">Hematology</option>
                                        <option value="Biochemistry">Biochemistry</option>
                                        <option value="Microbiology">Microbiology</option>
                                        <option value="Radiology">Radiology</option>
                                        <option value="Pathology">Pathology</option>
                                        <option value="Cardiology">Cardiology</option>
                                        <option value="Urine Analysis">Urine Analysis</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Test Date <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" name="testDate" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Normal Range</label>
                                    <input type="text" class="form-control" name="normalRange" placeholder="e.g. 4.5-11.0">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Unit</label>
                                    <input type="text" class="form-control" name="unit" placeholder="e.g. mg/dL">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Charges (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control" name="charges" value="0">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Remarks</label>
                            <textarea class="form-control" name="remarks" rows="2" placeholder="Additional notes..."></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> Create Report</button>
                            <a href="${pageContext.request.contextPath}/lab" class="btn btn-default">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
