<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>

<tilesx:useAttribute name="current" />

 <div class="container">

    <!-- Static navbar -->
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href='<spring:url value="/" />'>Java-Blog</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="${current == 'index' ? 'active' : ''} }"><a href='<spring:url value="/" />'>Home</a></li>
             <security:authorize access="hasRole('ROLE_ADMIN')">
            	<li class="${current == 'users' ? 'active' : ''} }"><a href='<spring:url value="/users.html" />'>Users</a></li>
            </security:authorize>
            <li class="${current == 'register' ? 'active' : ''} }"><a href='<spring:url value="/register.html" />'>Registration</a></li>
            <security:authorize access="! isAuthenticated()">
            	<li class="${current == 'login' ? 'active' : ''} }"><a href='<spring:url value="/login.html" />'>Login</a></li>
            </security:authorize>
            <security:authorize access="isAuthenticated()">
            	<li class="${current == 'account' ? 'active' : ''} }"><a href='<spring:url value="/account.html" />'>My Account</a></li>
            	<li><a href='<spring:url value="/logout" />'>Logout</a></li>
            </security:authorize>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
<tiles:insertAttribute name="body" />

<br />
<br />
<center>
<tiles:insertAttribute name="footer" />
</center>
</div>
</body>
</html>