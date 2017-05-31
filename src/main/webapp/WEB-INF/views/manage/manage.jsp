<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world! : ${msg}</h1>
	<form action="insertPerson?insertType=s" method="post">
		<input type="text" name="staffId" placeholder="staffId" /><br> <select
			name="gender">
			<option value="m">ชาย</option>
			<option value="f">หญิง</option>
		</select><br> <input type="text" name="name" placeholder="name" /><br>
		<input type="text" name="email" placeholder="email" /><br /> <input
			type="text" name="tel" placeholder="tel" /><br> <input
			type="text" name="division" placeholder="division" /><br> <input
			type="text" name="position" placeholder="position" /><br> <input
			type="submit" />
	</form>
	<hr>
	<form action="editPerson?editType=s" method="post">
		<input type="text" name="staffId" placeholder="staffId" /><br> <select
			name="gender">
			<option value="m">ชาย</option>
			<option value="f">หญิง</option>
		</select><br> <input type="text" name="name" placeholder="name" /><br>
		<input type="text" name="email" placeholder="email" /><br> <input
			type="text" name="tel" placeholder="tel" /><br> <input
			type="text" name="division" placeholder="division" /><br><input
			type="text" name="position" placeholder="position" /><br> <input
			type="submit" />
	</form>
	<hr>
	<form action="deletePerson?deleteType=s" method="post">
		<input type="text" name="staffId" placeholder="staffId" /><br> <input
			type="submit" />
	</form>
	<P>The time on the server is ${serverTime}.</P>
</body>
</html>
