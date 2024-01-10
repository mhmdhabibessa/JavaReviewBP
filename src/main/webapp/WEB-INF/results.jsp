<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style> 
body {
	background: #927f7f;
}
</style>
<body >

<div>
	<p> The Email is : <c:out value="${email}"> </c:out>  </p>
</div>
</body>
</html>