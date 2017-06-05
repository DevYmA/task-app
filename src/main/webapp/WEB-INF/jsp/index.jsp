<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Task App | Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<div class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">Logo</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">				
				<li><a href="/new-task">Mange Task</a></li>
				<li><a href="/all-tasks">All Tasks</a></li>				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
						Login</a></li>
			</ul>
		</div>
	</div>
	</div>

	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container">
				<div class="jumbotron text-center">
					<h1>Welcome to Task App !</h1><br>
					<h1>:)</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="taskDiv">
				<h3>My Task</h3>
				<hr>
				<div class="table-reponsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Description</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
									<td>${task.finished}</td>
									<td class="text-center"><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td class="text-center"><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Mange Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/save-task">
					<input type="hidden" name="id" value="${tasks.id }">
					<div class="form-group">
						<label class="controll-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${tasks.name }">
						</div>
					</div>
					<div class="form-group">
						<label class="controll-label col-md-3">Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description" value="${tasks.description }">
						</div>
					</div>
					<div class="form-group">
						<label class="controll-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"
							<c:if test="${tasks.finished}">checked="checked"</c:if>>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" 
							<c:if test="${!tasks.finished}">checked="checked"</c:if>>
							<div class="col-sm-1">No</div>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save">
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>


	<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>