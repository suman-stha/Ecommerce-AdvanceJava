function add_to_cart(pid, pname, price) {

	let cart=   localStorage.getItem("cart");
	if (cart  == null) {

		//no cart yet
		let products = [];
		let product =   productId: pid, productName: pname, productQuantity  1, productPrice: price }

		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product is added for the first time")

	}
	else {

		//cart is already present
		let pcart   =JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId = pid)


		if (oldProduct) {
			//only we have to increase the quantity

			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {

				if (item.productId == oldProduct.productId) {

					item.productQuantity = oldProduct.ProductQuantity
				}

			})
			console.log("Product quantity is increased")
		}
		else {
			//we have to add the product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added")
		}
		updateCart();
	}


	//update cart

	function updateCart() {

		let cartString = localStorage.getItem("cart");
		let cart = JSON.parse(cartString);
		if (cart == null || cart.legth == 0) {
			console.log("Cart is empty!!")
			$(".cart-items").html("(0)");

			$(".cart-body").html("<h3>Cart does not have any items.<h3>");
			$(".checkout-btn").addClass('disabled');

		}
		else {

			//there is some in cart to show
			console.log(cart)
			$(".cart-items").html('(${cart.length})');

			table = table + '</table>'
			$(".cart-body").html(table);

		}

	}

	$(document).ready(function() {

		updateCart()
	})



}