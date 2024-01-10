<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <h3>Create Book</h3>
    <form:form action="/create/person" method="post"  modelAttribute="person">

        <div class="mb-3">
        
            <form:label path="firstName">First Name as</form:label>
        	<form:errors  class="text-danger"  path="firstName"/>
        	<form:input path="firstName" class="form-control" id="title" placeholder="Enter Name" />
        </div>

        <div class="mb-3">   
	         <form:label path="lastName">lastName</form:label>
	       	<form:errors   class="text-danger" path="lastName"/>
	        <form:textarea path="lastName" class="form-control" id="lastName" placeholder="Enter lastName"/>
        </div>

     
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>
</body>
</html>