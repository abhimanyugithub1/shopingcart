<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="components/common_css_js.jsp"%>

<meta charset="ISO-8859-1">
<title>MyCart - Home</title>
</head>
<body>
	<%@include file="components/navbar.jsp"%>


	<div class="container-fluid">

	<div class="row mt-3 mx-2">

		<%
		
		String cat=request.getParameter("category");
		
		
		
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		List<Product> list = null;
		
		
		
		 if(cat==null || cat.trim().equals("all"))
		{
			list = dao.getAllProducts();
		}else {
			
			int cid=Integer.parseInt(cat.trim());
			list=dao.getAllProductsById(cid);
			
		}
		
		
		 

		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
		%>


		<!-- Show Categories -->
		<div class="col-md-2">

			<div class="list-group mt-4">
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
					All Categories </a>


				<%
				for (Category c : clist) {
				%>

				<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"> <%=c.getCategoryTitle()%>

				</a>

				<%
				}
				%>

			</div>


		</div>


		<!-- Show Products -->
		<div class="col-md-10">


			<!-- row -->
			<div class="row mt-4">

				<div class="col-md-12">
					<div class="card-columns">

						<!-- traversing products -->

						<%
						for (Product product : list) {
						%>

						
						<!-- Product card -->
						<div class="card product-card">

							<div class="container text-center">
							<img alt="" src="img/products/<%= product.getpPhoto() %>" style="max-height: 200px; max-width: 100%; width:auto;" class="card-img-top m-2" >
							
							</div>

							<div class="card-body">

								<h5 class="card-title">
									<%=product.getpName()%>
								</h5>
								<p class="card-text"><%=Helper.get10Words(product.getpDesc())%>
								</p>


							</div>

							<div class="card-footer text-center">
								<button class="btn custom-bg text-white" onclick="add_to_cart(<%= product.getpId() %>,'<%= product.getpName() %>',<%= product.getPriceAfterApplyingDiscount()%>)" >Add to Cart</button>
								<button class="btn btn-outline-success ">
									&#8377;
									<%=product.getPriceAfterApplyingDiscount()%>/-
									<span class="text-secondary discount-label">&#8377;<%=product.getpPrice() %> , <%= product.getpDiscount() %>% off </span>
								</button>

							</div>


						</div>



						<%}
						
						
						if(list.size()==0)
						{
							
							out.println("<h1>No Item This Category</h1>");
							
						}
						
						
						%>


					</div>

				</div>

			</div>



		</div>

	</div>
</div>






 <%@include file="components/common_modals.jsp" %>


</body>
</html>