<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>product-list</title>
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
	<!-- Product List Start -->
	<div class="product-view">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-md-12">
							<div class="product-view-top">
								<div class="row">
									<div class="col-md-4">

										<!--     ham search product -->
										<form action="${pageContext.request.contextPath}/product-list/search" method="get">
											<div class="product-search">
												<input name="search"
													placeholder="search">
												<button type="submit">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</form>
									</div>
									<div class="col-md-4">
										<div class="product-short">
											<div class="dropdown">
												<div class="dropdown-toggle" data-toggle="dropdown">Product
													short by</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a href="/product-list/search/bitits" class="dropdown-item">Bitits</a> <a href="/product-list/search/jordan"
														class="dropdown-item">Jordan</a> <a href="/product-list/search/adidas"
														class="dropdown-item">Adidas</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="product-price-range">
											<div class="dropdown">
												<div class="dropdown-toggle" data-toggle="dropdown">Product
													price range</div>
												<div class="dropdown-menu dropdown-menu-right">
													<a href="/product-list/search/price050" class="dropdown-item">$0 to $50</a> <a href="/product-list/search/price5110"
														class="dropdown-item">$51 to $100</a> <a href="/product-list/search/price1150"
														class="dropdown-item">$101 to $150</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--  sản phẩm -->
						<c:forEach items="${page.content}" var="item">
							<div class="col-md-4">
								<div class="product-item">
									<div class="product-title">
										<a href="#">${item.name}</a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="product-detail.html"> <img
											src="${pageContext.request.contextPath }/img/${item.imgProduct}"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="${pageContext.request.contextPath}/favorite/${item.id}"><i class="fa fa-heart"></i></a> 
											<a href="${pageContext.request.contextPath}/product-detail?id=${item.id}"><i class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3><span>$${item.price}</span></h3>
										<a class="btn" href="${pageContext.request.contextPath}/product-detail?id=${item.id}"><i class="fa fa-shopping-cart"></i>Buy
											Now</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- Pagination Start -->
					<div class="m-2 text-center">
						<a class="btn btn-primary" href="/product-list?p=0">First</a> <a
							class="btn btn-primary" href="/product-list?p=${page.number-1}">Previous</a>
						<a class="btn btn-primary" href="/product-list?p=${page.number+1}">Next</a>
						<a class="btn btn-primary"
							href="/product-list?p=${page.totalPages-1}">Last</a>
					</div>
					<!-- Pagination Start -->
				</div>

				<!-- Side Bar Start -->
				<div class="col-lg-4 sidebar">
					<div class="sidebar-widget category">
						<h2 class="title">Category</h2>
						<nav class="navbar bg-light">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="#"><i
										class="fa fa-user"></i>Unisex Shoes</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><i
										class="fa fa-male"></i>Men's Shoes</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><i
										class="fa fa-female"></i>Women's Shoes</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><i
										class="fa fa-child"></i>Kids' Shoes</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><i
										class="fa fa-shoe-prints"></i>Sport Shoes</a></li>
							</ul>
						</nav>
					</div>

					<div class="sidebar-widget widget-slider">
						<div class="sidebar-slider normal-slider">
						 <c:forEach var="item" items="${listFeatured}">
							<div class="product-item">
								<div class="product-title">
									<a href="#">${item.name }</a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="${pageContext.request.contextPath}/product-detail"> <img
										src="${pageContext.request.contextPath}/img/${item.imgProduct}"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="${pageContext.request.contextPath}/favorite/${item.id}"><i class="fa fa-heart"></i></a>
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${item.id}"><i class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3><span>$${item.price}</span></h3>
									<a class="btn" href="${pageContext.request.contextPath}/product-detail?id=${item.id}"><i class="fa fa-shopping-cart"></i>Buy
										Now</a>
								</div>
							</div>
							 </c:forEach>
						</div>
					</div>

					<div class="sidebar-widget brands">
						<h2 class="title">Our Brands</h2>
						<ul>
							<li><a href="#">Nulla </a><span>(45)</span></li>
							<li><a href="#">Curabitur </a><span>(34)</span></li>
							<li><a href="#">Nunc </a><span>(67)</span></li>
							<li><a href="#">Ullamcorper</a><span>(74)</span></li>
							<li><a href="#">Fusce </a><span>(89)</span></li>
							<li><a href="#">Sagittis</a><span>(28)</span></li>
						</ul>
					</div>

					<div class="sidebar-widget tag">
						<h2 class="title">Tags Cloud</h2>
						<a href="#">Lorem ipsum</a> <a href="#">Vivamus</a> <a href="#">Phasellus</a>
						<a href="#">pulvinar</a> <a href="#">Curabitur</a> <a href="#">Fusce</a>
						<a href="#">Sem quis</a> <a href="#">Mollis metus</a> <a href="#">Sit
							amet</a> <a href="#">Vel posuere</a> <a href="#">orci luctus</a> <a
							href="#">Nam lorem</a>
					</div>
				</div>
				<!-- Side Bar End -->
			</div>
		</div>
	</div>
	<!-- Product List End -->

	<!-- Brand Start -->
	<div class="brand">
		<div class="container-fluid">
			<div class="brand-slider">
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logoadidas.jpg"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logoconverse.jpg"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logodior.png"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logovans.png"
						alt="">
				</div>
				<div class="brand-item">
					<img
						src="${pageContext.request.contextPath}/img/logolouisvuitton.jpg"
						alt="">
				</div>
				<div class="brand-item">
					<img src="${pageContext.request.contextPath}/img/logonike.jpg"
						alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Brand End -->

	<jsp:include
		page="${pageContext.request.contextPath }/views/User/footerUser.jsp"></jsp:include>

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/lib/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>