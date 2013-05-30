<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<%@include file="commons.jsp"  %>
<meta http-equiv="refresh" content="40">
<html>
<link rel="stylesheet" type="text/css" href="default.css"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payments</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	
	<%-- [IDC-337262 | 2011.07.22] CIF SEARCH OVERLAY is launched from page-specific function --%>
	
	
	$("#curtain").click(function(){
		$(this).toggle();
		$("#popupFrame").toggle();
		$("body").css("overflow", "auto");
		
		<%-- [IDC-337262 | 2011.08.05] CLEAR CONTENTS OF OVERLAY FRAME --%>
		$("#popupFrame").attr("src", "about:blank");		
	});
});
	function showRequestDetails(paymentID){
	
		$("#curtain").toggle();		
		
		$("#popupFrame").toggle();
		$("#popupFrame").focus();
		 $("#popupFrame").attr("src", "paymentDetails.htm?PaymentID="+paymentID); 
		//$("body").css("overflow", "hidden");
		$("body").css("overflow", "auto");	  
	}
	
	function hidePopupFrame(){
		$("#curtain").toggle();
		$("#popupFrame").toggle();	
		
		<%-- [IDC-337262 | 2011.08.05] CLEAR CONTENTS OF OVERLAY FRAME --%>
		$("#popupFrame").attr("src", "about:blank");
		$("body").css("overflow", "auto");
		document.forms[0].submit();
	}




</script>

<body>
<form method="post"> 


<div class="LosOverlayCurtain" id="curtain" >&nbsp;</div>
<iframe class="LosOverlay" id="popupFrame"  name="popupFrame"  ></iframe>
<table width="100%" class="datagrid">
	<thead>
		<tr class="header">
			<td  width="13%">Payment Id</td>
			<td width="13%">Vendor Id</td>
			<td width="13%">Customer Catered Date</td>
			<td  width="13%">Amount Collected</td>
			<td  width="13%">Our Share</td>
			<td  width="20%">Feedback</td>
			<td  width="10%">Payment Received</td>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${paymentsForm.lstCompletedRequest ne null}">
		<c:forEach begin="0" end="${size}"   varStatus="loopStatus">
	
			<tr>
				
				<td align="center" style="text-decoration: underline;">
					<a href="#"  onclick="showRequestDetails('<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].compt_sr_no}"/>');"><c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].compt_sr_no}"/></a>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].vendor_id}"></c:out>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].date_of_solving}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].cust_amt_col}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].our_share}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].feedback}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${paymentsForm.lstCompletedRequest[loopStatus.index].payment_recvd}"></c:out>
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

</form>
</body>
</html>