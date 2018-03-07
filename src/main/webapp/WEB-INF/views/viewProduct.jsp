<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <html>
    	<title>Detail of Product</title>
    </html>
    
 <div class="container-wrapper">
 	
	
		<div class = "page-header">
			<h1>Details of Books</h1>
			
			<p class = "lead">You can find the related information about the books!! </p>
			
			
			<div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
		      <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
		       	
		       	 <div class="row">
				    <div class="col">
				     	<img class =" rounded float-left" alt="madan" src="<c:url value="/resources/image/madan.jpg"/>" style= "width:80%; height: 400px;" />
				    </div>
				    <div class="col">
				      <h3>${product.name}</h3>
				      <p>${product.category}</p>
				      <h3><strong>Written By:</strong>${product.authorName}</h3>
				      <p>${product.condition}</p>
				      <h4>${product.price} USD</h4>
				      <h3><strong>Published By:</strong>${product.publication}</h3>
				      <p>${product.unitInStock}</p>
				    </div>
				 </div>
		       	
		      </div>
		      <div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
		        <div class="my-3 p-3">
		          <h2 class="display-5">Another headline</h2>
		          <p class="lead">And an even wittier subheading.</p>
		        </div>
		        <div class="bg-dark box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
		      </div>
		    </div>
			
		</div>
		
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 