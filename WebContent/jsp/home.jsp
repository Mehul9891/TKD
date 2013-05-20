<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>No Brokerage</title>
</head>
<body>
<jsp:include page="commons.jsp"></jsp:include>
<br>
<i class="headline">Thank you For Visiting '<c:out value="${sessionScope.loginform.customer.name}"/>'.</i>

</body>
</html>