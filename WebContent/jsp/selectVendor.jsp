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
<title>Select Vendor</title>
</head>
<script type="text/javascript">
	
function closeScreen()
{
	parent.hidePopupFrame();
}

function selectVendor(vendorId)
{
	
	if(parent.document.getElementById("vendor.vendor_id") != null)
		{
		    parent.document.getElementById("vendor.vendor_id").value = vendorId;
		}
	else 
		{
		 parent.document.getElementById("pendingRequest.vendor_id").value = vendorId;
		}
	
	parent.hidePopupFrame();
	
}
</script>
<body>
<form method="post"> 
<table>
	<tr>
		<td width="15%" align="right" class="text1">
			Location : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="selectVendorForm.selectLocation">
							<select id="${status.expression}" name="${status.expression}" >
									<option></option>
									  <c:forEach items="${lstLocation}" var="locationDetails">
									  	<option value="${locationDetails.codeMasterFieldValue}" >${locationDetails.codeMasterFieldName}</option>
									 </c:forEach>	
							</select>				
				</spring:bind>
		</td>
		
		<td width="15%" align="right" class="text1">
			Repair Product : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="selectVendorForm.selectProduct">
					<select id="${status.expression}" name="${status.expression}" >
								<option></option>
							   <c:forEach items="${lstproduct}" var="productDetails">
									<option value="${productDetails.codeMasterFieldValue}" >${productDetails.codeMasterFieldName}</option>
								</c:forEach>	
					</select>
			</spring:bind>
		</td>	
		<td width="40" align="left">
			<input type="button" value="Search" onclick="document.forms[0].submit();">
		</td>
	</tr>

</table>
<br>
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
					<c:out value="${selectVendorForm.lstVendor[loopStatus.index].ownername}"></c:out>
					
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