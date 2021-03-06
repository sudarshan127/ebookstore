<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <!-- just for title -->
    <html>
   		 <title> Product List </title>
    </html>
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
 <div class="container-wrapper">
 	<div class="container"> 
	
		<div class = "page-header">
			<h1>Available Books</h1>
			
			<p class = "lead">These are all the available books we have in our store </p>
			
			<table class="table table-hover">
			  <thead class="thead-dark">
			    <tr>
				 <!--  <th scope="col">ID</th>  -->
			      <th scope="col">Name</th>
			      <th scope="col">Category</th>
			      <th scope="col">Author Name</th>
			      <th scope="col">Condition</th>
			      <th scope="col">Price</th>
			      <th scope="col">Publication</th>
			      <th scope="col">Unit In Stock</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  
			  <c:forEach items="${products}" var="product">
			  <tbody>
			    <tr>
			   <!--     <th>${product.id}</th>    increase number from 1 to 2 for another row -->
			      <td>${product.name}</td>
			      <td>${product.category}</td>
			      <td>${product.authorName}</td>
			      <td>${product.condition}</td>
			      <td>${product.price} USD</td>
			      <td>${product.publication}</td>
			      <td>${product.unitInStock}</td>
			      <td>
				      <a href="<spring:url value="/productList/viewProduct/${product.id}"/>">
				      <span class="fa fa-info-circle"></span>
				      </a>
			      </td>
			    </tr>
			    </tbody>
			    </c:forEach>
			    
					  <!--   
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					      <td>${product.condition}</td>
					      <td>${product.price} USD</td>
					      <td>${product.unitInStock}</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>Larry</td>
					      <td>the Bird</td>
					      <td>@twitter</td>
					      <td>${product.condition}</td>
					      <td>${product.price} USD</td>
					      <td>${product.unitInStock}</td>
					    </tr>
					  </tbody>
					  
					  --> 
			</table>

		</div>
		
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 