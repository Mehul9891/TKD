<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%><html>
<html>
<link rel="stylesheet" type="text/css" href="default.css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Theek kar do.com</title>
</head>
<script type="text/javascript">
	
function closeScreen()
{
	parent.hidePopupFrame();
}

function selectVendor(vendorId)
{
	parent.document.getElementById("vendor.vendor_id").value = vendorId;
	parent.hidePopupFrame();
	
}
</script>
<body>
<form method="post"> 
<table width="100%" class="datagrid">
	<thead>
		<tr class="header">
			<td  width="20%">ID</td>
			<td width="20%">Name</td>
			<td  width="20%">Contact NO</td>
			<td  width="20%">Area</td>
			<td  width="20%">Products Catered</td>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${selectVendorForm.lstVendor ne null}">
		<c:forEach begin="0" end="${size}"   varStatus="loopStatus">
	
			<tr>
				
				<td align="center" style="text-decoration: underline;">
					<a href="#"  onclick="selectVendor('<c:out value="${selectVendorForm.lstVendor[loopStatus.index].vendor_id}"/>');"><c:out value="${selectVendorForm.lstVendor[loopStatus.index].vendor_id}"/></a>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].name}"></c:out>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].mobile_no}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].catered_products}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].zone}"></c:out>
				</td>
			</tr>
			
		</c:forEach>
	</c:if>
		<%-- 
		<c:forEach items="selectVendorForm.lstVendor"  varStatus="loopStatus">
			<tr>
				
				<td align="center" style="text-decoration: underline;">
					<a href="#"  onclick="selectVendor('<c:out value="${selectVendorForm.lstVendor[loopStatus.index].vendor_id}"/>');"><c:out value="${selectVendorForm.lstVendor[loopStatus.index].vendor_id}"/></a>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].name}"></c:out>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].mobile_no}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].catered_products}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].zone}"></c:out>
				</td>
			</tr>
		</c:forEach> --%>
		
	</tbody>
</table>

<input type="button" value="Close" id ="CloseScreen" onclick="closeScreen();"/>
</form>
</body>
</html>