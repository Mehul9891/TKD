<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<html>
<link rel="stylesheet" type="text/css" href="default.css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request Details</title>
</head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript">

	function checkStatus(){
		
		if(document.getElementById("status").value == 'complete')
		{
			$('#FieldForCompleteStatus').show();
			$('#submitVendor').hide();
		}
		else
		{
			$('div#FieldForCompleteStatus').hide();
			$('#submitVendor').show();
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
	function submitVendor()
	{
		document.getElementById("operationFlag").value = "selectVendor";
		document.forms[0].submit();
		
	}
	
	
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

</script>
<body onload="disableFields();" >
<form method="post" id="pendingRequestDetails"  >

<div class="LosOverlayCurtain" id="curtain" >&nbsp;</div>
<iframe class="LosOverlay" id="popupFrame"  name="popupFrame"  ></iframe>

<h1>Pending Request Details</h1>
 <table>
		<tr>
			<td class="text1">Pending Request No :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.pend_sr_no">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" readonly="readonly"/>
				</spring:bind>
			</td>
			
			<td class="text1">Customer Id :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.custId">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" readonly="readonly"/>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			
			
			<td class="text1">Product :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.product">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" readonly="readonly"/>
				</spring:bind>
			</td>
			<td class="text1">Vendor Id :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.vendor_id">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" readonly="readonly"/>
				</spring:bind>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" id="selectVendor" value="SelectVendor"  />
			</td>
		</tr>
		
		<tr>
			<td class="text1">Product Details :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.product_details">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}"  size="30" readonly="readonly"/>
				</spring:bind>
			</td>
			
			<td class="text1">Problem :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.problem">
					<textarea rows="2" cols="50" id="${status.expression}" name="${status.expression}"  >${status.value}</textarea>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Request Date :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.date_of_request">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30" readonly="readonly"/>
				</spring:bind>
			</td> 
			
			<td class="text1">Remarks :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.pendingRequest.remarks">
					<textarea rows="2" cols="50"  id="${status.expression}" name="${status.expression}"  >${status.value}</textarea>
				</spring:bind>
			</td>
		</tr>
		<tr>
			<td class="text1">Status :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.status">
					<select  id="${status.expression}" name="${status.expression}"  onchange="checkStatus();"  >
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
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
			
			<td class="text1">Amount Collected (By Vendor) :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.sp_amt_col">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Amount Difference :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.cust_sp_diff">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
			
			<td class="text1">Our Share :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.our_share">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
				</spring:bind>
			</td>
		</tr>
		
		<tr>
			<td class="text1">Payment Received :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.payment_recvd">
					<select  id="${status.expression}" name="${status.expression}" >
						<option value="yes">Yes</option>
						<option value="no" selected="selected">No</option>
					</select>
				</spring:bind>
			</td>
			
			<td class="text1">Feedback :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.feedback">
					<textarea rows="2" cols="50" id="${status.expression}" name="${status.expression}" >${status.value}</textarea>
				</spring:bind>
			</td>
		</tr>
		
		 <tr>
			<td class="text1">Date of solving :</td>
			<td>
				<spring:bind path="pendingRequestDetailsForm.date_of_solving">
					<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}" size="30"/>
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
<table id="submitVendor">
	<tr>
		<td></td>
		<td><input type="button" value="Submit"  class="button" onclick="submitVendor();"/></td>
		<td><input type="button" value="Close"  class="button" onclick="closeScreen();"/></td>
		<td></td>
	</tr>
	</table>	
	<input type="hidden" id="operationFlag" name="operationFlag"  />
</form>	
</body>
</html>