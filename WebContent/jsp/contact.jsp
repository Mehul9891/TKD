<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="commons.jsp" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=companyNameStr%></title>
</head>
<body>
<form  method="post">
	

	<H1>Address Details</H1>

	<i2><b><%=companyNameStr%>,</b></i2><br>
		<i2><%=companyAdd1%></i2><br>
		<i2><%=companyAdd2%></i2><br>
		 <i2><%=companyAdd3%></i2>  <br>
		<i2><%=companyAdd4%></i2><br>
		<i2><%=companyAdd5%></i2><br>
	<br><br><br>	
	<H1>Contact Details</H1>
		<i2><b><%=companyContactNo%></b></i2><br>
		
	<div align="center" > 
			<jsp:include page="commonFooter.jsp"></jsp:include>
		</div>
</form>
	
</body>
</html>