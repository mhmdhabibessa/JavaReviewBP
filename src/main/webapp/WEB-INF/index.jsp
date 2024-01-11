<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/main.js"></script>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<div>
	<!-- Tabs or Pills can be used in a card with the help of .nav-{tabs|pills} and .card-header-{tabs|pills} classes -->
<div class="card">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" id="disabled-tab" data-bs-toggle="tab" href="#disabled" role="tab" aria-controls="disabled" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
  </div>
  <div class="card-body">
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi alias praesentium illo omnis adipisci ipsa suscipit rerum quidem doloribus magnam?</div>
      <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure, asperiores provident ea eaque quis omnis adipisci in exercitationem necessitatibus dolorem.</div>
      <div class="tab-pane fade" id="disabled" role="tabpanel" aria-labelledby="disabled-tab">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Suscipit rem accusamus officia quia eos ducimus consequuntur! Impedit aliquid vero suscipit.</div>
    </div>
    
  </div>
  
</div>

	</div>
	  <div class="col-md-5 mx-auto m-4">
        <form action="/books/search" method="post" modelAttribute="books">
    <div class="input-group">
        <input class="form-control border-end-0 border rounded-pill" type="search" name="query" placeholder="Search" />
        <span class="input-group-append">
            <button type="submit" class="btn btn-primary">Search</button>
        </span>
    </div>
</form>
  </div>
        
<table id="customers">
	  <tr>
	    <th>Title Book</th>
	    <th>Languages</th>
	    <th>#Pages</th>
	    <th>Actions</th>
	  </tr>
	    <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.title}</td>
                    <td>${book.language}</td>
                    <td>${book.numberOfPages}</td>
                     <td class="actions-buttons">
	                    <form action="/books/${book.id}" method="post">
	    					<input type="hidden" name="_method" value="delete">
	    				  	<input type="submit" value="Delete" class="btn btn-danger">
						</form>
						<a href="/books/${book.id}/edit">
						<button type="button" class="btn btn-success">Edit</button>
						</a>
                    </td>
                    
                </tr>
        </c:forEach>
</table>

<c:if test="${not empty error}">
<div class="alert alert-danger" role="alert">
  <c:out value="${error}"> </c:out>
</div>
</c:if>


<div class="container">
    <h3>Create Book</h3>
    <form:form action="/api/books" method="post"  modelAttribute="book">

        <div class="mb-3">
        
            <form:label path="title">Title</form:label>
        	<form:errors  class="text-danger"  path="title"/>
        	<form:input path="title" class="form-control" id="title" placeholder="Enter title" />
        </div>

        <div class="mb-3">   
	         <form:label path="description">Description</form:label>
	       	<form:errors   class="text-danger" path="description"/>
	        <form:textarea path="description" class="form-control" id="description" placeholder="Enter description"/>
        </div>

        <div class="mb-3">
			<form:label path="language">Language</form:label>
	        <form:errors  class="text-danger" path="language"/>
	        <form:input path="language" class="form-control" id="language" placeholder="Example: Arabic"/>
        </div>

        <div class="mb-3">
	        <form:label path="numberOfPages">Pages</form:label>
	        <form:errors  class="text-danger" path="numberOfPages"/>     
	        <form:input type="number" path="numberOfPages" class="form-control" id="pages" placeholder="Enter number of pages"/>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>



</body>

</html>