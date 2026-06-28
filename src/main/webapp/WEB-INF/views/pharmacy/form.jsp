<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>${medicine.medicineId == null ? 'Add' : 'Edit'} Medicine - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-briefcase"></span>
                        ${medicine.medicineId == null ? 'Add Medicine' : 'Edit Medicine - '.concat(medicine.medicineCode)}
                    </h3>
                </div>
                <div class="panel-body">
                    <c:set var="formAction" value="${medicine.medicineId == null ? '/pharmacy/add' : '/pharmacy/update'}"/>
                    <form action="${pageContext.request.contextPath}${formAction}" method="post">
                        <c:if test="${medicine.medicineId != null}">
                            <input type="hidden" name="medicineId" value="${medicine.medicineId}">
                            <input type="hidden" name="medicineCode" value="${medicine.medicineCode}">
                        </c:if>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Medicine Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="medicineName" value="${medicine.medicineName}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Generic Name</label>
                                    <input type="text" class="form-control" name="genericName" value="${medicine.genericName}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select class="form-control" name="category">
                                        <option value="">-- Select Category --</option>
                                        <c:forEach var="cat" items="${['Analgesic','Antibiotic','Antiviral','Antifungal','Antidiabetic','Antihypertensive','Antihistamine','Antacid','Statin','Vitamin','Other']}">
                                            <option value="${cat}" ${medicine.category == cat ? 'selected' : ''}>${cat}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Manufacturer</label>
                                    <input type="text" class="form-control" name="manufacturer" value="${medicine.manufacturer}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Unit Price (&#8377;) <span class="text-danger">*</span></label>
                                    <input type="number" step="0.01" class="form-control" name="unitPrice" value="${medicine.unitPrice}" required min="0">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Quantity in Stock</label>
                                    <input type="number" class="form-control" name="quantityInStock" value="${medicine.quantityInStock}" min="0">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Expiry Date</label>
                                    <input type="date" class="form-control" name="expiryDateStr"
                                           value="<fmt:formatDate value='${medicine.expiryDate}' pattern='yyyy-MM-dd'/>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-floppy-disk"></span>
                                ${medicine.medicineId == null ? 'Add Medicine' : 'Update Medicine'}
                            </button>
                            <a href="${pageContext.request.contextPath}/pharmacy" class="btn btn-default">Cancel</a>
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
