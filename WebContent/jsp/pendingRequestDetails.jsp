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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript">

	function checkStatus(){
		
		if(document.getElementById("status").value == 'complete')
		{
			$('#FieldForCompleteStatus').show();
		}
		else
		{
			$('div#FieldForCompleteStatus').hide();
		}	
	}
	
	function disableFields(){
		$('#FieldForCompleteStatus').hide();
	}
	
	function closeScreen()
	{
		parent.hidePopupFrame();
		
	}
	function submitForm(){
		
		document.forms[0].submit();
		
	}
	
</script>
<body onload="disableFields();" >
<form method="post" id="pendingRequestDetails"  >
<h1>Pending Request Details</h1>
 <table>
		<tr>
			<td class="text1">Pending Request No :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.pend_sr_no">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
			
			<td class="text1">Customer Id :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.custId">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Vendor Id :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.vendor_id">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
			
			<td class="text1">Product :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.product">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Product Details :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.product_details">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
			
			<td class="text1">Problem :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.problem">
					<textarea rows="2" cols="50" type="text" id="${status.expression}" name="${status.expression}"  >${status.value}</textarea>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Request Date :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.date_of_request">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td> 
			
			<td class="text1">Remarks :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.remarks">
					<textarea rows="2" cols="50" type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" ></textarea>
				</spring:bind>
			</td>
		</tr>
		<tr>
			<td class="text1">Status :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.status">
					<select type="text" id="${status.expression}" name="${status.expression}"  onchange="checkStatus();"  >
						<option value="pending">Pending</option>
						<option value="complete">Complete</option>
					</select>
				</spring:bind>
			</td>
		</tr>
		
	</table> 
<div id="FieldForCompleteStatus">
	<h1>Complete Status Details</h1>
	<table>
		<tr>
			<td class="text1">Amount Collected (From Customer) :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.cust_amt_col">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
			
			<td class="text1">Amount Collected (By Vendor) :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.sp_amt_col">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Amount Difference :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.cust_sp_diff">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
			
			<td class="text1">Our Share :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.our_share">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Payment Received :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.payment_recvd">
					<select type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" >
						<option value="yes">Yes</option>
						<option value="no" selected="selected">No</option>
					</select>
				</spring:bind>
			</td>
			
			<td class="text1">Feedback :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.feedback">
					<textarea rows="2" cols="50" type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" ></textarea>
				</spring:bind>
			</td>
		</tr>
		
		 <tr>
			<td class="text1">Date of solving :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.date_of_solving">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" />
				</spring:bind>
			</td>
		</tr> 
		
		
	</table> 
	<table>
	<tr>
		<td></td>
		<td><input type="button" value="Submit"  class="button" onclick="submitForm();"/></td>
		<td><input type="button" value="Close"  class="button" onclick="closeScreen();"/></td>
		<td></td>
	</tr>
	</table>	
</div>
</form>	
</body>
</html>