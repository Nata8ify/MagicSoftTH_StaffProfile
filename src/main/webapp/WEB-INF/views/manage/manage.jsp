<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page contentType="text/html; charset=UTF-8"%>
<c:set var="resContextPath"
	value="${pageContext.request.contextPath}/resources/" />
<%-- <html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world! : ${msg}</h1>
	<form action="insertPerson.f" method="post"
		enctype="multipart/form-data">
		<select name="insertType">
			<option value="m">Manager</option>
			<option value="s">Staff</option>
		</select> <input type="text" name="staffId" placeholder="staffId" /><br>
		<select name="gender">
			<option value="m">ชาย</option>
			<option value="f">หญิง</option>
		</select><br> <input type="text" name="name" placeholder="name" /><br>
		<input type="text" name="email" placeholder="email" /><br /> <input
			type="text" name="tel" placeholder="tel" /><br>
		<input type="file" name="protraitPath" /><br> <input type="text"
			name="division" placeholder="division" /><br> <input
			type="text" name="position" placeholder="position" /><br> <input
			type="text" name="password" placeholder="password" /><br>
		<input type="hidden" name="insertType" value="s" /><br> <input
			type="submit" />
	</form>
	<hr>
	<form action="editPerson?editType=s" method="post">
		<input type="text" name="staffId" placeholder="staffId" readonly
			value="${thisStaff.staffId}" /><br> <select name="gender">
			<option value="m">ชาย</option>
			<option value="f">หญิง</option>
		</select><br> <input type="text" name="name" placeholder="name" /><br>
		<input type="text" name="email" placeholder="email" /><br> <input
			type="text" name="tel" placeholder="tel" /><br> <input
			type="text" name="division" placeholder="division" /><br>
		<input type="text" name="position" placeholder="position" /><br>
		<input type="submit" />
	</form>
	<hr>
	<form action="deletePerson?deleteType=s" method="post">
		<input type="text" name="staffId" placeholder="staffId" /><br> <input
			type="submit" />
	</form>
	<P>The time on the server is ${serverTime}.</P>
</body>
</html> --%>
<!DOCTYPE html>
<html>
<head>
<title>STFFPS | Administrator Section</title>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<!-- Logo -->
					<div class="logo">
						<h1>
							<a href="index.html">STFFPS | Administrator Section </a>
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
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">${thisStaff.name}</a>
								<li>${thisStaff != null ? '<a href="logout">Logout</a>':'-'}
								</li>
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
								class="glyphicon glyphicon-pencil"></i> Manager Editors</a></li>
						<li><a href="forms.html"><i
								class="glyphicon glyphicon-tasks"></i> Forms</a></li>
						<li class="submenu"><a href="#"> <i
								class="glyphicon glyphicon-list"></i> Pages <span
								class="caret pull-right"></span>
						</a> <!-- Sub menu -->
							<ul>
								<li><a href="login.html">Login</a></li>
								<li><a href="signup.html">Signup</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="col-md-10">

				<div class="row">
					<c:choose>
						<c:when test="${manage == 'mngeditor'}">
							<jsp:include page="include_mngeditor.jsp" />
						</c:when>
						<c:when test="${manage == 'add'}">
							<jsp:include page="include_addstaff.jsp" />
						</c:when>
						<c:otherwise>
							<jsp:include page="include_explore.jsp" />
							<jsp:include page="modal_editfull.jsp" />
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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${resContextPath}vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${resContextPath}admjs/custom.js"></script>

	<script
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		var staffTable;
		$(document)
				.ready(
						function() {
							staffTable = $('#staff-explore-table')
									.DataTable(
											{
												"ajax" : {
													"url" : "${pageContext.request.contextPath}/viewAll?json=true",
													"dataSrc" : ""
												},
												"columns" : [ {
													"data" : "protraitPath",
													"width" : "10%"
												}, {
													"data" : "staffId",
													"width" : "5%"
												}, {
													"data" : "name",
													"width" : "20%"
												}, {
													"data" : "email",
													"width" : "10%"
												}, {
													"data" : "tel",
													"width" : "10%"
												}, {
													"data" : "division",
													"width" : "10%"
												}, {
													"data" : "position",
													"width" : "20%"
												}, {
													"width" : "5%"
												} ],
												"columnDefs" : [
														{
															"targets" : 0,
															"data" : null,
															"searchable" : false,
															"render" : function(
																	url, type,
																	full) {
																var imgSource = full[0] == null ? "${resContextPath}portraits/noimg.png"
																		: "${resContextPath}/portraits/"
																				+ full[0];
																return '<img src="'+imgSource+'" width="150px" alt="Portrait"/>';
															}
														},
														{
															"targets" : -1,
															"data" : "",
															"searchable" : false,
															"defaultContent" : "<button class='staff-edit btn btn-default'><i class='glyphicon glyphicon-pencil'></i></button>"
														}

												],
												"order" : [ [ 1, "asc" ] ]
											});
						});
	</script>

	<script type="text/javascript">
		var staffList;
		$(document).ready(function() {
			$.when($.ajax({
				"url" : "${pageContext.request.contextPath}/viewAll?json=true"
			})).then(function(json) {
				staffList = $.parseJSON(json);
			});
		});
		$('#staff-explore-table tbody').on(
				'click',
				'tr .staff-edit',
				function() {
					console.log("DDD");
					var thisStaffId = staffTable.row($(this).parents('tr'))
							.data().staffId;
					$.each(staffList, function(index, value) {
						if (value.staffId == thisStaffId) {
							$('#insertType').val(value.staffType);
							$('#staffId').val(value.staffId);
							$('#name').val(value.name);
							$('#email').val(value.email);
							$('#tel').val(value.tel);
							$('#division').val(value.division);
							$('#position').val(value.position);
							$('#gender').val(value.gender);
							return;
						}
					})
					$('#modal-staff-edit').modal();
				});
	</script>
</body>
</html>
