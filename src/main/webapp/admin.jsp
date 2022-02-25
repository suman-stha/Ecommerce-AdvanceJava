<%@page import="com.learn.mycart.entities. *"%>
<%@page import="com.learn.mycart.dao. *"%>
<%@page import="com.learn.mycart.helper. *"%>
<%@page import="java.util.List"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("normal")) {

		session.setAttribute("message", "You are not logged in ! Do not acess the page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>


<%@include file="/component/common.css.js.jsp"%>
</head>


<body>

	<%@include file="component/navbar.jsp"%>
	<div class="container admin">

		<div class="caontainer-fluid mt-3">

			<%@include file="component/message.jsp"%></div>
		<div class="row mt -3">


			<!-- first col -->

			<div class="col-md-4">
				<!-- 			first box -->

				<div class="card ">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="image-fluid rounded-circle"
								alt="user_icon" src="img/man.png">
						</div>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>




				</div>
			</div>

			<!-- first col -->

			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="image-fluid"
								alt="user_icon" src="img/shopping-list.png">
						</div>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>




				</div>
			</div>
			<!-- first col -->

			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="image-fluid"
								alt="user_icon" src="img/basket.png">
						</div>
						<h1 class="text-uppercase text-muted">Product</h1>
					</div>




				</div>
			</div>
		</div>

		<!-- 		second-row -->
		<div class="row mt-3">
			<!-- 		second row first col -->
			<div class="col-md-6">
				<!-- 			first box -->
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="image-fluid"
								alt="user_icon" src="img/calculator.png">
						</div>
						<p class="mt-2">Click here to add category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>




				</div>
			</div>
			<!-- 			second row second col -->
			<div class="col-md-6">
				<!-- 			second box -->
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="image-fluid"
								alt="user_icon" src="img/plus.png">
						</div>
						<p class="mt-2">Click here to add product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>




				</div>
			</div>

		</div>


	</div>
	<!-- addcategory modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog model-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-center">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
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
								placeholder="Enter category title" required>


						</div>
						<div class="form-group">
							<textarea class="form-control" style="height: 350px;"
								placeholder="Enter category description" name="catDescription"
								required>
				
				</textarea>
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
	<!-- end  category modal -->
	<!-- 	start product model -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog model-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-center">
					<h5 class="modal-title" id="exampleModalLabel">Fill product
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >
						
						<input type="hidden" name="operation" value="addproduct"/>
						<div class="form-group">
							<input type="text" class="form-control" name="pName"
								placeholder="Enter product name" required>


						</div>
						
						<div class="form-group">
							<input type="text" class="form-control" name="pDesc"
								placeholder="Enter product description" style="height: 150px"
								required>


						</div>



						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter product price" required>


						</div>
						

						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter product discount" required>


						</div>

						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter product quantity" required>


						</div>




						<!-- 						product category -->


						<%
						CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> list = cdao.getCategories();
						%>
						<div class="form-group">
							<select name="catId" class="form-control" id="">

								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
						<!-- product file -->
						<div class="form-group">
							<label for="pPic">Select picture of product</label> <br> <input
								type="file" name="pPic" id="pPic"required />
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
	<!-- end product modal -->
</body>
</html>