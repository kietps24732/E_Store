<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Shopping Cart</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<link href="${pageContext.request.contextPath}/img/favicon.ico"
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
<link href="${pageContext.request.contextPath}/lib/slick/slick.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/lib/slick/slick-theme.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/css/style.css"
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
				<li class="breadcrumb-item active">Cart</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Cart Start -->
	<div class="cart-page">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="cart-page-inner">
						<div class="table-responsive">

							<table class="table table-bordered">
								<thead class="thead-dark">
									<tr>
										<th>Product</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Size</th>
										<th>Color</th>
										<th>Total</th>
										<th>Remove</th>
									</tr>
								</thead>

								<tbody class="align-middle">

									<c:forEach var="brand" items="${products}" varStatus="status">
										<form
											action="${pageContext.request.contextPath }/shop-cart?id=${status.index}"
											method="Post">
											<tr>
												<td>
													<div class="img">
														<a href="#"><img
															src="${pageContext.request.contextPath}/img/${brand.imgProduct }"
															alt="Image"></a>
														<p>${brand.name }</p>
													</div>
												</td>
												<td>${brand.price }$</td>
												<td>
													<div class="qty">
														<button type="button" class="btn-minus">
															<i class="fa fa-minus"></i>
														</button>
														<input type="text" value="${brand.quantity }">
														<button type="button" class="btn-plus">
															<i class="fa fa-plus"></i>
														</button>
													</div>
												</td>
												<td>${brand.size }</td>
												<td>${brand.color }</td>
												<td>${ brand.price * brand.quantity}</td>
												<td><button type="submit">
														<i class="fa fa-trash"></i>
													</button></td>
											</tr>
										</form>
									</c:forEach>

								</tbody>
							</table>

						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart-page-inner">
						<div class="row">
							<div class="col-md-12">
								<div class="coupon">
									<input type="text" placeholder="Coupon Code">
									<button>Apply Code</button>
								</div>
							</div>
							<div class="col-md-12">
								<form action="${pageContext.request.contextPath }/checkout-Cart"
									method="Post">
									<div class="cart-summary">
										<div class="cart-content">
											<h1>Cart Summary</h1>
											<p>
												Amount<span>${size}</span>
											</p>
											<p>
												Shipping Cost<span>$1</span>
											</p>
											<h2>
												Grand Total<span>${total} $</span>
											</h2>
										</div>
										<div class="cart-btn">
											<button type="button">Update Cart</button>
											<button type="submit">Checkout</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart End -->

	<jsp:include
		page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>