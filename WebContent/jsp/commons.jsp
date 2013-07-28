
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags"%>
<%@page import="com.nb.constants.Constants" %>

<% String companyNameStr =  Constants.CompanyName;
String companyShortName =  Constants.CompanyShortName;
String companyAdd1 =  Constants.CompanyAdd1;
String companyAdd2 =  Constants.CompanyAdd2;
String companyAdd3 =  Constants.CompanyAdd3;
String companyAdd4 =  Constants.CompanyAdd4;
String companyAdd5 =  Constants.CompanyAdd5;
String companyContactNo =  Constants.CompanyContactNo;
%>
<html>
<head>
 <script  src="/js/jquery.tablesorter.js"></script>
<script  src="/js/jquery-latest.js"></script>  

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="shortcut icon" href="images/CompanyLogo.jpg" type="image"  />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">
  $(function() {
    $( ".datepicker" ).datepicker();
  });

  
  </script>

</head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<script type="text/javascript">

</script>
<body>
<div class="top_header"><%-- <i ><%=companyNameStr%></i> --%><img alt="" src="images/CompanyLogo.jpg" hspace="20" width="80" height="80">
<br>
<ul class="inline" id="login" align="center"  >
			<li ><a href="login.htm"  >Register</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="pendingComplaints.htm" " >Pending Complaints</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="registerVendor.htm"  > Vendor</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="payments.htm" >Payments</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="sendEmail.htm">Send Email</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="codeMaster.htm"  >Code Master</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="analysis.htm"  >Statistics</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="exportDb.htm"  >Export Data</a></li>&nbsp;&nbsp;&nbsp;
			<li ><a href="contact.htm"  >Contact Us</a></li>
	</ul>	
	

</div>
</body>


</html>