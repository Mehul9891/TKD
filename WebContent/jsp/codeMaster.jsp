<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="commons.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Theek kar do.com</title>
</head>
<body>
<form method="post">	
	<h1>Code Master</h1>

	<table>
		<tr>
				<td>Code Master Syntex :</td>
				<td>
					<spring:bind path="codeMasterForm.codeMasterSyntex">
							<select id="${status.expression}" name="${status.expression}" >
								<option></option>
							   <c:forEach items="${lstCodeMaster}" var="masterDetails">
								<option value="${masterDetails.codeMasterFieldValue}" >${masterDetails.codeMasterFieldName}</option>
								
								</c:forEach>	
							</select>
					</spring:bind>
				</td>
		</tr>
		<tr>	
				<td>Code Master Field Name :</td>
				<td>
					<spring:bind path="codeMasterForm.newCodeMasterName">
							<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
					</spring:bind>
				</td>
		</tr>
		
		<tr>	
				<td>Code Master Field Value :</td>
				<td>
					<spring:bind path="codeMasterForm.newCodeMasterValue">
							<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
					</spring:bind>
				</td>
		</tr>
		<tr>	
				<td></td>
				<td>
					<input type="submit"/>
				</td>
		</tr>


	</table>
</form>
</body>
</html>