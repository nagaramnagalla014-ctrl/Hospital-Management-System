<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head><title>Error - HMS</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container" style="margin-top:100px;">
    <div class="col-md-6 col-md-offset-3 text-center">
        <div class="panel panel-danger">
            <div class="panel-heading"><h3>Oops! Something went wrong</h3></div>
            <div class="panel-body">
                <p class="text-muted">An error occurred. Please contact the system administrator.</p>
                <a href="javascript:history.back()" class="btn btn-default">Go Back</a>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Dashboard</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
