<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navMain">
                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <span class="glyphicon glyphicon-plus-sign"></span> HMS
            </a>
        </div>
        <div class="collapse navbar-collapse" id="navMain">
            <ul class="nav navbar-nav">
                <li class="${pageContext.request.requestURI.contains('/patients') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/patients">
                        <span class="glyphicon glyphicon-user"></span> Patients</a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/doctors') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/doctors">
                        <span class="glyphicon glyphicon-heart"></span> Doctors</a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/appointments') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/appointments">
                        <span class="glyphicon glyphicon-calendar"></span> Appointments</a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/lab') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/lab">
                        <span class="glyphicon glyphicon-search"></span> Laboratory</a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/pharmacy') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/pharmacy">
                        <span class="glyphicon glyphicon-briefcase"></span> Pharmacy</a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/billing') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/billing">
                        <span class="glyphicon glyphicon-usd"></span> Billing</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/">
                    <span class="glyphicon glyphicon-home"></span> Dashboard</a></li>
            </ul>
        </div>
    </div>
</nav>
