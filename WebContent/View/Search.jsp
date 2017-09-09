<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
<script type="text/javascript">

		var name = document.myform.name.value;
		
		function Search()
			{
			var xhttp;
			var name = document.myform.name.value;
			
			var url="SearchController?name="+name;
			
			if (window.XMLHttpRequest)
				{
					xhttp = new XMLHttpRequest();
				}
			else
			{
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		
		
			xhttp.onreadystatechange = function() 
			{
				if (xhttp.readyState == 4)
					{
						var data = xhttp.responseText;
						document.getElementById("mySearch").innerHTML = data;
					}
				
			}
			
			xhttp.open("POST",url,true);
			xhttp.send();
		
	}

</script>

</head>
<body>
<form name="myform">
	<input type ="text" name="search"/>
	<input type ="button" onclick="Search()" value = "Search"/>
</form>
<div id=""></div>
</body>
</html>