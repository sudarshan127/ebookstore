<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- including header file -->
<%@include file="/WEB-INF/views/template/header.jsp" %>
    
    <html>
    	<title>Edit Details of Books</title>
    </html>
    
 <div class="container-wrapper">
 	
	
		<div class = "page-header">
			<h1>Edit items</h1>
			
			<p class = "lead">You can edit the details of books into a system!! </p>
			
		</div>
		
		<form:form action="${pageContext.request.contextPath}/admin/productInventory/addProduct" 
			method ="POST" modelAttribute="product" 
			enctype="multipart/form-data"> <!-- we can use modelAttribute instead of commandName -->
			
			<form:hidden path = "id" value="${product.id}" />
			
			<div class="form-group">
				<label for="name">Name:</label>
				<br>
				<form:input path="name" id="name" class="form-Control" value = "${product.name}"/>
			</div>
			
			<div class="form-group">
				<label for="category">Category</label>
				<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Romance" />Romance</label>
				<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Comedy" />Comedy</label>
				<label class = "checkbox-inline"><form:radiobutton path="category" id="category" value="Thriller" />Thriller</label>
			</div>
			
			<div class="form-group">
				<label for="authorName">Author Name</label>
				<form:input path="authorName" id="authorName" class="form-Control" value = "${product.authorName}"/>
			</div>
			
			<div class="form-group">
				<label for="condition">Condition</label>
				<label class = "checkbox-inline"><form:radiobutton path="condition" id="condition" value="New" />New</label>
				<label class = "checkbox-inline"><form:radiobutton path="condition" id="condition" value="Old" />Old</label>
			</div>
			
			<div class="form-group">
				<label for="price">Price</label>
				<form:input path="price" id="price" class="form-Control" value = "${product.price}"/> <label>USD</label>
			</div>
			
			<div class="form-group">
				<label for="publication">Publication</label>
				<form:input path="publication" id="publication" class="form-Control" value = "${product.publication}"/>
			</div>
			
			<div class="form-group">
				<label for="unitInStock">Unit In Stock</label>
				<form:input path="unitInStock" id="unitInStock" class="form-Control" value = "${product.unitInStock}"/>
			</div>
			
			<div class="form-group">
				<label class = "control-label" for="image">Upload Image</label>
				<form:input type ="file" path="image" id="image" />
			</div>
			
			<br><br>
			<input type="submit" value = "submit" class="btn btn-primary" >
			<a href="<c:url value="/admin/productInventory" />" class="btn btn-primary" >Cancel</a>
		</form:form>
		
		
    <!-- including footer file -->
 <%@include file="/WEB-INF/views/template/footer.jsp" %>   
 
 