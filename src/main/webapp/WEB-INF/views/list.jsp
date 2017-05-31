<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Magic Software Staffs Explorer</title>
</head>
<body>
	<table cellpadding="10px">
	<thead>
		<tr>
			<th></th>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Tel</th>
			<th>Division</th>
			<th>Manager</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${staffs}" var="staff">
			<tr>
				<td>${staff.protraitPath}</td>
				<td>${staff.staffId}</td>
				<td>${staff.name}</td>
				<td>${staff.email}</td>
				<td>${staff.tel}</td>
				<td>${staff.division}</td>
				<td><a href="searchMngsStaff?managerId=${staff.hostManagerId}">${staff.hostManagerName}</a></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
</body>
</html>