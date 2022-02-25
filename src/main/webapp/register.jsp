<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="component/common.css.js.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
		
			<div class="card">
<%@include file="component/message.jsp"%>
				

				<div class="card-body px-5">

					<h3 class="text-center my-3">Sign Up Here</h3>
					<div class="card">
						<img src="img/signup.png" alt="" style="width: 20%">

					</div>
					<form action="RegisterServlet" method="post">
						<div class="form-group">
							<label for="name">User Name</label> <input name="user_name"
								type="text" class="form-control" id="name"
								placeholder="Enter here" aria-describedby="emailHelp"
								placeholder="Enter email">

						</div>
						<div class="form-group">
							<label for="email">Email</label> <input name="user_email"
								type="email" class="form-control" id="email"
								placeholder="Enter here" aria-describedby="emailHelp"
								placeholder="Enter email">

						</div>
						<div class="form-group">
							<label for="password">Password</label> <input
								name="user_password" type="password" class="form-control"
								id="password" placeholder="Enter here"
								aria-describedby="emailHelp" placeholder="Enter email">


						</div>
						<div class="form-group">
							<label for="phone">Phone Number</label> <input name="user_phone"
								type="number" class="form-control" id="phone"
								placeholder="Enter here" aria-describedby="emailHelp"
								placeholder="Enter email">

						</div>
						<div class="form-group">
							<label for="address">Address</label>
							<textarea name="user_address" style="height: 200px;"
								class="form-control" placeholder="Enter your address"></textarea>

						</div>
						<div class="container text-center">
							<button class="btn btn-outline-sucess">Register</button>
							<button class="btn btn-outline-warning">Reset</button>

						</div>
					</form>

				</div>
			</div>

		</div>
	</div>
</body>
</html>