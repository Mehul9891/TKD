<%@include file="NBcommons.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>No Brokerage</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	
    $('input#availDate').datepicker();
  });
  
$(document).ready(function() {
	
	 $('#back').click(function(){
		  $(document).src("/home.jsp");
		  document.form.submit();
	  });
  });

 
</script>
<body>
<form method="post">
<jsp:include page="commons.jsp"></jsp:include>
<div>
<table>
	<tr>
		<td class="label">For :</td> 
		<td>
		<spring:bind path="postForm.gender">
			<i class="text1">Male</i><input type="radio" id="${status.expression}" name="${status.expression}" value="Male"/>
			<i class="text1">Female</i><input type="radio" id="${status.expression}" name="${status.expression}" value="Female"/>
			<i class="text1">Family</i><input type="radio" id="${status.expression}" name="${status.expression}" value="Family"/>
		</spring:bind>
		</td>
	</tr> 
	<tr>
		<td class="label">Type :</td>
		<td>
		  <spring:bind path="postForm.type">	
			<select id="type" id="${status.expression}" name="${status.expression}" value="${status.value}">
			<option class="text1" selected value="Sharing">Sharing</option>
			<option class="text1" value="PG" >PG</option>
			<option class="text1" value="Rent">Rent</option>
			</select>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td class="label">Vacancy For :</td>
		<td class="text1">
			<spring:bind path="postForm.vacancy">	
				<input type="text" maxlength="2" id="${status.expression}" name="${status.expression}" value="${status.value}"/>persons
			</spring:bind>	
		</td>
	</tr>
	<tr>
		<td class="label">Amount :</td>
		<td class="text1">
			<spring:bind path="postForm.amount">	
			<input type="text" maxlength="6" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
			</spring:bind>
			
			<spring:bind path="postForm.amtType">	
			<select id="${status.expression}" name="${status.expression}" value="${status.value}">
				<option class="text1" value="Flat" >Flat</option>
				<option class="text1" value="Per Person">Per person</option>
			</select>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td class="label">Deposit :</td>
		<td class="text1">
		 	<spring:bind path="postForm.deposit">	
		 		<input type="text" maxlength="7" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
		 	</spring:bind>
		 </td>
	</tr>
	<tr>
		<td class="label">Address :</td>
		<td class="text1">
			<spring:bind path="postForm.add1">
				<input type="text" maxlength="30" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td class="label"></td>
		<td class="text1">
		<spring:bind path="postForm.add2">
			<input type="text" maxlength="30" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
		</spring:bind>	
		</td>	
	</tr>
	<tr>
		<td class="label">City :</td>
		<td class="text1">
		<spring:bind path="postForm.city">
			<select id="${status.expression}" name="${status.expression}" value="${status.value}">
			<option value="DH" class="text1">Delhi</option>
			<option value="MUM" class="text1">Mumbai</option>
			<option value="PUNE" class="text1">Pune</option>
			<option value="BN" class="text1">Banglore</option>
			</select>
		 </spring:bind>	
		</td>
	</tr>
	<tr>
		<td class="label">Available from Date :</td>
		<td class="text1">
		<spring:bind path="postForm.availDate">
			<input type="text" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
		</spring:bind>	
		</td>
	</tr>
	<!-- <tr>
		<td class="label">Alternative Phone No :</td>
		<td class="text1"><input type="text" id="altPhNo"/></td>
	</tr> -->
	<tr>
		<td class="label" style="vertical-align: text-top;">Amenities :</td>
		<td class="text1">
		<spring:bind path="postForm.Inhouse_chkbox">
						
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Air Conditioned">Air Conditioned<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Intercom Facility">Intercom Facility<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Internet Wi-Fi Connectivity">Internet Wi-Fi Connectivity<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Piped Gas">Piped Gas
		</spring:bind>		
		</td>
		<td  class="text1">
				<spring:bind path="postForm.Inhouse_chkbox_1">
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Private Terrace/Garden">Private Terrace/Garden<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="RO Water System">RO Water System<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Servant Quarters">Servant Quarters<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Vaastu Compliant">Vaastu Compliant
				</spring:bind>
			</td>
	</tr>
	
	<tr>
		<td class="label" style="vertical-align: text-top;">External Amenities :</td>
		<td class="text1">
			<spring:bind path="postForm.ExtAmenities_chkbox">
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Banquet Hall">Banquet Hall<br>

				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Bar/Lounge">Bar/Lounge<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Cafeteria/Food Court">Cafeteria/Food Court<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Club House">Club House<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Conference Room">Conference Room<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="DTH Television Facility">DTH Television Facility<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Gymnasium">Gymnasium            
				</spring:bind>		
		  </td>
		<td  class="text1">
				<spring:bind path="postForm.ExtAmenities_chkbox_1">
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Laundry Service">Laundry Service<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Lift">Lift<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Maintenance Staff">Maintenance Staff<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Park">Park<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Power back Up">Power back Up<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Rain Water Harvesting">Rain Water Harvesting<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Reserved Parking">Reserved Parking
				</spring:bind>	
			</td>
		<td  class="text1">
				<spring:bind path="postForm.ExtAmenities_chkbox_2">
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Security">Security<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Service/Goods Lift">Service/Goods Lift<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Swimming Pool">Swimming Pool<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Visitor Parking">Visitor Parking<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Waste Disposal">Waste Disposal<br>
				
				<input type="checkbox" id="${status.expression}" name="${status.expression}" value="Water Storage">Water Storage
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td class="label">Contact No :</td>
		<td class="text1"><c:out value="${sessionScope.loginform.phoneNo}"/></td>
	</tr>
	<tr>
		<td class="label">Email Id :</td>
		<td class="text1"><c:out value="${sessionScope.loginform.emailId}"/></td>
	</tr>
	<tr>
	<td></td>
	<td><input type="submit" value="Submit" class="button"/>
	<input type="button" value="Back" class="button" id="back" onclick="back();"/>
	</td>
	</tr>
</table> 
</div>

</form>
</body>
</html>