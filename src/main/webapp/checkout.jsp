<%

User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not Logged in !! Login Firstto access checkout page");
	response.sendRedirect("login.jsp");
	return;
} 


%>






<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>




	<div class="container">

		<div class="row mt-5">

			<div class="col-md-6">
				<!-- card -->
				<div class="card">

					<div class="card-body">

						<h3 class="text-center mb-5">Your selected Items</h3>
						<div class="cart-body"></div>
					</div>

				</div>

			</div>



			<div class="col-md-6">
				<!--form details  -->

				<div class="card">

					<div class="card-body">

						<h3 class="text-center mb-5">Your Details for order</h3>

						<form action="#!">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input value="<%=user.getUserEmail() %>"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
									
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">your name</label> 
								<input value="<%=user.getUserName() %>"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter Name">
									
							</div>
							
							<div class="form-group">
								<label for="contact">Your Contact</label> 
								<input value="<%=user.getUserPhone() %>"
									type="number" class="form-control" id="contact"
									aria-describedby="emailHelp" placeholder="Enter Contact">
									
							</div>
							
							
							<div class="form-group">
								<label for="textarea" >Your shipping address</label>
								<textarea value="<%=user.getUserAddress() %>" class="form-control" placeholder="Enter your address" id="textarea" rows="3"></textarea>
							</div>
							
							<div class="container">
								<button class=" btn btn-outline-success">Order Now</button>
								<button class=" btn btn-outline-primary">Continue Shopping</button>
							
							</div>

						</form>

					</div>

				</div>

			</div>



		</div>

	</div>




	<%@include file="components/common_modals.jsp"%>
</body>
</html>