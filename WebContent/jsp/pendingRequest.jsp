<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="commons.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Theek kar do.com</title>
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
	function showRequestDetails(requestID){
		var complaintID = requestID;
		/* document.getElementById("selectedReqId").value = complaintID;
		document.forms[0].action = "pendingRequestDetails.htm?ComplaintID="+complaintID; 
		document.forms[0].submit();  */
		
		$("#curtain").toggle();		
		
		$("#popupFrame").toggle();
		$("#popupFrame").focus();
		$("#popupFrame").attr("src", "pendingRequestDetails.htm?ComplaintID="+complaintID);
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
<form method="post" id="pendingRequest"> 
<div class="LosOverlayCurtain" id="curtain" >&nbsp;</div>
<iframe class="LosOverlay" id="popupFrame"  name="popupFrame"  ></iframe>
		

<table width="100%" class="datagrid">
	<thead>
		<tr class="header">
			<td  width="20%">Request Id</td>
			<td width="20%">Customer Id</td>
			<td  width="20%">Vendor Id</td>
			<td  width="20%">product</td>
			<td  width="20%">Date</td>
		</tr>
	</thead>
	
	<tbody>
	<c:if test="${pendingRequestForm.lstPendingRequest ne null}">
		<c:forEach begin="0" end="${size}"   varStatus="loopStatus">
	
			<tr>
				
				<td align="center" style="text-decoration: underline;">
					<a href="#"  onclick="showRequestDetails('<c:out value="${pendingRequestForm.lstPendingRequest[loopStatus.index].pend_sr_no}"/>');"><c:out value="${pendingRequestForm.lstPendingRequest[loopStatus.index].pend_sr_no}"/></a>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${pendingRequestForm.lstPendingRequest[loopStatus.index].custId}"></c:out>
					
				</td>
				<td align="center" class="text1">
					<c:out value="${pendingRequestForm.lstPendingRequest[loopStatus.index].vendor_id}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${pendingRequestForm.lstPendingRequest[loopStatus.index].product}"></c:out>
				</td>
				<td align="center" class="text1">
					<c:out value="${pendingRequestForm.lstPendingRequest[loopStatus.index].date_of_request}"></c:out>
				</td>
			</tr>
			
		</c:forEach>
	</c:if>
		
	</tbody>
</table>
	<spring:bind path="pendingRequestForm.selectedReqId">
				<input type="hidden" id="${status.expression}" name="${status.expression}" value="${status.value}" />
	</spring:bind>
</form>
</body>
</html>