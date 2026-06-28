<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>${patient.patientId == null ? 'Register' : 'Edit'} Patient - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-user"></span>
                        ${patient.patientId == null ? 'Register New Patient' : 'Edit Patient - '.concat(patient.patientCode)}
                    </h3>
                </div>
                <div class="panel-body">
                    <c:set var="formAction" value="${patient.patientId == null ? '/patients/register' : '/patients/update'}"/>
                    <form action="${pageContext.request.contextPath}${formAction}" method="post">
                        <c:if test="${patient.patientId != null}">
                            <input type="hidden" name="patientId" value="${patient.patientId}">
                            <input type="hidden" name="patientCode" value="${patient.patientCode}">
                            <input type="hidden" name="createdOn" value="${patient.createdOn}">
                        </c:if>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="firstName" value="${patient.firstName}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="lastName" value="${patient.lastName}" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <select class="form-control" name="gender">
                                        <option value="">-- Select --</option>
                                        <option value="Male" ${patient.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${patient.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${patient.gender == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <input type="date" class="form-control" name="dob"
                                           value="<fmt:formatDate value='${patient.dob}' pattern='yyyy-MM-dd'/>">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Blood Group</label>
                                    <select class="form-control" name="bloodGroup">
                                        <option value="">-- Select --</option>
                                        <c:forEach var="bg" items="${['A+','A-','B+','B-','AB+','AB-','O+','O-']}">
                                            <option value="${bg}" ${patient.bloodGroup == bg ? 'selected' : ''}>${bg}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="phone" value="${patient.phone}" required maxlength="15">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" value="${patient.email}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Address</label>
                                    <textarea class="form-control" name="address" rows="2">${patient.address}</textarea>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>City</label>
                                    <input type="text" class="form-control" name="city" value="${patient.city}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                ${patient.patientId == null ? 'Register Patient' : 'Update Patient'}
                            </button>
                            <a href="${pageContext.request.contextPath}/patients" class="btn btn-default">
                                <span class="glyphicon glyphicon-arrow-left"></span> Cancel
                            </a>
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
