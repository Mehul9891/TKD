<%@page import="org.apache.catalina.connector.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="commons.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Statistics</title>
</head>
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var i =0;
      var size = '${size}';
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
		dataArray.addRows(size-0);
		
		 for(i=0;i<size-0;i++)
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
      var size = '${size}';
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
		dataArray.addRows(size-0);
		
	
		 for(i=0;i<size-0;i++)
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
  
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var i =0;
      var size1 = '${size1}';
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
		dataArray.addColumn('string','zone');
		dataArray.addColumn('number','Market Share');
		dataArray.addRows(size1-0);
		
		 for(i=0;i<size1-0;i++)
			{ 
				for(j=0;j<2;j++)
					{
						if(j == 0)
							dataArray.setValue(i, j, document.getElementById("Zone"+i).value);
						else
							dataArray.setValue(i, j, parseInt(document.getElementById("ZoneMarketShare"+i).value));		
					}
			} 
        var options = {
          title: 'Zonal Market Share'
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
        chart.draw(dataArray, options);
      }
    </script>

 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var i =0;
      var size1 = '${size1}';
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
		dataArray.addRows(size1-0);
		
	
		 for(i=0;i<size1-0;i++)
			{ 
				for(j=0;j<2;j++)
					{
						if(j == 0)
							dataArray.setValue(i, j, document.getElementById("Zone"+i).value);
						else
							dataArray.setValue(i, j, parseInt(document.getElementById("ZoneMarketShare"+i).value));		
					}
			} 
        var options = {
          title: 'Products Repaired'
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
        chart.draw(dataArray, options);
      }
    </script>
	  
	
<body>
<h1>Statistics</h1>
<table>
	<tr>
		<td>
 				<div id="chart_div" style="width: 700px; height: 500px;"></div>
		</td>
		<td>	
			<div id="chart_div1" style="width: 700px; height: 500px;"></div>
		</td>
	</tr>
	<tr>
		<td>
 				<div id="chart_div2" style="width: 700px; height: 500px;"></div>
		</td>
		<td>	
				<div id="chart_div3" style="width: 700px; height: 500px;"></div>
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
	
	 <c:forEach items="${lstZone}" var="zoneNameList" varStatus="loopStatus2">
			<input type="hidden" id="Zone${loopStatus2.index}" name="Zone${loopStatus2.index}" value="${zoneNameList.codeMasterFieldName}" size="30"/>
			<c:if test="${size-1 eq loopStatus2.index}">
				<input type="hidden" id="ZoneListSize"  name="ZoneListSize"  value="${loopStatus2.index}"/>
			</c:if>
	</c:forEach>
	
	<c:forEach items="${zonalMarketShare}" var="ZoneMarketShare" varStatus="loopStatus3">
			<input type="hidden" id="ZoneMarketShare${loopStatus3.index}" name="ZoneMarketShare${loopStatus3.index}" value="${ZoneMarketShare}" size="30"/>
			<c:if test="${size-1 eq loopStatus1.index}">
				<input type="hidden" id="ZoneMarketShareSize"  name="ZoneMarketShareSize"  value="${loopStatus3.index}"/>
			</c:if>
	</c:forEach>
	

</body>
</html>