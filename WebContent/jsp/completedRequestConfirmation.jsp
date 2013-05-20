<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<%@include file="NBcommons.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Theek kar do.com</title>
</head>
<script type="text/javascript">
function closeframe(){
	alert("HI");
	
	parent.hidePopupFrame();
	
}

</script>
<body>
<form method="post">

<i class="headline">Request completed Successfully .</i>
<br>
<input type="button" value="Close" onclick = "closeframe();"/>

</form>
</body>
</html>