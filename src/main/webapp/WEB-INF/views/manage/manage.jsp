<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@page contentType="text/html; charset=UTF-8"%>
<c:set var="resContextPath"
	value="${pageContext.request.contextPath}/resources/" />
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>MST Staff Profile | Administrator Section</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="${resContextPath}admbootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Data Table -->
<link
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="${resContextPath}admcss/styles.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${resContextPath}vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${resContextPath}admjs/custom.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<style>
#table-staffs-unassigned tr:hover, #table-staffs-assigned tr:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<!-- Logo -->
					<div class="logo">
						<h1>
							<a href="${pageContext.request.contextPath}/adm/manage">MST
								Staff Profile | Administrator </a>
						</h1>
					</div>
				</div>
				<div class="col-md-5">
					<div class="row">
						<div class="col-lg-12">
							<!-- 							<div class="input-group form">
								<input type="text" class="form-control" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="button">Search</button>
								</span>
							</div> -->
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="navbar navbar-inverse" role="banner">
						<nav
							class="collapse navbar-collapse bs-navbar-collapse navbar-right"
							role="navigation">
							<ul class="nav navbar-nav">
								<li><a href="logout">Logout</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-content">
		<div class="row">
			<div class="col-md-2">
				<div class="sidebar content-box" style="display: block;">
					<ul class="nav">
						<!-- Main menu -->
						<li class="current"><a href="manage"><i
								class="glyphicon glyphicon-search"></i> Explore</a></li>
						<li><a href="managechoice?to=addstaff"><i
								class="glyphicon glyphicon-plus"></i> Add</a></li>
						<li><a href="managechoice?to=mngeditor"><i
								class="glyphicon glyphicon-pencil"></i> Staff Transfer</a></li>
						<li><a href="managechoice?to=departmentmng"><i
								class="glyphicon glyphicon-briefcase"></i> Department Manager</a></li>
						<li><a href="managechoice?to=dangerzone"><i
								class="glyphicon glyphicon-info-sign"></i> Advance</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<c:choose>
						<c:when test="${manage == 'mngeditor'}">
							<jsp:include page="modal_pickmng.jsp" />
							<jsp:include page="include_mngeditor.jsp" />
							<jsp:include page="modal_pickmng.jsp" />
						</c:when>
						<c:when test="${manage == 'add'}">
							<jsp:include page="modal_pickmng.jsp" />
							<jsp:include page="include_addstaff.jsp" />
						</c:when>
						<c:when test="${manage == 'departmentmng'}">
							<jsp:include page="include_managedepartment.jsp" />
						</c:when>
						<c:when test="${manage == 'dangerzone'}">
							<jsp:include page="include_advance.jsp" />
						</c:when>
						<c:otherwise>
							<script src="https://momentjs.com/downloads/moment.js"
								type="text/javascript"></script>
							<jsp:include page="modal_editfull.jsp" />
							<jsp:include page="modal_pickmng.jsp" />
							<jsp:include page="include_explore.jsp" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="copy text-center">
				Copyright 2014 <a href='#'>STFFPS</a>
			</div>
		</div>
	</footer>
</body>
</html>

