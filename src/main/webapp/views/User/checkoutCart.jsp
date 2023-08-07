
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E Store - eCommerce HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<link href="${pageContext.request.contextPath }/img/favicon.ico"
	rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/lib/slick/slick.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/lib/slick/slick-theme.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath }/css/style.css"
	rel="stylesheet">
</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath }/views/User/navUser.jsp"></jsp:include>
	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Checkout</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Checkout Start -->
	<div class="checkout">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath }/pay-cart"
				method="post">
				<div class="row">

					<div class="col-lg-8">
						<div class="checkout-inner">
							<div class="billing-address">
								<h2>Billing Address</h2>
								<div class="row">
									<div class="col-md-12">
										<label>Full name</label>
										<c:if test="${not  empty sessionScope.user }">
											<input class="form-control" type="text"
												placeholder="fullname" value="${sessionScope.user.fullname}">
										</c:if>
									</div>
									<div class="col-md-6">
										<label>E-mail</label>
										<c:if test="${not  empty sessionScope.user }">
											<input name="txtTo" class="form-control" type="text"
												placeholder="E-mail" value="${sessionScope.user.email}">
										</c:if>
									</div>
									<div class="col-md-6">
										<label>Mobile No</label> <input name="" class="form-control"
											type="text" placeholder="Mobile No">
									</div>
									<div class="col-md-12">
										<label>Address</label> <input name="address"
											class="form-control" type="text" placeholder="Address">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">

					<div class="checkout-inner">
						<c:forEach var="product" items="${cart}">
							<div class="checkout-summary">
								<textarea hidden="" rows="5" cols="30" name="txtContent">
                            ${product.name}: ${product.price}$
                            Total Number: ${product.quantity}
                            Color:${product.color}
                            Size: ${product.size}
                            Grand Total: ${product.price *  product.quantity}
                            </textarea>
								<h1>Cart Total</h1>
								<p>${product.name}<span>${product.price} $</span>
								</p>
								<p class="sub-total">
									Total Number<span>${product.quantity}</span>
								</p>
								<p class="ship-cost">
									Color:<span>${product.color}</span>
								</p>
								<p class="ship-cost">
									Size:<span>${product.size}</span>
								</p>
								<h2>
									Grand Total<span>${product.price *  product.quantity}</span>
								</h2>
							</div>
						</c:forEach>
						<div class="checkout-btn">
							<button type="submit" class="btn">Place Order</button>
						</div>
					</div>

				</div>
		</div>
		</form>
	</div>
	</div>

	<!-- Checkout End -->
	<jsp:include
		page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>


	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
