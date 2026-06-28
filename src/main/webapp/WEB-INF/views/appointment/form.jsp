<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Book Appointment - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-warning">
                <div class="panel-heading"><h3 class="panel-title"><span class="glyphicon glyphicon-calendar"></span> Book Appointment</h3></div>
                <div class="panel-body">
                    <c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
                    <form action="${pageContext.request.contextPath}/appointments/book" method="post">
                        <div class="form-group">
                            <label>Patient <span class="text-danger">*</span></label>
                            <select class="form-control" name="patientId" required>
                                <option value="">-- Select Patient --</option>
                                <c:forEach var="p" items="${patients}">
                                    <option value="${p.patientId}">${p.patientCode} - ${p.fullName} (${p.phone})</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Doctor <span class="text-danger">*</span></label>
                            <select class="form-control" name="doctorId" required>
                                <option value="">-- Select Doctor --</option>
                                <c:forEach var="d" items="${doctors}">
                                    <option value="${d.doctorId}">${d.fullName} - ${d.specialization} (Fee: &#8377;${d.consultationFee})</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Appointment Date <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" name="appointmentDate" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Time Slot</label>
                                    <select class="form-control" name="appointmentTime">
                                        <option value="09:00 AM">09:00 AM</option>
                                        <option value="10:00 AM">10:00 AM</option>
                                        <option value="11:00 AM">11:00 AM</option>
                                        <option value="12:00 PM">12:00 PM</option>
                                        <option value="02:00 PM">02:00 PM</option>
                                        <option value="03:00 PM">03:00 PM</option>
                                        <option value="04:00 PM">04:00 PM</option>
                                        <option value="05:00 PM">05:00 PM</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Symptoms / Reason</label>
                            <textarea class="form-control" name="symptoms" rows="3" placeholder="Describe symptoms or reason for visit..."></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-calendar"></span> Book Appointment</button>
                            <a href="${pageContext.request.contextPath}/appointments" class="btn btn-default">Cancel</a>
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
