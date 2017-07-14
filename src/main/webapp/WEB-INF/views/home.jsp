<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>MST Staff Profile</title>
<!-- Bootstrap Core CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="${contextPath}/resources/css/freelancer.min.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<!-- Require -->

<!-- jQuery -->
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Velocity - Make Animation Stuffs. -->
<script src="${contextPath}/resources/js/velocity.min.js"
	type="text/javascript"></script>
<script src="${contextPath}/resources/js/velocity.ui.js"
	type="text/javascript"></script>
<style>
#table-search-staff-list tbody tr {
	padding: 5px;
}

#table-search-staff-list tbody tr:hover, #table-total-staff tbody tr:hover,
	#table-mng-staffs tbody tr:hover {
	cursor: pointer;
}
</style>
</head>
<body id="page-top" class="index">
	<div id="skipnav">
		<a href="#maincontent">Skip to main content</a>
	</div>
	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll" id="div-header-title">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top" id="a-mst-title">
					${thisStaff.name==null?'MST Staff Profile': 'Welcome! '}${thisStaff.name}${thisStaff.name==null?'': '<i><u><a href="#" data-toggle="modal" data-target="#modal-editself">Edit</a></u> <i>'}</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a href="#home">Staffs</a></li>
					${thisStaff.staffType == 'm'?'<li class="page-scroll" ><a href="#a-view-my-staff" id="a-view-my-staff" >My Staff</a></li>':''}
					<li class="page-scroll">${thisStaff.name==null?'<a href="#signin">Sign in</a>': '<a href="logout" style="color:red">Sign Out</a>'}</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- Header -->
	<header id='home'>
		<div class="container" id="maincontent" tabindex="-1"
			style="height: 800px">
			<div class="row well" style="color: black; text-align: left;">
				<div class="col-lg-2">
					<!-- 	<div class="intro-text">
						<h1 class="name">MST Staff Profile</h1>
						<hr />
					</div> -->
					<div class="form-group" id="div-department-view-for">
						<label>View for :</label> <select id="select-filter-staff-by"
							class="form-control" style="color: black">
							<option value="all">All</option>
							<option value="s">Staff</option>
							<option value="m">Manager</option>
							<option value="department">Specific Department</option>
						</select> <br />
					</div>
					<div class="form-group" id="div-department-search-sec"
						style="opacity: 0">
						<label>Department Of :</label> <select
							id="select-filter-staff-by-department" class="form-control"
							style="color: black">
							<!-- Department Going -->
							<option value="" disabled selected>Please Select...</option>
						</select> <br />
					</div>
				</div>
				<div class="col-lg-10"  style="height: 500px">
					<div class='row well' style="color: #000;"
						id="div-table-total-staff">
						<table id='table-total-staff' style="text-align: left;"
							class='hover stripe'>
							<thead>
								<tr>
									<th>Staff ID</th>
									<th>Name and Surname</th>
									<th>Local Name and Surname</th>
									<th>E-mail Address</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<h5 style='color: #000;'>
						<a href='https://datatables.net/license/mit'>Copyright (C)
							2008-2017, SpryMedia Ltd.</a>
					</h5>
				</div>
			</div>
		</div>
	</header>
	<!-- Search Section -->
	<!-- Staff Board Section -->
	<%
		if (request.getAttribute("managers") == null)
			response.sendRedirect(request.getContextPath());
	%>
	<c:if test="${thisStaff == null }">
		<section id="signin">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2>Sign In</h2>
						<hr />
						<br>
						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 jumbotron"
								style="background-color: #fff">
								<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
								<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
								<form name="signInForm" id="signInForm" action="login"
									method="POST">
									<div class="row control-group">
										<div
											class="form-group col-xs-12 floating-label-form-group controls">
											<label for="Staff ID">Staff ID</label>
											<div class='input-group'>
												<span class="input-group-addon"
													style="background: #eee; border: 0px;"><i
													class="glyphicon glyphicon-user"></i></span> <input type="text"
													class="form-control" placeholder="Staff ID" id="staffId"
													autocomplete="off" name='staffId' required
													data-validation-required-message="Please enter your Staff ID.">
											</div>
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="row control-group">
										<div
											class="form-group col-xs-12 floating-label-form-group controls">
											<label for="password">Password</label>
											<div class='input-group'>
												<span class="input-group-addon"
													style="background: #eee; border: 0px;"><i
													class="glyphicon glyphicon-lock"></i></span> <input
													type="password" class="form-control" placeholder="Password"
													id="password" autocomplete="off" name='password' required
													data-validation-required-message="Please enter your Password.">
											</div>
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div id="success"></div>
									<div class="row">
										<div class="form-group col-xs-12">
											<button type="submit" class="btn btn-success btn-lg">Submit</button>
										</div>
									</div>
									<div class="row control-group" align="center">
										<br/><a href="#" style="color:darkslategray;">Forgot the Password</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	<!-- Contact Section -->




	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">Copyright &copy; STFFPF 2016</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div
		class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>
	<!-- Portfolio Modals -->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>Project Title</h2>
							<hr class="star-primary">
							<p>
								Use this area of the page to describe your project. The icon
								above is part of a free icon set by <a
									href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On
								their website, you can download their free set with 16 icons, or
								you can purchase the entire set with 146 icons for only $12!
							</p>
							<ul class="list-inline item-details">
								<li>Client: <strong><a
										href="http://startbootstrap.com">Start Bootstrap</a> </strong>
								</li>
								<li>Date: <strong><a
										href="http://startbootstrap.com">April 2014</a> </strong>
								</li>
								<li>Service: <strong><a
										href="http://startbootstrap.com">Web Development</a> </strong>
								</li>
							</ul>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<!-- Contact Form JavaScript -->
	<script src="${contextPath}/resources/js/jqBootstrapValidation.js"></script>
	<script src="${contextPath}/resources/js/contact_me.js"></script>
	<!-- Theme JavaScript -->
	<script src="${contextPath}/resources/js/freelancer.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

	<jsp:include page="manage/modal_editself.jsp" />
	<jsp:include page="manage/modal_pickmng.jsp" />
	<jsp:include page="home_include/modal_viewtotal.jsp" />
	<jsp:include page="home_include/modal_viewmng_info.jsp" />
	<jsp:include page="home_include/modal_viewstaff_info.jsp" />
	<jsp:include page="${contextPath}/resources/js/contact_me.js" />
	<script src="${contextPath}/resources/js/jquery.smoothscroll.min.js"></script>
	<script src="${contextPath}/resources/js/stffpf_js/stffpf_home.js"></script>
	<script
		src="${contextPath}/resources/js/stffpf_js/stffpf_home_animate.js"></script>
	<script>
	/* Just for the manager view their staffs. */
	$('#a-view-my-staff').click(function() {
	    searchStaff("bymng", "${thisStaff.staffId}");
	});
    </script>
</body>
</html>
