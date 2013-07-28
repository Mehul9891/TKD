<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<html>

<%-- <%
response.sendRedirect("login.htm");
%> --%>
<head>
<link rel="shortcut icon" href="images/CompanyLogo.jpg" type="image"  />
<title>Register Complaint</title>
</head>
<body>
<form method="post">
<table>
	<tr>
		
			<jsp:include page="jsp/commons.jsp"></jsp:include>
		
	</tr>
	<tr>
		
	
		<td width="100%" height="500px" style="vertical-align: text-top;">	 
			<div align="center" >
				
				<jsp:include page="jsp/login.jsp"></jsp:include>
					
					
			</div>
		</td>	
	</tr>
	
</table>
<div align="center" > 
			<jsp:include page="jsp/commonFooter.jsp"></jsp:include>
		</div>
</form>
</body>