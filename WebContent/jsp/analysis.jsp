<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="commons.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analysis</title>
</head>
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var i =0;
      var size1 = '${size}';
      var j;	
     
      function drawChart() {
       /*  var data = google.visualization.arrayToDataTable([
          
          populateDetails()                                                
		 ['Task', 'Products Repaired Share'],
          
           ['TV',   5],
          ['Fridge',    2],
          ['Computer',  2],
          ['Washing Machine', 2],
          ['Laptop',   7],
          ['AC',  5],
          ['Mobile',  8]   
        ]); */
        
		
		var dataArray = new google.visualization.DataTable();
		dataArray.addColumn('string','product');
		dataArray.addColumn('number','Market Share');
		dataArray.addRows(size1-1);
		
		 for(i=0;i<size1-1;i++)
			{ 
				for(j=0;j<2;j++)
					{
						if(j == 0)
							dataArray.setValue(i, j, document.getElementById("Product"+i).value);
						else
							dataArray.setValue(i, j, parseInt(document.getElementById("ProductShare"+i).value));		
					}
			} 
        var options = {
          title: 'Products Repaired'
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(dataArray, options);
      }
    </script>

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var i =0;
      var size1 = '${size}';
      var j;	
      var lstData = '${lstproduct}';
      
      function drawChart() {
       /*  var data = google.visualization.arrayToDataTable([
          
          populateDetails()                                                
		 ['Task', 'Products Repaired Share'],
          
           ['TV',   5],
          ['Fridge',    2],
          ['Computer',  2],
          ['Washing Machine', 2],
          ['Laptop',   7],
          ['AC',  5],
          ['Mobile',  8]   
        ]); */
        
		
		var dataArray = new google.visualization.DataTable();
		dataArray.addColumn('string','product');
		dataArray.addColumn('number','Market Share');
		dataArray.addRows(size1-1);
		
	
		 for(i=0;i<size1-1;i++)
			{ 
				for(j=0;j<2;j++)
					{
						if(j == 0)
							dataArray.setValue(i, j, document.getElementById("Product"+i).value);
						else
							dataArray.setValue(i, j, parseInt(document.getElementById("ProductShare"+i).value));		
					}
			} 
        var options = {
          title: 'Products Repaired'
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
        chart.draw(dataArray, options);
      }
    </script>
  
	  
	
<body>
<h1>Analysis</h1>
<table>
	<tr><td>
 				<div id="chart_div" style="width: 700px; height: 500px;"></div>
		</td>
	</tr>
	<tr>
		<td>	
		<div id="chart_div1" style="width: 700px; height: 500px;"></div>
		</td>
	</tr>
</table>

	 <c:forEach items="${lstproduct}" var="productList" varStatus="loopStatus">
			<input type="hidden" id="Product${loopStatus.index}" name="Product${loopStatus.index}" value="${productList.codeMasterFieldName}" size="30"/>
			<c:if test="${size-1 eq loopStatus.index}">
				<input type="hidden" id="ProductListSize"  name="ProductListSize"  value="${loopStatus.index}"/>
			</c:if>
	</c:forEach>
	
	 <c:forEach items="${productMarketShare}" var="productShare" varStatus="loopStatus1">
			<input type="hidden" id="ProductShare${loopStatus1.index}" name="ProductShare${loopStatus1.index}" value="${productShare}" size="30"/>
			<c:if test="${size-1 eq loopStatus1.index}">
				<input type="hidden" id="ProductShareSize"  name="ProductShareSize"  value="${loopStatus1.index}"/>
			</c:if>
	</c:forEach>
	

</body>
</html>