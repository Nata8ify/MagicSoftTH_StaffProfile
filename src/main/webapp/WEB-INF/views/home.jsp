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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.c21`m/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#table-search-staff-list tbody tr {
	padding: 5px;
}

#table-search-staff-list tbody tr:hover, #table-total-staff tbody tr:hover
	{
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
					<li class="page-scroll"><a href="#home">Staff List</a></li>
					<li class="page-scroll"><a href="#search">Search</a></li>
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
		<div class="container" id="maincontent" tabindex="-1">
			<div class="row ">
				<div class="col-lg-12">
					<!-- 	<div class="intro-text">
						<h1 class="name">MST Staff Profile</h1>
						<hr />
					</div> -->
					<div class='row well' style="color: #000;">
						<table id='table-total-staff' style="text-align: left;"
							class='hover'>
							<thead>
								<tr>
									<th>Staff ID</th>
									<th>Name and Surname</th>
									<th></th>
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
	<section id='search'>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>Search</h2>
					<hr />
					<div class="row control-group">
						<div class='col-xs-3'></div>
						<div
							class="form-group col-xs-6 floating-label-form-group controls">
							<label for="Staff ID" id='label-search'>By Name</label>
							<div class='input-group'>
								<span class="input-group-addon"
									style="background: #eee; border: 0px;"><i
									class="glyphicon glyphicon-search"></i></span> <input type="text"
									class="form-control text-center input-lg" placeholder="Search"
									id="input-search" required maxlength="40"
									style="background-color: #eee"
									data-validation-required-message="Please enter a Part of the Staff Name.">
							</div>

							<!-- 							<input
								type="button"
								class="btn btn-default text-center"
								id="btn-search-bymng"
								required
							 > -->
							<p class="help-block text-danger"></p>
						</div>
						<div class='col-xs-3 '></div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-3 floating-label-form-group controls"></div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<input type="radio" class="text-center" id="mode-namelike-search"
								class='' name='modeSearch' value="namelike" checked> :
							By Name
						</div>
						<div style='display: none;' /* Yoc can't see
							me... */
							class="form-group col-xs-2 floating-label-form-group controls">
							<input type="radio" class="text-center" id="mode-bymng-search"
								name='modeSearch' value="bymng"> : Host Manager
						</div>
						<div
							class="form-group col-xs-3 floating-label-form-group controls">
							<input type="radio" class="text-center" value="staffid"
								id="mode-staffid-search" name='modeSearch'> : By Staff
							ID
						</div>
						<div style='display: none;' /* Yoc can't see
							me... */
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
	<script
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<jsp:include page="manage/modal_editself.jsp" />
	<jsp:include page="manage/modal_pickmng.jsp" />
	<jsp:include page="manage/modal_viewstaff.jsp" />
	<jsp:include page="manage/modal_viewstaff_info.jsp" />
	<script type="text/javascript">
	/* initial stuffs */
	var staffsTable; /* Data Table */
	var staffs;
	var managers;
	var staffList; /* This is a total */
	var isStaffsReady = false;
	var isManagerReady = false;
	var isStaffListReady = false;
	$(document)
		.ready(
			function() {
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

			    $
				    .when(
					    $
						    .ajax({
							"url" : "${pageContext.request.contextPath}/viewAll?json=true"
						    })).then(function(json) {
					staffList = $.parseJSON(json);
					isStaffListReady = true;
					enableSearch();
				    });

			    staffsTable = $('#table-total-staff')
				    .DataTable(
					    {
						"ajax" : {
						    "url" : "${pageContext.request.contextPath}/viewAll?json=true",
						    "dataSrc" : ""
						},
						"columns" : [ {
						    "data" : "staffId",
						    "width" : "20%"
						}, {
						    "data" : "name",
						    "width" : "30%"
						}, {
						    "data" : "nameLocale",
						    "width" : "30%"
						}, {
						    "data" : "email",
						    "width" : "20%"
						} ],
						"columnDefs" : [ {
						    targets : -1,
						    orderable : false
						} ] /* E-mail is Unorderable */
						,
						"bFilter" : false,
						"pageLength" : 50
					    });

			});

	function enableSearch() {
	    if (isStaffListReady & isManagerReady & isStaffsReady) {
		$('#btn-search').prop('disabled', false);
	    }
	}

	/* Staff List Listener */
	$('#table-total-staff').on('click', 'tbody tr', function(evt) {
	    var selectedStaffId = staffsTable.row($(this)).data().staffId;
	    searchStaff('staffid', selectedStaffId);
	});

	var modeSearch = 'namelike'; /* As Default */
	$('input[name = "modeSearch"]').click(function() {
	    $('#input-search').prop('disabled', false);
	    modeSearch = $(this).val();
	    switch ($(this).val()) {
	    case 'namelike':
		$('#input-search').prop("placeholder", "By Name Search");
		$('#label-search').html("By Name Search");
		break;
	    case 'bymng':
		/* Pop the Modal Manager up! */

		$('#input-search').prop('disabled', true);
		pickMngModal();
		break;
	    case 'staffid':
		$('#input-search').prop("placeholder", "By Staff ID Search");
		$('#label-search').html("By Staff ID Search");
		break;
	    case 'viewAll':
		$('#input-search').prop("placeholder", "'Search' to View");
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
	    searchElement = searchElement.trim();
	    tmpSearcTotalStaffs = [];
	    tmpSearchStaffs = [];
	    tmpSearchManager = [];
	    var cardResultBody = null; /* Keep it to build appened body.*/
	    log(mode + " :: " + searchElement);
	    var tableResultBody = $('#table-search-staff-list tbody');
	    tableResultBody.empty();
	    var searchTitle;
	    var isEmpty = true;
	    switch (mode) {
	    case 'namelike':
		$.each(staffList, function(index, val) {
		    if (val.name.toUpperCase().indexOf(
			    searchElement.toUpperCase()) !== -1
			    | val.nameLocale.indexOf(searchElement) !== -1) {
			renderRowStaffSearchResult(val, tableResultBody);
		    }
		});
		if (tmpSearcTotalStaffs.length > 0) {
		    searchTitle = "Results of By Name Search ("
			    + tmpSearcTotalStaffs.length + ").";
		    isEmpty = false;
		} else {
		    isEmpty = true;
		    searchTitle = "No Results for \"" + searchElement + "\".";
		}

		log(tmpSearcTotalStaffs);
		/* appendNameLikeSearchResult(); */
		break;
	    case 'bymng':
		tmpSearchStaffOrMng = null;
		$.each(staffList, function(index, val) {
		    if (val.hostManagerId == searchElement.toUpperCase()) {
			tmpSearchStaffs.push(val);
			/* TODO FOund Staff */
			renderRowStaffSearchResult(val, tableResultBody);
		    }
		    if (val.staffId == searchElement) {
			tmpSearchStaffOrMng = val;

		    }
		});
		log(tmpSearchStaffOrMng);
		if (tmpSearchStaffs != null) {
		    $('#h2-view-staff-topic').html(
			    "Staffs of [" + tmpSearchStaffOrMng.name + "].");
		    isEmpty = false;
		} else {
		    searchTitle = "No Staffs of [" + tmpSearchStaffOrMng.name
			    + "].";
		    isEmpty = true;
		}

		log(tmpSearchStaffOrMng);
		log(tmpSearchStaffs);
		break;
	    case 'staffid':
		tmpSearchStaffOrMng = null;
		$.each(staffList, function(index, val) {
		    if (val.staffId.toUpperCase() == searchElement
			    .toUpperCase()) {
			/* TODO FOund Staff */
			tmpSearchStaffOrMng = val;
			renderStaffInfoModal(val);

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
		if (staffList == []) {
		    isEmpty = true;
		    break;
		}
		$.each(staffList, function(index, val) {
		    tmpSearchStaffs.push(val);
		    /* TODO FOund Staff */
		    renderRowStaffSearchResult(val, tableResultBody);
		});
		isEmpty = false;
		$('#h2-view-staff-topic').html("Magic Software Staff's Board.");

		log(managers);
		log(staffs);
		/* TODO Render */

		break;
	    default: //TODO
	    }
	    if (!isEmpty) {
		$('#modal-view-staff').modal();
		$('#h2-view-staff-topic').html(searchTitle);
	    } else {
		alert("No Result For \"" + searchElement + "\".");
	    }
	}

	/* For Render a Set of Result as Table's Row */
	function renderRowStaffSearchResult(val, tableResultBody) {
	    tmpSearcTotalStaffs.push(val);
	    var protraitPath = val.protraitPath == null ? 'noimg.png'
		    : val.protraitPath;
	    var honorific = val.honorific;
	    var name = val.name;
	    var email = val.email;
	    var tel = val.tel;
	    var division = val.division;
	    var position = val.position;
	    var hostManagerName = val.hostManagerName;
	    var staffType = val.staffType;
	    var staffId = val.staffId;
	    var nameLocaleFmt = val.nameLocale == "" ? "" : ("<br/>("
		    + val.nameLocale + ")");
	    var rowResultBody = $("<tr><td>" + staffId + "</td><td>"
		    + honorific + " " + name + nameLocaleFmt + "</td><td>"
		    + email + "</td></tr>");
	    tableResultBody.append(rowResultBody.click(function() {
		renderStaffInfoModal(val);
	    }));
	}

	/* For Render Selected Staff Information. [Bind 'val' On renderRowStaffSearchResult]*/
	function renderStaffInfoModal(val) {
	    var protraitPath = val.protraitPath == null ? 'noimg.png'
		    : val.protraitPath;
	    var honorific = val.honorific;
	    var name = val.name;
	    var nameLocale = val.nameLocale;
	    var email = val.email;
	    var tel = val.tel;
	    var mobileTel = val.mobileTel;
	    var division = val.division;
	    var position = val.position;
	    var manager = findManagerByManagerId(val.hostManagerId); //<-Better than 3 lines below.
	    log(manager);
	    var hostManagerName = val.hostManagerName; //<-Defauq?
	    var hostManagerNameLocale = val.hostManagerNameLocale; //<-Defauq?
	    var hostManagerEmail = val.hostManagerEmail; //<-Defauq?
	    var staffType = val.staffType;
	    var startWorkingDate = val.startWorkingDate;
		$('#span-info-workingdate').html(startWorkingDate!=null?startWorkingDate:"Not Available");
		
	    var staffId = val.staffId;
	    $('#h4-view-staff-info-title').html("Information of " + name);
	    $('#span-info-staffid').html(staffId);
	    $('#img-info-portrait').attr('src',
		    "${contextPath}/resources/portraits/" + protraitPath);
	    $('#span-info-name-honf').html(honorific + ". ");
	    $('#span-info-name').html(name);
	    /* $('#pan-info-name-local-honf').html(""); */
	    if (nameLocale != "" || nameLocale != null) {
		$('#span-info-name-locale').html(
			nameLocale == "" ? "" : ("<br/>(" + nameLocale + ")"));
	    }
	    $('#span-info-email').html(email);
	    $('#span-info-tel').html(tel);
	    $('#span-info-mobileTel').html(mobileTel == null ? '' : mobileTel);
	    $('#span-info-division').html(division);
	    $('#span-info-position').html(position);
	    if (staffType != 'm') {
		$('#table-staff-mng-info').show();
		if (manager != null) {
		    $('#span-info-name-mng-honf')
			    .html(manager.honorific + ". ");
		}

		$('#span-info-mng').html(
			hostManagerName != null ? hostManagerName : '-');
		if (hostManagerNameLocale != null) {
		    $('#span-info-name-mng-locale').html(
			    " <br/>(" + hostManagerNameLocale + ")");
		}
		$('#span-info-mng-email').html(
			hostManagerEmail != null ? hostManagerEmail : '-');
		if (hostManagerName != null) {
		    $('#span-info-mng-email').html(hostManagerEmail);

		}
	    } else {
		$('#table-staff-mng-info').hide();
		$('#span-info-mng').html(
			hostManagerName != null ? hostManagerName : '-');
	    }
	    $('#modal-view-staff-info').modal();
	}

	function log(str) {
	    console.log(str);
	}

	/* Just for the manager view their staffs. */
	$('#a-view-my-staff').click(function() {
	    searchStaff("bymng", "${thisStaff.staffId}");
	});

	/* Utilities */
	function getTHHonorofic(honorofic) {
	    switch (honorofic) {
	    case "Mr":
		return "นาย";
	    case "Mrs":
		return "นางสาว";
	    case "Ms":
		return "นาง";
	    }
	}

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

	/* Method's Name says Everythings. */
	function findManagerByManagerId(managerId) {
	    var manager;
	    $.each(managers, function(index, val) {
		if (val.staffId == managerId) {
		    manager = val;
		}
	    });
	    return manager;
	}
    </script>
</body>
</html>
