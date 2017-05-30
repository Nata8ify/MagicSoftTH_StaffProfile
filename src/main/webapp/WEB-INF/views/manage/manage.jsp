<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!
	<form action="insertStaff" method="post">
		<input type="text" name="staffId" placeholder="staffId"/><br>
		<input type="text" name="name" placeholder="name"/><br>
		<input type="text" name="email" placeholder="email"/><br>
		<input type="text" name="tel" placeholder="tel"/><br>
		<input type="text" name="division" placeholder="division"/><br>
		<input type="submit" /> 
	</form>  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
