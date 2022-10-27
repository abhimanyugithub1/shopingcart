<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {

	session.setAttribute("message", "You are not Logged in !! Login First");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>





<%
	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> list = cdao.getCategories();
	
	
	//getting count
	
	Map<String,Long> m= Helper.getCounts(FactoryProvider.getFactory());
	
	
	
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>


</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container admin-card">

		<div class="container-fluid mt-3">

			<%@include file="components/message.jsp"%>

		</div>

		<div class="row mt-4">

			<!-- First col -->
			<div class="col-md-4">
				<!--  first box -->
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/team.png" alt="user_icon">
						</div>

						<h1><%= m.get("userCount") %> </h1>
						<h1 class="text-uppercase text-muted">User</h1>

					</div>

				</div>
			</div>
			<!-- Second col -->
			<div class="col-md-4">
				<!--  second box -->
				<div class="card">
					<div class="card-body text-center">


						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/list.png" alt="list_icon">
						</div>

						<h1><%= list.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>



					</div>
				</div>

			</div>

			<!-- Third col -->
			<div class="col-md-4">
				<!-- Third Box -->
				<div class="card">
					<div class="card-body text-center">


						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/delivery-box.png" alt="delivery_icon">
						</div>

						<h1><%= m.get("productCount") %> </h1>
						<h1 class="text-uppercase text-muted">Product</h1>

					</div>

				</div>

			</div>

		</div>


		<!-- Second Row : first col -->

		<div class="row mt-3">

			<!-- first card -->
			<div class="col-md-6">


				<!--  second box -->
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">


						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/keys.png" alt="keys_icon">
						</div>

						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Categories</h1>

					</div>



				</div>

			</div>

			<!-- Second row : second Col -->
			<div class="col-md-6">


				<!--  second box -->
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">


						<div class="container">
							<img style="max-width: 120px;" class="img-fluid rounded-circle"
								src="img/plus.png" alt="plus_icon">
						</div>

						<p class="mt-2">Click here to add new Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>

				</div>



			</div>

		</div>


	</div>





	<!-- ********************************************************************* -->

	<!-- Start add category model -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory">


						<div class="form-group">

							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />
						</div>

						<div class="form-group">

							<textarea style="height: 350px;" class="form-control"
								placeholder="Enter Category Description" name="catDescription"
								required></textarea>

						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>


				</div>

			</div>
		</div>
	</div>

	<!-- End add category model -->








	<!-- ******************************************************************* -->

	<!--start add product model -->




	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addproduct">


						<!-- product title -->
						<div class="form-group">

							<input type="text" class="form-control" name="pname"
								placeholder="Enter product title" required />
						</div>

						<!-- product Product description -->
						<div class="form-group">

							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product description" name="pdesc" required></textarea>

						</div>


						<!-- product Product price -->
						<div class="form-group">
							<input type="number" class="form-control" name="pprice"
								placeholder="Enter product price" required />
						</div>

						<!-- product Product discount -->
						<div class="form-group">
							<input type="number" class="form-control" name="pdiscount"
								placeholder="Enter product discount" required />
						</div>

						<!--  Product Quantity -->
						<input type="number" class="form-control" name="pquantity"
							placeholder="Enter product quantity" required />


						<!--  Product Category -->




						<select name="pcatId" class="form-control" id="">

							<%
							for (Category c : list) {
							%>
							<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%>
							</option>

							<%
							}
							%>

						</select>


						<!-- product file -->

						<div class="form-group">
							<label for="ppic">Select Picture of product</label><br> <input
								type="file" name="ppic" required />

						</div>




						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>





				</div>

			</div>
		</div>
	</div>

	<!-- End End Product model -->


















	<%@include file="components/common_modals.jsp"%>



</body>
</html>