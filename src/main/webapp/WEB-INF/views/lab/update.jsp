<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><title>Update Lab Report - HMS</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="container main-content">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3 class="panel-title"><span class="glyphicon glyphicon-pencil"></span> Update Lab Report - ${labReport.reportNo}</h3></div>
                <div class="panel-body">
                    <form action="${pageContext.request.contextPath}/lab/update" method="post">
                        <input type="hidden" name="reportId" value="${labReport.reportId}">
                        <input type="hidden" name="reportNo" value="${labReport.reportNo}">
                        <div class="form-group">
                            <label>Test Result</label>
                            <textarea class="form-control" name="result" rows="3" placeholder="Enter test result...">${labReport.result}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select class="form-control" name="status">
                                <option value="PENDING" ${labReport.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                <option value="COMPLETED" ${labReport.status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Remarks</label>
                            <textarea class="form-control" name="remarks" rows="2">${labReport.remarks}</textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Update Report</button>
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
