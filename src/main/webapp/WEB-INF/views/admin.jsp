

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <!-- just for title -->
    <html>
   		 <title> Admin </title>
    </html>
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
 <div class="container-wrapper">
 	<div class="container"> 
	
		<div class = "page-header">
			<h1>Administrator Page</h1>
			
			<p class = "lead">Adminstrator</p>
		</div>
		
		<c:if test="${pageContext.request.userPrincipal.name !=null}">
			<h2>
				Welcome: ${pageContext.request.userPrincipal.name} | <a href= "<c:url value = "/login?logout" />" >Logout</a>
			</h2>
		
		</c:if> 
		<h3>
			<a href = "<c:url value="/admin/productInventory" /> ">Product Inventory</a>
		</h3>
		
		<p> View and Modify the Product Inventory </p>
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 