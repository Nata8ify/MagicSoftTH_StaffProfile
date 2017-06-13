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

<!-- Awesome Ico -->
<link
	href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.c21`m/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.card-staff {
	padding-top: 10px;
}

.card-staff:hover {
	cursor: pointer;
	background-color: #eee;
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
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top">
					${thisStaff.name==null?'MST Staff Profile': 'Welcome! '}${thisStaff.name}${thisStaff.name==null?'': '<i><u><a href="#" data-toggle="modal" data-target="#modal-editself">Edit</a></u> <i>'}</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a href="#home">Home</a></li>
					<li class="page-scroll"><a href="#search">Search</a></li>
					${thisStaff.staffType == 'm'?'<li class="page-scroll" ><a href="#a-view-my-staff" id="a-view-my-staff" >My Staff</a></li>':''}
					<li class="page-scroll">${thisStaff.name==null?'<a href="#signin">Sign Login</a>': '<a href="logout" style="color:red">Sign Out</a> '}
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
						src="${contextPath}/resources/img/profile.png" alt="">
					<div class="intro-text">
						<h1 class="name">STFFPF</h1>
						<hr class="star-light">
						<span class="skills">MST Staff Profile</span>
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
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label for="Staff ID" id='label-search'>Part of the Name</label>
							<input type="text" class="form-control text-center"
								placeholder="&#xe003; Search" id="input-search" required
								maxlength="40"
								data-validation-required-message="Please enter a Part of the Staff Name.">
							<!-- 							<input
								type="button"
								class="btn btn-default text-center"
								id="btn-search-bymng"
								required
							 > -->
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-3 floating-label-form-group controls"></div>
						<div
							class="form-group col-xs-2 floating-label-form-group controls">
							<input type="radio" class="text-center" id="mode-namelike-search"
								name='modeSearch' value="namelike" checked> : By Name
						</div>
						<div style='display: none;' /* Yoc can't see
							me... */
							class="form-group col-xs-2 floating-label-form-group controls">
							<input type="radio" class="text-center" id="mode-bymng-search"
								name='modeSearch' value="bymng"> : Host Manager
						</div>
						<div
							class="form-group col-xs-2 floating-label-form-group controls">
							<input type="radio" class="text-center" value="staffid"
								id="mode-staffid-search" name='modeSearch'> : By Staff
							ID
						</div>
						<div
							class="form-group col-xs-2 floating-label-form-group controls">
							<input type="radio" class="text-center" value="viewAll"
								id="mode-viewall-search" name='modeSearch'> : Everybodys
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls"></div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button disabled id='btn-search' type="submit"
								class="btn btn-success btn-lg">Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Staff Board Section -->
	<%
		if (request.getAttribute("managers") == null)
			response.sendRedirect(request.getContextPath());
	%>
	<c:if test="${thisStaff == null }">
		<section class="success" id="signin">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2>Sign In</h2>
						<hr class="star-light">
						<br>
						<div class="row">
							<div class="col-lg-8 col-lg-offset-2 jumbotron" style="background-color: #fff">
								<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
								<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
								<form name="signInForm" id="signInForm" action="login"
									method="POST">
									<div class="row control-group">
										<div
											class="form-group col-xs-12 floating-label-form-group controls">
											<label for="Staff ID">Staff ID</label> <input type="text"
												class="form-control" placeholder="Staff ID" id="staffId"
												autocomplete="off" name='staffId' required
												data-validation-required-message="Please enter your Staff ID.">
											<p class="help-block text-danger"></p>
										</div>
									</div>
									<div class="row control-group">
										<div
											class="form-group col-xs-12 floating-label-form-group controls">
											<label for="password">Password</label> <input type="password"
												class="form-control" placeholder="Password" id="password"
												autocomplete="off" name='password' required
												data-validation-required-message="Please enter your Password.">
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
				</div>
			</div>
		</section>
	</c:if>
	<!-- Contact Section -->




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
									class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Google Plus</span><i
									class="fa fa-fw fa-google-plus"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Twitter</span><i class="fa fa-fw fa-twitter"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Linked In</span><i class="fa fa-fw fa-linkedin"></i></a></li>
							<li><a href="#" class="btn-social btn-outline"><span
									class="sr-only">Dribble</span><i class="fa fa-fw fa-dribbble"></i></a></li>
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
	<!-- jQuery -->
	<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
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
	<jsp:include page="manage/modal_editself.jsp" />
	<jsp:include page="manage/modal_pickmng.jsp" />
	<jsp:include page="manage/modal_viewstaff.jsp" />
	<jsp:include page="manage/modal_viewstaff_info.jsp" />
	<script type="text/javascript">
		/* initial stuffs */
		var staffs;
		var managers;
		var staffList; /* This is a total */
		var isStaffsReady = false;
		var isManagerReady = false;
		var isStaffListReady = false;
		$(document).ready(function() {
			$.ajax({
				"url" : "viewAllStaffs?json=true",
				"success" : function(slist) {
					staffs = $.parseJSON(slist);
					console.log(staffs);
					isStaffsReady = true;
					enableSearch();
				}
			});
			$.ajax({
				"url" : "viewAllMngs?json=true",
				"success" : function(mlist) {
					managers = $.parseJSON(mlist);
					console.log(managers);
					isManagerReady = true;
					enableSearch();
				}
			});

			$.when($.ajax({
				"url" : "${pageContext.request.contextPath}/viewAll?json=true"
			})).then(function(json) {
				staffList = $.parseJSON(json);
				isStaffListReady = true;
				enableSearch();
			});

		});

		function enableSearch() {
			if (isStaffListReady & isManagerReady & isStaffsReady) {
				$('#btn-search').prop('disabled', false);
			}
		}

		var modeSearch = 'namelike'; /* As Default */
		$('input[name = "modeSearch"]').click(
				function() {
					$('#input-search').prop('disabled', false);
					modeSearch = $(this).val();
					switch ($(this).val()) {
					case 'namelike':
						$('#input-search').prop("placeholder",
								"ex. Anserson, Cean, Lee, etc.");
						$('#label-search').html("Name Like Searching");
						break;
					case 'bymng':
						/* Pop the Modal Manager up! */

						$('#input-search').prop('disabled', true);
						pickMngModal();
						break;
					case 'staffid':
						$('#input-search').prop("placeholder", "ex. M60999.");
						$('#label-search').html("Staff ID Searching");
						break;
					case 'viewAll':
						$('#input-search').prop("placeholder",
								"'Search' to View");
						$('#input-search').prop('disabled', true);
						break;
					default: //TODO
					}
				});

		/* modal_pickmng */
		function pickMngModal() {
			$('#mnglist-tbody').html("");
			$
					.each(
							managers,
							function(index, value) {
								var staffId = value.staffId;
								var portraitPath = value.protraitPath == null ? 'noimg.png'
										: value.protraitPath;
								var name = value.name;
								var position = value.position;
								var btnAssignHtml = $("<tr><td><img style='text-align:center' width='70px' class='img-respomsive' src='${contextPath}/resources/portraits/"
										+ portraitPath
										+ "' alt='Manager's Portriat'/></td><td>"
										+ staffId
										+ "</td><td>"
										+ name
										+ "</td><td>"
										+ position
										+ "</td><td><button class='btn btn-default btn-assign-mng'><i class='glyphicon glyphicon-ok'></i></button></td></tr>");
								$('#mnglist-tbody').append(
										btnAssignHtml.click(function() {
											searchStaff(modeSearch, staffId);
											$('#modal-assign-mng')
													.modal('hide');

											/* TODO Render */

											$('#h2-view-staff-topic').html(
													"Results for (" + name
															+ ").");
											$('#modal-view-staff').modal();
										}));
							});
			$('#modal-assign-mng').modal();
		};

		/* Action after do Searching */
		$('#btn-search').click(
				function() {
					log($('#input-search').is(":disabled"));
					if ($('#input-search').val() != ''
							|| $('#input-search').is(":disabled")) {

						var searchElement = $('#input-search').val();
						searchStaff(modeSearch, searchElement);
					} else {
						alert("Empty Field is Unaccepted.");
					}
				});

		var tmpSearcTotalStaffs; /* keep the everytime search result. But this included total staff/manager. */
		var tmpSearchStaffs; /* keep the everytime search result. */
		var tmpSearchManagers; /* keep the everytime search result. */
		var tmpSearchStaffOrMng; /* Just Single Staff / Manager Result. */
		function searchStaff(mode, searchElement) {
			tmpSearcTotalStaffs = [];
			tmpSearchStaffs = [];
			tmpSearchManager = [];
			var cardResultBody = null; /* Keep it to build appened body.*/
			log(mode + " :: " + searchElement);
			var varStatus = 1;
			var divResultBody = $('#div-searchrs-out');
			divResultBody.empty();
			var searchTitle;

			switch (mode) {
			case 'namelike':
				divResultBody.append($("<div class='row'>"));
				$
						.each(
								staffList,
								function(index, val) {
									if (val.name.indexOf(searchElement) !== -1) {
										log(varStatus);
										tmpSearcTotalStaffs.push(val);
										var protraitPath = val.protraitPath == null ? 'noimg.png'
												: val.protraitPath;
										var name = val.name;
										var email = val.email;
										var tel = val.tel;
										var division = val.division;
										var position = val.position;
										var hostManagerName = val.hostManagerName;
										var staffType = val.staffType;
										var staffId = val.staffId;
										cardResultBody = $("<div class='col-sm-2'><div class='card card-staff' style='width: 20rem;'>"
												+ "<img class='card-img-top' width='150px' src='${contextPath}/resources/portraits/"+protraitPath+"' alt='Portrait'>"
												+ "<div class='card-block'> <h5 class='card-title'>"
												+ name
												+ "</h5> <h6 class='card-text'>"
												+ position
												+ "</h6></div></div></div>");
										if (varStatus % 5 == 0) {
											log(varStatus % 5 == 0);
											divResultBody
													.append($("<tr></tr>"));
										}
										divResultBody
												.append(cardResultBody
														.click(function() {
															$(
																	'#h4-view-staff-info-title')
																	.html(
																			"Information of "
																					+ val.name);
															$(
																	'#img-info-portrait')
																	.attr(
																			'src',
																			"${contextPath}/resources/portraits/"
																					+ protraitPath);
															$(
																	'#span-info-staffid')
																	.html(
																			staffId);
															$('#span-info-name')
																	.html(name);
															$(
																	'#span-info-email')
																	.html(email);
															$('#span-info-tel')
																	.html(tel);
															$(
																	'#span-info-division')
																	.html(
																			division);
															$(
																	'#span-info-position')
																	.html(
																			position);
															if (staffType != 'm') {
																$(
																		'#span-info-mng')
																		.html(
																				hostManagerName != null ? hostManagerName
																						: '-');
															} else {
																$(
																		'#span-info-mng')
																		.html(
																				hostManagerName != null ? hostManagerName
																						: '-');
															}
															$(
																	'#modal-view-staff-info')
																	.modal();
														}));
										varStatus++;
									}
								});
				divResultBody.append($("</div>"));

				log("cardResultBody: " + cardResultBody);
				if (tmpSearcTotalStaffs.length > 0) {
					searchTitle = "Results of Name Like Search ("
							+ tmpSearcTotalStaffs.length + ").";
				} else {
					searchTitle = "No Results for ["
							+ tmpSearcTotalStaffs.length + "].";
				}

				log(tmpSearcTotalStaffs);
				/* appendNameLikeSearchResult(); */
				break;
			case 'bymng':
				tmpSearchStaffOrMng = null;
				divResultBody.empty();
				$
						.each(
								staffList,
								function(index, val) {
									if (val.hostManagerId == searchElement) {
										tmpSearchStaffs.push(val);
										/* TODO FOund Staff */
										var protraitPath = val.protraitPath == null ? 'noimg.png'
												: val.protraitPath;
										var name = val.name;
										var email = val.email;
										var tel = val.tel;
										var division = val.division;
										var position = val.position;
										var hostManagerName = val.hostManagerName;
										var staffType = val.staffType;
										var staffId = val.staffId;
										cardResultBody = $("<div class='col-sm-2'><div class='card card-staff' style='width: 20rem;'>"
												+ "<img class='card-img-top' width='150px' src='${contextPath}/resources/portraits/"+protraitPath+"' alt='Portrait'>"
												+ "<div class='card-block'> <h5 class='card-title'>"
												+ name
												+ "</h5> <h6 class='card-text'>"
												+ position
												+ "</h6></div></div></div>");
										if (varStatus % 5 == 0) {
											log(varStatus % 5 == 0);
											divResultBody
													.append($("<tr></tr>"));
										}
										divResultBody
												.append(cardResultBody
														.click(function() {
															$(
																	'#h4-view-staff-info-title')
																	.html(
																			"Information of "
																					+ val.name);
															$(
																	'#img-info-portrait')
																	.attr(
																			'src',
																			"${contextPath}/resources/portraits/"
																					+ protraitPath);
															$(
																	'#span-info-staffid')
																	.html(
																			staffId);
															$('#span-info-name')
																	.html(name);
															$(
																	'#span-info-email')
																	.html(email);
															$('#span-info-tel')
																	.html(tel);
															$(
																	'#span-info-division')
																	.html(
																			division);
															$(
																	'#span-info-position')
																	.html(
																			position);
															if (staffType != 'm') {
																$(
																		'#span-info-mng')
																		.html(
																				hostManagerName != null ? hostManagerName
																						: '-');
															} else {
																$(
																		'#span-info-mng')
																		.html(
																				hostManagerName != null ? hostManagerName
																						: '-');
															}
															$(
																	'#modal-view-staff-info')
																	.modal();
														}));
										varStatus++;
									}
									if (val.staffId == searchElement) {
										tmpSearchStaffOrMng = val;

									}
								});
				divResultBody.append($("</div>"));
				log(tmpSearchStaffOrMng);
				if (tmpSearchStaffs != null) {
					$('#h2-view-staff-topic').html(
							"Results for [" + tmpSearchStaffOrMng.name + "].");
				} else {
					searchTitle = "No Results for [" + tmpSearchStaffOrMng.name
							+ "].";
				}

				$('#modal-view-staff').modal();
				log(tmpSearchStaffOrMng);
				log(tmpSearchStaffs);
				break;
			case 'staffid':
				tmpSearchStaffOrMng = null;
				$
						.each(
								staffList,
								function(index, val) {
									if (val.staffId == searchElement) {
										/* TODO FOund Staff */
										tmpSearchStaffOrMng = val;
										var protraitPath = val.protraitPath == null ? 'noimg.png'
												: val.protraitPath;
										var name = val.name;
										var email = val.email;
										var tel = val.tel;
										var division = val.division;
										var position = val.position;
										var hostManagerName = val.hostManagerName;
										var staffType = val.staffType;
										var staffId = val.staffId;
										$('#h4-view-staff-info-title').html(
												"Information of " + name);
										$('#span-info-staffid').html(staffId);
										$('#img-info-portrait').attr(
												'src',
												"${contextPath}/resources/portraits/"
														+ protraitPath);
										$('#span-info-name').html(name);
										$('#span-info-email').html(email);
										$('#span-info-tel').html(tel);
										$('#span-info-division').html(division);
										$('#span-info-position').html(position);
										if (staffType != 'm') {
											$('#span-info-mng')
													.html(
															hostManagerName != null ? hostManagerName
																	: '-');
										} else {
											$('#span-info-mng')
													.html(
															hostManagerName != null ? hostManagerName
																	: '-');
										}

									}
								});
				log(tmpSearchStaffOrMng);
				/* TODO Render */
				if (tmpSearchStaffOrMng != null) {
					$('#modal-view-staff-info').modal();
				} else {
					alert(searchElement + " is Not Found.");
				}
				return;
			case 'viewAll':
				tmpSearchStaffOrMng = null;
				tmpSearchStaffs = staffList; /* This is a total */
				tmpSearchStaffs = staffs;
				tmpSearchManagers = managers;

				divResultBody.empty();
				$
						.each(
								staffList,
								function(index, val) {

									tmpSearchStaffs.push(val);
									/* TODO FOund Staff */
									var protraitPath = val.protraitPath == null ? 'noimg.png'
											: val.protraitPath;
									var name = val.name;
									var email = val.email;
									var tel = val.tel;
									var division = val.division;
									var position = val.position;
									var hostManagerName = val.hostManagerName;
									var staffType = val.staffType;
									var staffId = val.staffId;
									cardResultBody = $("<div class='col-sm-2'><div class='card card-staff' style='width: 20rem;'>"
											+ "<img class='card-img-top' width='150em' src='${contextPath}/resources/portraits/"+protraitPath+"' alt='Portrait'>"
											+ "<div class='card-block'> <h5 class='card-title'>"
											+ name
											+ "</h5> <h6 class='card-text'>"
											+ position
											+ "</h6></div></div></div>");
									if (varStatus % 5 == 0) {
										log(varStatus % 5 == 0);
										divResultBody.append($("<tr></tr>"));
									}
									divResultBody
											.append(cardResultBody
													.click(function() {
														$(
																'#h4-view-staff-info-title')
																.html(
																		"Information of "
																				+ val.name);
														$('#img-info-portrait')
																.attr(
																		'src',
																		"${contextPath}/resources/portraits/"
																				+ protraitPath);
														$('#span-info-staffid')
																.html(staffId);
														$('#span-info-name')
																.html(name);
														$('#span-info-email')
																.html(email);
														$('#span-info-tel')
																.html(tel);
														$('#span-info-division')
																.html(division);
														$('#span-info-position')
																.html(position);
														if (staffType != 'm') {
															$('#span-info-mng')
																	.html(
																			hostManagerName != null ? hostManagerName
																					: '-');
														} else {
															$('#span-info-mng')
																	.html(
																			hostManagerName != null ? hostManagerName
																					: '-');
														}
														$(
																'#modal-view-staff-info')
																.modal();
													}));

								});
				divResultBody.append($("</div>"));
				$('#h2-view-staff-topic').html("Magic Software Staff's Board.");
				$('#modal-view-staff').modal();

				log(managers);
				log(staffs);
				/* TODO Render */

				break;
			default: //TODO
			}
			$('#modal-view-staff').modal();
			$('#h2-view-staff-topic').html(searchTitle);
		}

		function log(str) {
			console.log(str);
		}

		/* Just for the manager view their staffs. */
		$('#a-view-my-staff').click(function() {
			searchStaff("bymng", "${thisStaff.staffId}");
		});

		/* Not understand this trick so much! but will come to see another day, lol. */
		$(document).on(
				'hidden.bs.modal',
				'.modal',
				function() {
					$('.modal:visible').length
							&& $(document.body).addClass('modal-open');
				});

		$('#modal-view-staff, #modal-view-staff-info').on('hidden.bs.modal',
				function(e) {
					$('#btn-search').prop('disabled', false);
				});
		$('#modal-view-staff, #modal-view-staff-info').on('shown.bs.modal',
				function(e) {
					$('#btn-search').prop('disabled', true);
				});
	</script>
</body>
</html>
