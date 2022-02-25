
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.learn.mycart.entities. *"%>
<%@page import="com.learn.mycart.helper. *"%>
<%@page import="com.learn.mycart.dao. *"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util. *"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<%@include file="component/common.css.js.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
</head>

<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-3 mx-3">
			<%
			String cat = request.getParameter("category");
			//out.println(cat);
			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list = dao.getAllProducts();
			/* List<Product> list = null;
			if (cat == null) {
				list = dao.getAllProducts();
			} else if (cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
			} */

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>

			<!--  show categories -->
			<div class="col-md-2 ">

				<%-- 	<h1>Number of Category is<%=clist.size() %></h1> --%>
				<div class="list-group mt-4 ">
					<a href="home.jsp?category=all"
						class="list-group-item list-group-item-action active"
						style="background-color: lightblue; border-color: lightblue;">
						All products </a>





					<%
					for (Category c : clist) {
					%>
					<a href="home.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>


					<%
					}

					if (list.size() == 0) {

					out.println("No item in this category");
					}
					%>
				</div>
			</div>


			<!-- show products -->
			<div class="col-md-10">

				<!-- 	row -->
				<div class="row mt-4">
					<!-- col:12 -->
					<div class="col-md-12">
						<div class="card-columns">

							<!-- travesing products -->
							<%
							for (Product p : list) {
							%>
							<!-- product card -->
							<div class="card">
								<div class="container text-center">

									<img class="card-img-top"
										src="img/products/<%=p.getpPhoto()%> "
										style="max-height: 270px; max-width: 100%; width: auto;"
										alt="Card image cap">
								</div>
								<div class="card-body">

									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text">
										<%=Helper.get10Words(p.getpDesc())%>


									</p>

								</div>
								<div class="card-footer">
									<button class="btn cutom-bg" 
										style="background-color: lightblue; border-color: lightblue;" onclick="add_to_cart(<%=p.getpId() %>,'<%=p.getpName() %>',<%=p.getpPrice() %>);">Add
										to cart</button>
									<button class="btn btn-sucess"
										style="background-color: lightblue; border-color: lightblue;">
										&#36;<%=p.getpPrice()%>/-<span
											class="text-secondary discount-label"> <%=p.getpDiscount()%>%
											discount
										</span>
									</button>

								</div>
							</div>


							<%
							}
							%>

						</div>

					</div>

				</div>

			</div>
		</div>
	</div>
	


<!-- Modal -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="cart-body">
       
       
       </div>
      </div>
      <div class="modal-footer" style="">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn" style="font-color:black;background-color: lightblue; border-color: lightblue;">Checkout</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>