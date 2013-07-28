<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>

<%@ include file="commons.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title >Register Vendor</title>

</head>
<script type="text/javascript">
var strProductList;
	function addProductToList(product,productValue)
	{
		
		 var checkbox = document.getElementById(product);

		if(checkbox.checked)
			{
				strProductList = document.getElementById("vendor.catered_products").value;
				strProductList = productValue+", "+strProductList;
				document.getElementById("vendor.catered_products").value = strProductList;
				
			}
		else{
			strProductList = strProductList.replace(productValue+",","");
			document.getElementById("vendor.catered_products").value = strProductList;
			
		}
	}

</script>
<body>
<form  method="post">
<H1>Register Vendor</H1>
	<table >
	<tr>
			<td class="text1">Company Name<r>*</r> :</td>
			<td>
				<spring:bind path="vendorForm.vendor.companyName">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}"  size="30"/>
				</spring:bind>
			</td>
		</tr>
		<tr>
			<td class="text1">Office Name<r>*</r> :</td>
			<td>
				<spring:bind path="vendorForm.vendor.officeName">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" />
				</spring:bind>
			</td>
		</tr>
	
	
		<tr>
			<td class="text1">Owner Name<r>*</r> :</td>
			<td>
				<spring:bind path="vendorForm.vendor.ownername">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" />
				</spring:bind>
			</td>
		</tr>
		
		<tr><td class="text1">Mobile No<r>*</r> :</td>
			<td>
			<spring:bind path="vendorForm.vendor.mobile_no">
				<textarea rows="2" cols="30"  id="${status.expression}" name="${status.expression}" value="${status.value}" ></textarea>			</spring:bind>
			</td>
		</tr>
		<tr><td class="text1">Address<r>*</r> :</td>
			<td>
			<spring:bind path="vendorForm.vendor.address">
				<textarea rows="2" cols="30"  id="${status.expression}" name="${status.expression}" value="${status.value}" ></textarea>
			</spring:bind>
			</td>
		</tr>
		
		<tr><td class="text1">Products Catered<r>*</r> :</td>
			<td>
			<spring:bind path="vendorForm.vendor.catered_products">
				
				<c:forEach items="${lstproduct}"  var="productDetails" varStatus="loopStatus">
							
								<input type="checkbox" id="${productDetails.codeMasterFieldName}" name="${productDetails.codeMasterFieldName}" value="${productDetails.codeMasterFieldValue}" onchange="addProductToList('<c:out value="${productDetails.codeMasterFieldName}"/>','<c:out value="${productDetails.codeMasterFieldValue}"/>');"><t class="text1">${productDetails.codeMasterFieldName}</t>&nbsp;&nbsp;&nbsp;
				</c:forEach>
				
				<input type="hidden" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				
			</spring:bind>
			</td>
		</tr>
		
		<tr><td class="text1">No of Technicians<r>*</r> :</td>
			<td>
				<spring:bind path="vendorForm.vendor.no_of_technicians">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
		</tr>
		<tr><td class="text1">Pincode :</td>
			<td>
			<spring:bind path="vendorForm.vendor.pincode">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
			</td>
		</tr>
		<tr><td class="text1">Zone<r>*</r> :</td>
			<td>
			<spring:bind path="vendorForm.vendor.zone">
							<select id="${status.expression}" name="${status.expression}">
									<option></option>
									  <c:forEach items="${lstLocation}" var="locationDetails">
										<option value="${locationDetails.codeMasterFieldValue}" >${locationDetails.codeMasterFieldName}</option>
									 </c:forEach>	
							</select>		
							
			</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" />
			</td>
		</tr>
</table>

<div align="center" > 
			<jsp:include page="commonFooter.jsp"></jsp:include>
		</div>
</form>
		
</body>
</html>