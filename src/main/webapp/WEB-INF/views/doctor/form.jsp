<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>${doctor.doctorId == null ? 'Add' : 'Edit'} Doctor - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-heart"></span>
                        ${doctor.doctorId == null ? 'Add New Doctor' : 'Edit Doctor'}
                    </h3>
                </div>
                <div class="panel-body">
                    <c:set var="formAction" value="${doctor.doctorId == null ? '/doctors/add' : '/doctors/update'}"/>
                    <form action="${pageContext.request.contextPath}${formAction}" method="post">
                        <c:if test="${doctor.doctorId != null}">
                            <input type="hidden" name="doctorId" value="${doctor.doctorId}">
                            <input type="hidden" name="doctorCode" value="${doctor.doctorCode}">
                            <input type="hidden" name="createdOn" value="${doctor.createdOn}">
                        </c:if>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="firstName" value="${doctor.firstName}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="lastName" value="${doctor.lastName}" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <select class="form-control" name="gender">
                                        <option value="Male" ${doctor.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${doctor.gender == 'Female' ? 'selected' : ''}>Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" class="form-control" name="phone" value="${doctor.phone}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" value="${doctor.email}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Specialization <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="specialization" value="${doctor.specialization}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Qualification</label>
                                    <input type="text" class="form-control" name="qualification" value="${doctor.qualification}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Department <span class="text-danger">*</span></label>
                                    <select class="form-control" name="deptId" required>
                                        <option value="">-- Select Department --</option>
                                        <c:forEach var="dept" items="${departments}">
                                            <option value="${dept.deptId}" ${doctor.department != null && doctor.department.deptId == dept.deptId ? 'selected' : ''}>${dept.deptName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Experience (years)</label>
                                    <input type="number" class="form-control" name="experience" value="${doctor.experience}" min="0">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Consultation Fee (&#8377;)</label>
                                    <input type="number" step="0.01" class="form-control" name="consultationFee" value="${doctor.consultationFee}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">
                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                ${doctor.doctorId == null ? 'Add Doctor' : 'Update Doctor'}
                            </button>
                            <a href="${pageContext.request.contextPath}/doctors" class="btn btn-default">Cancel</a>
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
