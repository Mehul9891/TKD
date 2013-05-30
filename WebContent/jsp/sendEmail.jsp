<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="commons.jsp" %>
<html>
<link rel="stylesheet" type="text/css" href="default.css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send Mail</title>
</head>
<body>
<form  method="post">
	

<H1>Send Email</H1>
	<table >
		<tr>
			<td class="text1">Email ID :</td>
			<td>
				<spring:bind path="sendEmailForm.emailId">
				<input type="text" size ="30" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
		</tr>
		
		<tr><td class="text1">Subject:</td>
			<td>
			<spring:bind path="sendEmailForm.subject">
				<input type="text" size ="50" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
			</spring:bind>
			</td>
		</tr>
		<tr>
			<td class="text1">Message:</td>
			<td>
				<spring:bind path="sendEmailForm.message">
				<textarea rows="4" cols="50" id="${status.expression}" name="${status.expression}" value="${status.value}"></textarea>
				</spring:bind>
		</tr>
		
		
		<tr>
			<td></td>
			<td><input type="submit"/></td>
		</tr>
	</table> 
	
	
	</form>
	
</body>
</html>