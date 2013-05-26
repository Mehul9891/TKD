<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="default.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Theek kar do.com</title>
</head>
<body>
<form method="post">

<h1>Payment Details</h1>
<table>
	<tr>
		<td class="text1">
			<h2>Complaint Details</h2>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Complain Id : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.compt_sr_no">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Product : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.product">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Product Details : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.product_details">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Problem : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.problem">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Amount Collected : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.cust_amt_col">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Date of Resolve : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.date_of_solving">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Time of Resolve : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.time_of_solving">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr></tr>
	<tr>
		<td class="text1">
			<h2>Customer Details</h2>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Customer Id : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.custId">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Customer Name : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.name">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Contact No : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.mobile_no">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Customer EmailId : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.emailId">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Customer Address : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.cust_address">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			 Zone : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.zone">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Pincode : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.customer.pincode">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	
	<tr></tr>
	<tr>
		<td class="text1">
			<h2>Vendor Details</h2>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Vendor Id : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.vendor_id">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			 Company : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.companyName">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Owner Name : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.ownername">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			  Contact No : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.mobile_no">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Address : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.address">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>	
	
	<tr>
		<td width="15%" align="right" class="text1">
			  Zone : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.zone">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		<td width="15%" align="right" class="text1">
			Pincode : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.vendor.pincode">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>	
	
	<tr></tr>
	<tr>
		<td class="text1">
			<h2>Payment Details</h2>
		</td>
	</tr>
	<tr>
		<td width="15%" align="right" class="text1">
			Amount Received (Customer) : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.cust_amt_col">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		
		<td width="15%" align="right" class="text1">
			Amount Received (By Vendor) : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.sp_amt_col">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	
	<tr>
		<td width="15%" align="right" class="text1">
			Difference in Amount : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.cust_sp_diff">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
		
		<td width="15%" align="right" class="text1">
			Our Share : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.our_share">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
			</spring:bind>
		</td>
	</tr>
	
	<tr>
		<td width="15%" align="right" class="text1">
			Payment Received : 
		</td>
		<td width="15%" align="left">
			<spring:bind path="paymentDetailsForm.completedRequest.payment_recvd">
							
					<select  id="${status.expression}" name="${status.expression}"  >
						<option value="yes" <c:if test="${status.value eq 'yes'}"> selected </c:if>>Yes</option>
						<option value="no" <c:if test="${status.value eq 'no'}"> selected </c:if>>No</option>
					</select>			
			</spring:bind>
		</td>
		
		
	</tr>
	
	<tr>
		<td width="15%" >
		</td>
		<td width="15%" align="left">
			<input type="submit" value="Submit" class="button" >
		</td>
		
		
	</tr>
</table>



</form>
</body>
</html>