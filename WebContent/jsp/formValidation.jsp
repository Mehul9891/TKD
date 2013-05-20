<%--
	TITLE:	LOS FORM VALIDATION
	
	DESCRIPTION:
			CONTAINS LOGIC FOR VALIDATION OF FORM INPUT 
		
	OWNER:	TATA CONSULTANCY SERVICES LTD (FINANCIAL SERVICES DIVISION)
	AUTHOR:	SAMEER P KARVE [TCS # 337262]
	
	DEPENDENCIES:
	
	LINKED / CALLED BY:
		* SECURITY/HEAD.JSP
		
	LIMITATIONS:
		* ONLY 1 VALIDATION CLASS IS ALLOWED PER ELEMENT. NEEDS TO BE IMPROVED TO 'N' CLASSES
		* HINT & VALIDATION IS NOT WORKING TOGETHER. NEEDS TO BE FIXED
		
	CHANGE LOG ( PLEASE USE THIS SPACE TO DESCRIBE ANY CHANGES MADE TO THIS COMPONENT )
	-----------------------------------------------
	
	[IDC-337262]	|	[2011.11.22]	| REG EX MODIFIED BY BUSHRA. TEST LOGIC INVERTED BY BUSHRA
	[IDC-337262]	|	[2011.06.28]	| FIRST RELEASE
	
--%>

<script>
		function triggerHint(hintAnchor){
			if($(hintAnchor).hasClass("ValidStreetAddress")){
				LOSHint(hintAnchor, "Only earth addresses ;)");
			}
		}
		function triggerValidation(hintAnchor){
			<%-- BEGIN: [IDC-337262 | 2011.06.24] INPUT VALIDATIONS --%>
			
			/*
			if($(hintAnchor).hasClass("mandatoryText") && !$(hintAnchor).hasClass("calendarInput")){
				<%-- [IDC-337262 | 2011.06.27] BUG FIX FOR MANDATORY CALENDAR INPUT FIELDS --%>
				
				if ($(hintAnchor).val()=="" || $(hintAnchor).val()=="Select"){
					if($(hintAnchor).next().attr("class") != "LOSValidationErrorHint"){
						$(hintAnchor).after("<div class='LOSValidationErrorHint' style='color: red;'>Mandatory field cannot be left blank</div>");
					}
				}
				else{
					$(hintAnchor).next().remove();
				}				
			}
			else
			*/
			
			// BEGIN : NUMERIC VALIDATIONS
			
			if($(hintAnchor).hasClass("ValidPhone")){
				LOSValidation(hintAnchor, "Invalid phone",/^\d*[0-9]$/);
			}
			else if($(hintAnchor).hasClass("ValidLandlinePhone")){
				LOSValidation(hintAnchor, "Invalid phone",/^\d*[0-9]$/);
			}
			else if($(hintAnchor).hasClass("ValidMobilePhone")){
				LOSValidation(hintAnchor, "Invalid phone",/^\d*[0-9]$/);
			}
			else if($(hintAnchor).hasClass("ValidAge")){
				LOSValidation(hintAnchor, "Age range (0 to 120)",/^\d*[0-9]$/);
			}
			
			else if($(hintAnchor).hasClass("ValidCount")){
				LOSValidation(hintAnchor, "Incorrect figure",/^\d*[0-9]$/);
			}			
			else if($(hintAnchor).hasClass("OnlyNumber")){
				LOSValidation(hintAnchor, "Incorrect figure",/^\d*[0-9]$/);
			}
			
			else if($(hintAnchor).hasClass("ValidAmount")){
				LOSValidation(hintAnchor, "Invalid amount",/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/);
			}			
			else if($(hintAnchor).hasClass("OnlyDouble")){
				LOSValidation(hintAnchor, "Invalid amount",/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/);
			}
			
			else if($(hintAnchor).hasClass("ValidPostCode")){
				LOSValidation(hintAnchor, "Invalid postcode",/^\d*[0-9]$/);
			}
			else if($(hintAnchor).hasClass("ValidPercentage")){
				LOSValidation(hintAnchor, "Invalid percentage",/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/);
			}
			else if($(hintAnchor).hasClass("ValidYear")){
				LOSValidation(hintAnchor, "Must be in YYYY format",/^(19|20)\d{2}$/);
			}
			// END : NUMERIC VALIDATIONS
			
			else if($(hintAnchor).hasClass("ValidHumanName")){
				LOSValidation(hintAnchor, "Invalid name",/^\s*[a-zA-Z,\s]+\s*$/);
			}
			else if($(hintAnchor).hasClass("ValidIDNumber")){
				LOSValidation(hintAnchor, "Invalid ID",/^\s*[_a-zA-Z0-9,\s\-]+\s*$/);
			}
			else if($(hintAnchor).hasClass("ValidCIF")){
				LOSValidation(hintAnchor, "Invalid characters in sequence",/^\s*[_a-zA-Z0-9]+\s*$/);
			}
			else if($(hintAnchor).hasClass("ValidAlphaNumeric")){
				LOSValidation(hintAnchor, "Invalid characters in sequence",/^\s*[_a-zA-Z0-9,\s]+\s*$/);
			}			
			else if($(hintAnchor).hasClass("ValidSetupCode")){
				LOSValidation(hintAnchor, "Invalid characters in sequence",/^\s*[a-zA-Z0-9,_\.\s]+\s*$/);
			}			
			else if($(hintAnchor).hasClass("OnlyAlphanumeric")){
				LOSValidation(hintAnchor, "Enter Aplhanumeric data",/^\s*[a-zA-Z0-9,\s]+\s*$/);
			}
			else if($(hintAnchor).hasClass("ValidStreetAddress")){
				LOSValidation(hintAnchor, "Invalid address",/^\s*[a-zA-Z0-9,\s]+\s*$/);
			}		
			else if($(hintAnchor).hasClass("ValidEmail")){
				LOSValidation(hintAnchor, "Invalid email",/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/);
			}
			else if($(hintAnchor).hasClass("ValidUrl")){
				LOSValidation(hintAnchor, "Invalid URL",/http:\/\/[A-Za-z0-9\.-]{3,}\.[A-Za-z]{3}/);
			}			
						
			<%-- END: [IDC-337262 | 2011.06.24] INPUT VALIDATIONS --%>			
		}
		
		<%-- [IDC-337262 | 2011.06.21 ] STANDARD INPUT VALIDATION ERROR HINTS --%>
		function LOSValidation(hintAnchor, hintText, rxp){
			var str = $(hintAnchor).val();
			var rxpObj = new RegExp (rxp);

			/*if (rxpObj.test(str) == true){
				alert(hintText);
				$(hintAnchor).after("<div class='LOSValidationErrorHint'><span style='color: red;'>&nbsp;"+ hintText +"&nbsp;</span></div>");
				$(hintAnchor).val('');
			}*/
			
			if (rxpObj.test(str) == false){
				if ($(hintAnchor).next().attr("class") != "LOSValidationErrorHint"){
					$(hintAnchor).after("<div class='LOSValidationErrorHint'><span style='color: red;'>&nbsp;"+ hintText +"&nbsp;</span></div>");
				}	
				$(hintAnchor).val('');				
			}		
			
			$(hintAnchor).focus(function(){
				if ($(hintAnchor).next().attr("class") == "LOSValidationErrorHint"){
					$(hintAnchor).next().fadeOut(function(){
						$(hintAnchor).next().remove();
					});
				}
			});
			
		}
		
		<%-- [IDC-337262 | 2011.06.21 ] STANDARD INPUT FIELD HINTS --%>
		function LOSHint(hintAnchor, hintText){
			$(hintAnchor).focus(function(){
				if($(this).next().attr("id") != "LOSHint"){
					$(this).after("<div id='LOSHint'><span style='font-weight: bold; background: Gold'>&nbsp;"+ hintText +"&nbsp;</span></div>");
				}
			});
			$(hintAnchor).focusout(function(){
				if($(this).next().attr("id") == "LOSHint"){
					$(this).next().remove();
				}
			});
		}
</script>