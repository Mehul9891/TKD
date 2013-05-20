<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="NBcommons.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Add</title>
</head>
<body>
<jsp:include page="commons.jsp"></jsp:include>
<table width="100%">
				<tr class="header">
				<td >Title</td>
				<td >Type</td>
				<td >Vacancy for</td>
				<td >Rent</td>
							
			</tr>
	
			<c:forEach var="lstPostDetails" items="viewPostForm.lstPostDetails">
					
			 <tr class="header">
				<%-- <td ><c:out value="${lstPostDetails.gender}"></c:out> </td> --%>
				<td ><c:out value="${lstPostDetails.type}"></c:out></td>
				<td ><c:out value="${lstPostDetails.vacancy}"></c:out></td>
				<td ><c:out value="${lstPostDetails.amount}"></c:out></td>
							
			</tr> 
			</c:forEach>

</table>

</body>
</html>