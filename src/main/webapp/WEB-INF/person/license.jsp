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
    <form:form action="/licenses" method="post"  modelAttribute="licence">

        <div class="mb-3">
        Person
         <form:select path="person">
        <c:forEach var="onePerson" items="${persons}">
            <!--- Each option VALUE is the id of the person --->
            <form:option value="${onePerson.id}" path="person">
            <!--- This is what shows to the user as the option --->
                <c:out value="${onePerson.firstName}"/>
                <c:out value="${onePerson.lastName}"/>
            </form:option>
        </c:forEach>
    </form:select>
        </div>
          <div class="mb-3">
        
            <form:label path="state">State</form:label>
        	<form:errors  class="text-danger"  path="state"/>
        	<form:input path="state" class="form-control" id="title" placeholder="Enter state" />
        </div>
          <div class="mb-3">
        
            <form:label path="expirationDate">Date</form:label>
        	<form:errors  class="text-danger"  path="expirationDate"/>
        	<form:input path="expirationDate" type="date" class="form-control" id="title" placeholder="Enter Date" />
        </div>

      

     
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>
</body>
</html>