<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.nb.constants.Constants" %>

<% String companyNameStr =  Constants.CompanyName;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker("option", "dateFormat", "dd-mm-yy");
  });
  </script>

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
<title>Customer Request</title>
</head>
<body>

<form  method="post">
<div class="LosOverlayCurtain" id="curtain" >&nbsp;</div>
<iframe class="LosOverlay" id="popupFrame"  name="popupFrame"  ></iframe>
		

<H1>Welcome to <%=companyNameStr%></H1>
	<table >
	
		<tr>
			<td class="text1">Phone No<r>*</r> :</td>
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
			<td class="text1">Name<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.customer.name">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" />
				</spring:bind>
			</td>
		</tr>
		
		<tr><td class="text1">Email ID<r>*</r> :</td>
			<td>
			<spring:bind path="loginForm.customer.emailId">
				<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
			</td>
		</tr>
		
		
		<tr>
			<td class="text1">Customer Add<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.customer.cust_address">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/></td>
				</spring:bind>
		</tr>
		
		<tr>
			<td class="text1">Zone<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.customer.zone">
							<select id="${status.expression}" name="${status.expression}"  >
									<option></option>
									  <c:forEach items="${lstLocation}" var="locationDetails">
										<option value="${locationDetails.codeMasterFieldValue}" <c:if test="${status.value eq locationDetails.codeMasterFieldValue}"> selected </c:if> >${locationDetails.codeMasterFieldName}</option>
									 </c:forEach>	
							</select>				
				</spring:bind>
				</td>
		</tr>
		
		<tr>
			<td class="text1">Pincode :</td>
			<td>
				<spring:bind path="loginForm.customer.pincode">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" maxlength="7"/>
				</spring:bind>
			</td>	
		</tr>
		
		<tr>
			<td class="text1">Repair Product<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.customer.products_repaired">
					<select id="${status.expression}" name="${status.expression}" >
								<option></option>
							   <c:forEach items="${lstproduct}" var="productDetails">
								<option value="${productDetails.codeMasterFieldValue}" >${productDetails.codeMasterFieldName}</option>
								
								</c:forEach>	
					</select>
				</spring:bind>
			</td>	
		</tr>
		
		<tr>
			<td class="text1">Product Company<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.productCompany">
					<select id="${status.expression}" name="${status.expression}" >
								<option></option>
							   <c:forEach items="${lstCompany}" var="productCompany">
								<option value="${productCompany.codeMasterFieldValue}" >${productCompany.codeMasterFieldName}</option>
								
								</c:forEach>	
					</select>
				</spring:bind>
			</td>	
		</tr>
		
		<tr>
			<td class="text1">Product Model<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.product_model">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Problem<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.problem">
					<textarea rows="2" cols="40"  id="${status.expression}" name="${status.expression}" value="${status.value}"></textarea>
				</spring:bind>
			</td>	
		</tr>
		<tr>
			<td class="text1">Date(DD-MM-YYYY)<r>*</r> :</td>
			<td>
				<spring:bind path="loginForm.issueRegDate">
					<input type="text" id="${status.expression}" name="${status.expression}" ></input>
				</spring:bind>	
			</td>	
		</tr>
		<%-- <tr>
			<td class="text1">Date :</td>
			<td>
				<spring:bind path="loginForm.customer.created_date">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" /></td>
				</spring:bind>
		</tr> --%>
		<tr>
			<td class="text1">Vendor :</td>
			<td>
				<spring:bind path="loginForm.vendor.vendor_id" >
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" readonly="readonly"/>
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