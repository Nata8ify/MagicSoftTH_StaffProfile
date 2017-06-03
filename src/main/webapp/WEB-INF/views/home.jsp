<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Magic Software : Staff Profile System</title>

<!-- Bootstrap Core CSS -->
<link
	href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link
	href="${contextPath}/resources/css/freelancer.min.css"
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.c21`m/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top">
					${thisStaff.name==null?'STFFPF': 'Welcome! '}${thisStaff.name}${thisStaff.name==null?'': '<i><u><a href="#" data-toggle="modal" data-target="#modal-editself">Edit</a></u> <i>'}</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a href="#home">Home</a></li>
					<li class="page-scroll"><a href="#search">Search</a></li>
					<li class="page-scroll"><a href="#explore">Explore</a></li>
					<li class="page-scroll">${thisStaff.name==null?'<a href="#contact">For Staff Only</a>': '<a href="logout" style="color:red">Sign Out</a> '}
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header id='home'>
		<div class="container" id="maincontent" tabindex="-1">
			<div class="row">
				<div class="col-lg-12">
					<img class="img-responsive"
						src="${contextPath}/resources/img/profile.png"
						alt="">
					<div class="intro-text">
						<h1 class="name">STFFPF</h1>
						<hr class="star-light">
						<span class="skills">Magic Software's Staffs Board</span>

					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Search Section -->
	<section id='search'>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>Search</h2>
					<hr class="star-primary">
					<form name="signInForm" id="signInForm" novalidate action="login"
						method="POST">
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="Staff ID">Name</label> <input type="text"
									class="form-control text-center" placeholder="Staff ID"
									id="staffId" name='staffId' required
									data-validation-required-message="Please enter your Staff ID."
									value="M60007">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12">
								<button type="submit" class="btn btn-success btn-lg">Search</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- Staff Board Section -->
	<% if(request.getAttribute("managers") == null) response.sendRedirect(request.getContextPath()); %>
	<section class="success" id="explore">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>Staff Board</h2>
					<hr class="star-light">
					<br>
					<table class="table table-responsive">
						<thead>
						
						<tr><td colspan="5"><h3>Managers</h3></td></tr>
						<tr><c:forEach items="${managers}" var="manager" varStatus="c">
								<td>
									<div class="card" style="width: 20rem;">
										<img class="card-img-top"
											src="${contextPath}/resources/portraits/${manager.protraitPath==null?'noimg.png':manager.protraitPath}"
											alt="Portrait" width="170px">
										<div class="card-block">
											<h5 class="card-title">${manager.name}</h5>
											<p class="card-text">${manager.position}</p>
										</div>
									</div>
								</td>
									<c:if test="${c.count % 5 == 0}">
										</tr><tr>
									</c:if>
							</c:forEach>
							</tr>
						</thead>
						<tbody>
						<tr><td colspan="5"><h3>Staffs</h3></td></tr><tr>
							<c:forEach items="${staffs}" var="staff" varStatus="c">
								<td>
									<div class="card" style="width: 20rem;">
										<img class="card-img-top" width="150px"
											src="${contextPath}/resources/portraits/${staff.protraitPath==null?'noimg.png':staff.protraitPath}"
											alt="Portrait">
										<div class="card-block">
											<h5 class="card-title">${staff.name}</h5>
											<h6 class="card-text">${staff.position}</h6>
										</div>
									</div>
								</td>
								<c:if test="${c.count % 5 == 0}">
										</tr><tr>
									</c:if>
							</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-lg-offset-2">
					<!-- Offset Space -->
				</div>
				<div class="col-lg-4">
					<!-- Offset Space -->
				</div>

			</div>
		</div>
	</section>
	<c:if test="${thisStaff == null }">

		<!-- Contact Section -->
		<section id="contact">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2>Sign In</h2>
						<hr class="star-primary">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
						<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
						<form name="signInForm" id="signInForm" novalidate action="login"
							method="POST">
							<div class="row control-group">
								<div
									class="form-group col-xs-12 floating-label-form-group controls">
									<label for="Staff ID">Staff ID</label> <input type="text"
										class="form-control" placeholder="Staff ID" id="staffId"
										name='staffId' required
										data-validation-required-message="Please enter your Staff ID."
										value="M60007">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="row control-group">
								<div
									class="form-group col-xs-12 floating-label-form-group controls">
									<label for="password">Password</label> <input type="password"
										class="form-control" placeholder="Password" id="password"
										name='password' required
										data-validation-required-message="Please enter your Password."
										value="kogy9i8u">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<br>
							<div id="success"></div>
							<div class="row">
								<div class="form-group col-xs-12">
									<button type="submit" class="btn btn-success btn-lg">Submit</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</c:if>

	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>Location</h3>
						<p>
							3481 Melrose Place <br>Beverly Hills, CA 90210
						</p>
					</div>
					<div class="footer-col col-md-4">
						<h3>Around the Web</h3>
						<ul class="list-inline">
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a>
							</li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Google Plus</span><i
									class="fa fa-fw fa-google-plus"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Twitter</span><i class="fa fa-fw fa-twitter"></i></a>
							</li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Linked In</span><i class="fa fa-fw fa-linkedin"></i></a>
							</li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Dribble</span><i class="fa fa-fw fa-dribbble"></i></a>
							</li>
						</ul>
					</div>
					<div class="footer-col col-md-4">
						<h3>explore Freelancer</h3>
						<p>
							Freelance is a free to use, open source Bootstrap theme created
							by <a href="http://startbootstrap.com">Start Bootstrap</a>.
						</p>
					</div>
				</div>
			</div>
		</div>
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
							<img src="img/portfolio/cabin.png"
								class="img-responsive img-centered" alt="">
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

	<jsp:include page="manage/modal_editself.jsp" />

	<!-- jQuery -->
	<script
		src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script
		src="${contextPath}/resources/js/jqBootstrapValidation.js"></script>
	<script
		src="${contextPath}/resources/js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script
		src="${contextPath}/resources/js/freelancer.min.js"></script>

</body>

</html>
