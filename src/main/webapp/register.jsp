<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/common_css_js.jsp" %>
<meta charset="ISO-8859-1">
<title>New User</title>
</head>
<body>
<%@include file="components/navbar.jsp" %>


<div class="container-fluid">
		
				<div class="row mt-5">
	<div  class="col-md-4 offset-md-4">
	
	
	
	<div class="card">
		
			<%@include file="components/message.jsp" %>
		
		<div class="card-body px-5">
		
			<div class="container text-center">
				<img src="img/add-friend.png" style="max-width:100px;" class="img-fluid">
			</div>
						
	<h3 class="text-center my-2">Sign up Here !!</h3>
		<form action="RegisterServlet1" method="post">
		
			<div class="form-group">
				<label for="name">User Name</label>
				<input type="text" class="form-control" name="user_name" id="name" placeholder="Enter Here" aria-describedby="emailHelp">
			</div>
			
			
			<div class="form-group">
				<label for="email">User Email</label>
				<input type="email" class="form-control"name="user_email" id="email" placeholder="Enter Here" aria-describedby="emailHelp">
			</div>
			
			
			<div class="form-group">
				<label for="password">User Password</label>
				<input type="password" class="form-control" name="user_password" id="password" placeholder="Enter Here" aria-describedby="emailHelp">
			</div>
			
			<div class="form-group">
				<label for="phone">User Phone</label>
				<input type="number" class="form-control" name="user_phone" id="phone" placeholder="Enter Here" aria-describedby="emailHelp">
			</div>
			
			
			<div class="form-group">
				<label for="name">User Address</label>
				<textarea style="height:100px;" class="form-control" name="user_address" placeholder="Enter your Address"></textarea>
			</div>
			
			<div class="container text-center">
				<button class="btn btn-outline-success">Register</button>
				<button class="btn btn-outline-warning">Reset</button>
			</div>
			
		
		</form>
		
		
		</div>
	</div>
		
	</div>

</div>

</div>
	

</body>
</html>