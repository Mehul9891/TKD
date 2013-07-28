<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<%@page import="com.nb.constants.Constants" %>

<% String CompanyName =  Constants.CompanyName;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Export Data</title>
</head>
<body>
<form method="post">
<jsp:include page="commons.jsp"></jsp:include>
<H1>Expor Data</H1>

<input type="submit" value="Export All Data">

</form>
</body>
</html>