<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
		<table id="customers">
  <tr>
    <th>Company</th>
    <th>Contact</th>
    <th>Country</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
    <td> <c:out value="${count}"></c:out></td>
  </tr>
  <tr>
    <td>Berglunds snabbköp</td>
    <td>Christina Berglund</td>
    <td>Sweden</td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
  </tr>
  <tr>
    <td>Ernst Handel</td>
    <td>Roland Mendel</td>
    <td>Austria</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>Helen Bennett</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Königlich Essen</td>
    <td>Philip Cramer</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Yoshi Tannamuri</td>
    <td>Canada</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Giovanni Rovelli</td>
    <td>Italy</td>
  </tr>
  <tr>
    <td>North/South</td>
    <td>Simon Crowther</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Paris spécialités</td>
    <td>Marie Bertrand</td>
    <td>France</td>
  </tr>
</table>
  <c:forEach var="oneDojo" items="${dojosFromMyController}">
        <p><c:out value="${oneDojo}"></c:out></p>
    </c:forEach>
</body>

</html>