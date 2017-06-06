<%@ page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<c:set
	var="contextPath"
	value="${pageContext.request.contextPath}"
/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=ISO-8859-1"
>
<title>Welcome To STFFPS Administrator Section</title>
<link
	href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"
>
<!-- Theme CSS -->
<link
	href="${contextPath}/resources/css/freelancer.min.css"
	rel="stylesheet"
>
<!-- Custom Fonts -->
<link
	href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet"
	type="text/css"
>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet"
	type="text/css"
>
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet"
	type="text/css"
>
<style type="text/css">
.pad-small {
	padding: 1%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<section id="contact">
	<div class="container">
		<div class="row pad-small text-center">
			<div class="col-lg-8 col-lg-offset-2">
				<img
					src="${contextPath}/resources/img/${errIco}"
					alt='errWarn'
					width="18%"
				/>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>${errMsg}</h2>
				<hr class="star-primary">
			</div>
		</div>
		<div class="row pad-small">
			<div class="col-lg-10 col-lg-offset-2">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
				<h3>${errDesc}</h3>
			</div>
		</div>
		<div class="row pad-small text-center">
			<div class="col-lg-8 col-lg-offset-2">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
				<button
					class='btn btn-info'
					onclick='javascript:history.back()'
				>Go Back</button>
			</div>
		</div>
	</div>
	</section>
	<!-- jQuery -->
	<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"
	></script>
	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"
	></script>
	<!-- Contact Form JavaScript -->
	<script src="${contextPath}/resources/js/jqBootstrapValidation.js"></script>
	<script src="${contextPath}/resources/js/contact_me.js"></script>
	<!-- Theme JavaScript -->
	<script src="${contextPath}/resources/js/freelancer.min.js"></script>
</body>
</html>