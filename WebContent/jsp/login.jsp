<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

$(document).ready(function(){
	
	<%-- [IDC-337262 | 2011.07.22] CIF SEARCH OVERLAY is launched from page-specific function --%>
	$("#selectVendor").click(function(){
		$("#curtain").toggle();					
		$("#popupFrame").toggle();
		$("#popupFrame").attr("src", "selectVendor.htm");
		//$("body").css("overflow", "hidden");
		$("body").css("overflow", "auto");	
	});
	
	$("#curtain").click(function(){
		$(this).toggle();
		$("#popupFrame").toggle();
		$("body").css("overflow", "auto");
		
		<%-- [IDC-337262 | 2011.08.05] CLEAR CONTENTS OF OVERLAY FRAME --%>
		$("#popupFrame").attr("src", "about:blank");		
	});
});

	$(document).ready(function(){
		
		$('.datepicker').datepicker();
	});
	
	function hidePopupFrame(){
		$("#curtain").toggle();
		$("#popupFrame").toggle();	
		
		<%-- [IDC-337262 | 2011.08.05] CLEAR CONTENTS OF OVERLAY FRAME --%>
		$("#popupFrame").attr("src", "about:blank");
		$("body").css("overflow", "auto");	
	}

	function SearchResult()
	{
		document.getElementById("operationFlag").value = "SearchCustomer";
		document.forms[0].submit();
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Theek kar do.com</title>
</head>
<body>

<form  method="post">
<div class="LosOverlayCurtain" id="curtain" >&nbsp;</div>
<iframe class="LosOverlay" id="popupFrame"  name="popupFrame"  ></iframe>
		

<H1>Welcome to Theek kar do.com</H1>
	<table >
	
		<tr>
			<td class="text1">Phone No:</td>
			<td>
				<spring:bind path="loginForm.customer.mobile_no">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" maxlength="10"/>
				</spring:bind>
			</td>
			<td align="left">
				<input type="button" value="Search" onclick="SearchResult();" />
			</td>	
		</tr>
		<tr>
			<td class="text1">Name :</td>
			<td>
				<spring:bind path="loginForm.customer.name">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" />
				</spring:bind>
			</td>
		</tr>
		
		<tr><td class="text1">Email ID:</td>
			<td>
			<spring:bind path="loginForm.customer.emailId">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
			</td>
		</tr>
		
		
		<tr>
			<td class="text1">Customer Add:</td>
			<td>
				<spring:bind path="loginForm.customer.cust_address">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/></td>
				</spring:bind>
		</tr>
		
		<tr>
			<td class="text1">Zone :</td>
			<td>
				<spring:bind path="loginForm.customer.zone">
							<select id="${status.expression}" name="${status.expression}"  >
									<option></option>
									  <c:forEach items="${lstLocation}" var="locationDetails">
										<option value="${locationDetails.codeMasterFieldValue}" <c:if test="${status.value eq locationDetails.codeMasterFieldValue}"> selected </c:if> >${locationDetails.codeMasterFieldName}</option>
									 </c:forEach>	
							</select>				
				</spring:bind>
		</tr>
		
		<tr>
			<td class="text1">Pincode :</td>
			<td>
				<spring:bind path="loginForm.customer.pincode">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/></td>
				</spring:bind>
		</tr>
		
		<tr>
			<td class="text1">Repair Product :</td>
			<td>
				<spring:bind path="loginForm.customer.products_repaired">
					<select id="${status.expression}" name="${status.expression}" >
								<option></option>
							   <c:forEach items="${lstproduct}" var="productDetails">
								<option value="${productDetails.codeMasterFieldValue}" >${productDetails.codeMasterFieldName}</option>
								
								</c:forEach>	
					</select></td>
				</spring:bind>
		</tr>
		
		<tr>
			<td class="text1">Product Model :</td>
			<td>
				<spring:bind path="loginForm.product_model">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Problem :</td>
			<td>
				<spring:bind path="loginForm.problem">
					<textarea rows="2" cols="40"  id="${status.expression}" name="${status.expression}" value="${status.value}"></textarea>
				</spring:bind>
			</td>	
		</tr>
		
		<%-- <tr>
			<td class="text1">Date :</td>
			<td>
				<spring:bind path="loginForm.customer.created_date">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" class="datepicker"/></td>
				</spring:bind>
		</tr> --%>
		<tr>
			<td class="text1">Vendor :</td>
			<td>
				<spring:bind path="loginForm.vendor.vendor_id">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" />
				</spring:bind>
			</td>
			
			<td align="left"><input type="button" value="Select"  id="selectVendor"/></td>	
		</tr> 
		
		<tr>
			<td></td>
			<td><input type="submit"/></td>
		</tr>
	</table> 
	<input type="hidden" id="operationFlag" name="operationFlag"  />
	
	</form>
	
</body>

</html>