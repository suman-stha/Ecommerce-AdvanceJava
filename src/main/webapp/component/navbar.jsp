<%@page import="com.learn.mycart.entities.User"%>
<%
User user1 = (User) session.getAttribute("current-user");
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<nav class="navbar navbar-expand-lg navbar-light custom-bg"
	style="background-color: lightblue !important;">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">OnlineStore</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="home.jsp">Home <span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>
			<!--     <form class="form-inline my-2 my-lg-0 ml-auto"> -->
			<!--       <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
			<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
			<!--     </form> -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active">
				<a class="nav-link"
					href="#" data-toggle="modal" data-target="#cart" onclick="updateCart();"><i class="fa fa-cart-plus" style="font-size: 20px;"></i><span 
					class="ml-0 cart-items "style="font-size: 20px;">(0)</span></a></li>

				<%
				if (user1 == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register</a></li>


				<%
				} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="admin.jsp"><%=user1.getUserName() %></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">LogOut</a></li>

				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>