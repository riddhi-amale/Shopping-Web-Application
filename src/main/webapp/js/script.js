function add_to_cart(pid, pname, pprice){
	
	let cart = localStorage.getItem("cart");
	
	if(null == cart){
		let products = [];
		let product = {productId: pid, productName: pname, productQty: 1, productPrice: pprice};
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		
		console.log('Cart created and Product id : ' + pid + 'is added');
	} else {
		//cart if already exist		
		let pcart = JSON.parse(cart);
		
		let oldProduct = pcart.find((item) => item.productId == pid);
		
		if(oldProduct){
			oldProduct.productQty = oldProduct.productQty+1;
			pcart.map((item) => {			
					if(item.productId == oldProduct.productId){
						item.productQty = oldProduct.productQty;
					} 
				}
			)
			localStorage.setItem("cart", JSON.stringify(pcart));
			
			console.log('Product id : ' + pid + 'is alredy in cart and qty increased to ' + oldProduct.productQty);
		} else{
			let product = {productId: pid, productName: pname, productQty: 1, productPrice: pprice};
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
				console.log('NEW PRODUCT with id : ' + pid + 'is added to cart');
		}
	}
	
	updateCart();
}



// update cart

function updateCart(){
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if(cart!=null){console.log(cart.length);}
	if(cart == null || cart.length == 0){
		console.log('Cart is Empty');
		$(".cart-items").html("( 0 )")
		$(".cart-body").html("<h3> No Items in the Cart</h3>")
		//$(".chkout-btn").prop("disabled",true)		
		$(".chkout-btn").attr("disabled","disabled")
		$(".chkout-btn").addClass("btn-secondary").removeClass("btn-primary")
	} else {
		$(".chkout-btn").addClass("btn-primary").removeClass("btn-secondary")
		$(".chkout-btn").removeAttr("disabled")
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		let table = `
			<table class="table">
				<thead class = "thead-light">
					<tr>
						<th>Item Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
					</tr>
				</thead>

		`;
		
		let totalPrice=0;
		
		cart.map((item) => {
				
			table += `
				<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQty}</td>
					<td>${item.productQty * item.productPrice}</td>
					<td><button class="btn btn-danger btn-sm" onclick="deleteProductFromCart(${item.productId})">Remove</button></td>
				</tr>
			`
			totalPrice+= (item.productQty * item.productPrice);
				
			}
		)
		
		table += `
				<tr>
					<td></td>
					<td colspan="2"><b>Total Price: </b></td>
					<td class="font-weight-bold "><b>${totalPrice}</b></td>
					<td></td>
				</tr>
			`
		
		table = table + `</table>`;
		
		$(".cart-body").html(table);
	}
}

//delete Item in Cart based on Product Id
function deleteProductFromCart(pid){
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newcart = cart.filter((item) => item.productId != pid)
	localStorage.setItem("cart", JSON.stringify(newcart));
	updateCart();
}

$(document).ready(function(){
	updateCart();
})


function gotoCheckout(){
	window.location = "checkout.jsp";
}

function continueShopping(){
	window.location = "homepage.jsp";
}

function emptyCart(){
	localStorage.clear();
	}

