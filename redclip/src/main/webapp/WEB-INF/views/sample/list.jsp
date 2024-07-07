<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플목록</title>
</head>
<body>
	<table id="sample-list">
		<thead>
			<th>num</th>
			<th>name</th>
		</thead>
		<tbody>
			<c:choose>
			<c:when test="${not empty list }">
			<c:forEach items="${list }" var="sample">
				<td>${sample.num }</td>
				<td>${sample.name }</td>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<td colspan="2">테이블이 비어있음</td>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>