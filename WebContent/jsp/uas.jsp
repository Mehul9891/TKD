<%--
	TITLE:	LOS UNIFIED ALERT SYSTEM (LOS-UAS)
	
	DESCRIPTION:
			CONTAINS LOGIC FOR FORM VALIDATION, FORM SUBMISSION, ALERTS, HINTS, HIGHLIGHTS, ETC
		
	OWNER:	TATA CONSULTANCY SERVICES LTD (FINANCIAL SERVICES DIVISION)
	AUTHOR:	SAMEER P KARVE [TCS # 337262]
	
	DEPENDENCIES:
		* JQUERY FOLDER SPECIFIED IN THE CODE BELOW
		* PROGRESS BAR GRAPHIC SPECIFIED IN LOSProgress
		* SAVE SUCCESS / FAILURE FLAGS PASSED FROM CONTROLLERS
		* CLASS NAMES DEFINED ON INPUT FIELDS IN THE FORMS
	
	LINKED / CALLED BY:
		* SECURITY/HEAD.JSP
		* JS/UWR-COMMON
		* JS/REF-COMMON
		* JS/REF/REF-COMMON
	
	CHANGE LOG ( PLEASE USE THIS SPACE TO DESCRIBE ANY CHANGES MADE TO THIS COMPONENT )
	-----------------------------------------------

 	[IDC-337262]	|	[2011.06.27]	| BUG FIX FOR MANDATORY CALENDAR INPUT FIELDS
 	[IDC-337262]	| 	[2011.06.27]	| REMOVED OLD CALENDAR ICON FROM ALL PAGES (TEMPORARY FIX)	
	[IDC-337262]	|	[2011.06.24]	| FIRST RELEASE
	
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%-- BEGIN: [IDC-337262 | 2011.06.10] JQUERY AND JQUERY-UI UPDATED --%>
	<%-- JQUERY STYLESHEET BELOW IS CONFLICTING WITH THE OTHER STYLESHEETS AND NEEDS TO BE PREVENTED FROM BEING APPLIED TO MORT-MAIN --%>
	
	<%-- [IDC-337262 | 2011.11.18 | A1110R05] MOVED TO jsp/include.jsp AND jsp/includes.jsp --%>
	<%--
	<link type="text/css" href="../js/jquery-ui-1.8.13.custom/css/redmond/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
	
	<script language="JavaScript" type="text/javascript" src="../js/jquery-ui-1.8.13.custom/js/jquery-1.5.1.min.js" ></script>
	<script language="JavaScript" type="text/javascript" src="../js/jquery-ui-1.8.13.custom/js/jquery-ui-1.8.13.custom.min.js" ></script>
	--%>
		
<%-- END: [IDC-337262 | 2011.06.10] JQUERY AND JQUERY-UI UPDATED --%>

<%-- BEGIN: [IDC-337262 | 2011.06.14] JQUERY-UI ENHANCEMENTS --%>
	
	<script type="text/javascript">
		//window.alert = LOSAlert;

		<%-- BEGIN : [IDC-337262 | 2011.11.17 | A1110R05] TO DISPLAY 'TODAY' IN CALENDAR AS CURRENT BUSINESS DATE --%>
		
		<%--
			THIS FUNCTION IS CALLED FROM WITHIN js/jquery-ui/development-bundle/ui/jquery-ui-1.8.13.custom.js
		--%>		
		
		function getBusinessDate(){
			return new Date(2012, 5,3);
			
			<%--
			return new Date(
				<fmt:formatDate value='${businessDate}' type='date', pattern="yyyy" />,
				<fmt:formatDate value='${businessDate}' type='date', pattern="MM" /> -1,
				<fmt:formatDate value='${businessDate}' type='date', pattern="dd" />			
			);
			--%>
		}
		<%-- END : [IDC-337262 | 2011.11.17 | A1110R05] TO DISPLAY 'TODAY' IN CALENDAR AS CURRENT BUSINESS DATE --%>
		
		progressImage = new Image();
		progressImage.src = "../img/los-progress.gif";
		
		$(document).ready(function(){
			
			$(".calendarInput").datepicker({
				changeMonth: true,
				changeYear: true,
				yearRange: '1920:2030',
				
				defaultDate: new Date(2012, 5,3)
								
				<%-- BEGIN : [IDC-337262 | 2011.11.17 | A1110R05] FOR DISPLAYING 'TODAY' AS CURRENT BUSINESS DATE --%>
				<%--
				defaultDate: new Date(
									<fmt:formatDate value='${businessDate}' type='date', pattern="yyyy" />,
									<fmt:formatDate value='${businessDate}' type='date', pattern="MM" /> -1,
									<fmt:formatDate value='${businessDate}' type='date', pattern="dd" />
									
							)
				--%>
				<%-- END : [IDC-337262 | 2011.11.17 | A1110R05] FOR DISPLAYING 'TODAY' AS CURRENT BUSINESS DATE --%>
				
			});
			
			<%-- [IDC-337262 | 2011.06.27] REMOVE OLD CALENDAR ICON FROM ALL PAGES (TEMPORARY FIX)  --%>
			$("img[src$='cal.gif']").each(function(){
				$(this).remove();
			});
			

			<%-- BEGIN : [IDC-337262 | 2011.10.25.1225 ] SEMANTIC VALIDATIONS --%>  			
			$("input[type='text']").focusout(function(){ 			
				/*
					FOLLOWING CONDITION HAS BEEN ADDED ONLY TO PREVENT THIS LOGIC FROM INTERFERING
					WITH EXISTING VALIDATION LOGIC THAT MAY BE PRESENT IN 'UNCONVERTED' PAGES
				*/
				if ($(this).hasClass("LOSInput")){
					triggerValidation($(this));
				}
			});
			<%-- END : [IDC-337262 | 2011.10.25.1225 ] SEMANTIC VALIDATIONS --%>
						
			<%-- BEGIN : [IDC-337262 | 2011.07.25] STANDARD ALERT FOR SAVE SUCCESS / FAILURE --%>
			<c:choose>
				<c:when test="${SAVE_SUCCESS == true || field=='Save'}">
						alert("Save operation successful");
				</c:when>
				<c:when test="${SAVE_FAILURE == true}">
						alert("An error occurred and your transaction has not been processed");
				</c:when>
			</c:choose>					
			<%-- END : [IDC-337262 | 2011.07.25] STANDARD ALERT FOR SAVE SUCCESS / FAILURE --%>
			
			<%--ADDED BY IDC-351556: FOR DYNAMIC SCREEN FIELDS:STARTS --%>
			$("#derivedApplicantParameterTableHeader").click(function(){
				$(".dynamicParameterRow").toggle();
			});
			<%--ADDED BY IDC-351556: FOR DYNAMIC SCREEN FIELDS:ENDS --%>	
			
			<%-- BEGIN : [IDC-337262 | 2011.11.28 | A1110R05] EXTRACTED FROM ANIMATIONS.JS --%>
			$('.datagrid1 tr:odd').addClass('odd');
			
			$('.datagrid2 tr:odd').addClass('odd');
			
		    $('.datagrid tbody tr:odd').addClass('odd');
		    <%-- END : [IDC-337262 | 2011.11.28 | A1110R05] EXTRACTED FROM ANIMATIONS.JS --%>
		});
		
		<%-- [IDC-337262 | 2011.06.20] STANDARD METHOD TO DISPLAY PROGRESS BARS THROUGHOUT THE APPLICATION --%>
		<%--
		function LOSProgress(percentCompletion){			
			$("body").prepend("<div id='LOSDialog' style='display:none; text-align:center'>Please wait while your request is being processed<br /><br /><img src='../img/los-progress.gif' /></div>");

			$("#LOSDialog").dialog({
				modal: true,
				title: "Progress Information",
				width: 400,
				height: 250,
				
				buttons: {
					"OK": function(){}
				}
			});			
		}
		--%>

		function preload(arrayOfImages) {  
			$(arrayOfImages).each(function () 
				{         
					$('<img />').attr('src',this).appendTo('body').css('display','none');     
				}); 
		}
		 
		// Usage: 
		preload(['../img/ajax-loader.gif']); 
		
		<%-- [IDC-337262 | 2011.06.20] STANDARD METHOD TO DISPLAY PROGRESS BARS THROUGHOUT THE APPLICATION --%>
		function LOSProgress(percentCompletion){
			<%-- THE PARAMETER 'percentCompletion' IS PROVIDED FOR FUTURE USE WHEN A DETERMINATE PROGRESS BAR IS IMPLEMENTED --%>			
			$("body").prepend("<img style='position:absolute;top:50%;left:50%;z-index: 20;' src='../img/ajax-loader.gif' />");

			$("#LOSDialog").dialog({
				modal: true,
				title: "Progress Information",
				width: 400,
				height: 250,
				
				buttons: {
					<%-- DISPLAY DEAD BUTTON --%>
					"OK": function(){}
				}
			});			
		}

		// [IDC-337262 | 2011.06.20 | FINAL ] STANDARD METHOD TO DISPLAY ALERTS THROUGHOUT THE APPLICATION
		function LOSAlert(displayMessage){
			alert(displayMessage);
			/*
			displayMessage = displayMessage.replace("/Please/g", "PLZ");
			
			$("body").prepend("<div id='LOSDialog' style='display:none;'>" + displayMessage + "</div>");
			
			$("#LOSDialog").dialog({
				modal: true,
				title: "Information",
				width: 400,
				
				buttons: {
					"OK": function(){$(this).dialog("close"); $(this).remove();}
				}
			});
			*/
		}
				
	</script>
	
	
	<%-- [IDC-337262 | 2011.06.21] SAVE SUCCESS / FAILURE --%>
	
	<%-- END: [IDC-337262 | 2011.06.14] JQUERY-UI ENHANCEMENTS --%>