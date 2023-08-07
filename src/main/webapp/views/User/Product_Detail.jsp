<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
				<li class="breadcrumb-item active">Product Detail</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Product Detail Start -->
	<div class="product-detail">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
				
					<div class="product-detail-top">
						<div class="row align-items-center">
							<div class="col-md-5">
								<div class="product-slider-single normal-slider">
								<%-- 	<img
										src="${pageContext.request.contextPath }/img/${productDetail.imgProduct }"
										alt="Product Image">  --%>
										<c:forEach var="img" items="${productAllImg }">
										<img
										src="${pageContext.request.contextPath }/img/${img}"
										alt="Product Image">
										</c:forEach>
								</div>
								<div class="product-slider-single-nav normal-slider">
									<c:forEach var="img" items="${productAllImg }">
									<div class="slider-nav-img">
										<img
											src="${pageContext.request.contextPath }/img/${img}"
											alt="Product Image">
									</div>
									</c:forEach>
								<%-- 	<div class="slider-nav-img">
										<img
											src="${pageContext.request.contextPath }/img/bitis-bupper1.jpg"
											alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img
											src="${pageContext.request.contextPath }/img/bitis-bupper2.jpg"
											alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img
											src="${pageContext.request.contextPath }/img/bitis-bupper3.jpg"
											alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img
											src="${pageContext.request.contextPath }/img/bitis-bupper4.jpg"
											alt="Product Image">
									</div>
									<div class="slider-nav-img">
										<img
											src="${pageContext.request.contextPath }/img/bitis-bupper.jpg"
											alt="Product Image">
									</div> --%>
								</div>
							</div>
							<div class="col-md-7">
							
								<div class="product-content" id="product-content">
								<form action="/addtocart" method="get">		
									<input name="id" id="id" value="${productDetail.id }" hidden="hidden">
									<div class="title">
										<h2 id="name">${productDetail.name }</h2>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										<h4>Price:</h4>
										<p id="price" >
											${productDetail.price } $
										</p>
									</div>
										
									<div class="quantity">
										<h4>Quantity:</h4>
										<div class="qty">
											<button type="button"  class="btn-minus">
												<i class="fa fa-minus"></i>
											</button>
											<input id="quantity" type="text" name="quantity" value="1">
											<button type="button" class="btn-plus">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>	
										
								
									<div class="p-color">
										<div class="options">
										<h4>Color:</h4>
									
										<c:forEach var="color" items="${productColor }">
											<div class="my-radio">
												<input  class="colors" type="radio" id="color-${color }"   name="color" value="${color }">
												<label for="color-${color }">${color }</label>
											</div>
											</c:forEach>
											
										</div>
									</div>
									
									<div class="p-color">
									<div class="options">
										<h4>Size:</h4>
										<c:forEach var="size" items="${productSize }">
										<div class="my-radio">
											
											<input class="size" type="radio" id="size-${size}" name="size"  value="${size}">
											<label for="size-${size}" id="size">${size }</label>
										</div>
										</c:forEach>
									</div>
									</div>
								
									<div class="action">
										<button class="btn" type="submit" id="addtocart"><i class="fa fa-shopping-cart"></i>Add
											to Cart </button> 
										<button class="btn" formaction="${pageContext.request.contextPath }/checkout" formmethod="Post"><i	class="fa fa-shopping-bag"></i>Buy Now</button>
									</div>
										</form>
								</div>
								
							<!-- 	<script type="text/javascript">
								$(document).ready(function(){
									var id = $("#id").val();
									var name = document.getElementById("name").textContent;
									var price = document.getElementById("price").textContent;
									let quantity = $("#quantity").val();
									let colors = $(".colors").val();
									let size = $(".size").val();
									$("#addtocart").click(function(){
										
										alert(colors)
									 	$.ajax({
											url:"/addtocart?name="+name +"&price="+price+"&quantity="+quantity+"&color="+color+"&size="+size,
											type: "GET",
											success: function(data){
												$('#product-content').html($(data).find('#product-content').children())
											}/* , error: function(XMLHttpRequest, textStatus, errorThrown) {
												alert("error....")
											} */
										}); 
									});
									      	
						        })
								</script> -->
								
								
							</div>
							
						</div>
					</div>

					<div class="row product-detail-bottom">
						<div class="col-lg-12">
							<ul class="nav nav-pills nav-justified">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill" href="#description">Description</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#specification">Specification</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#reviews">Reviews (1)</a></li>
							</ul>

							<div class="tab-content">
								<div id="description" class="container tab-pane active">
									<h4>Product description</h4>
									<p>${productDetail.description}.</p>
								</div>
								<div id="specification" class="container tab-pane fade">
									<h4>Product specification</h4>
									<ul>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
									</ul>
								</div>
								<div id="reviews" class="container tab-pane fade">
									<div class="reviews-submitted">
									<c:forEach var="review" items="${review}">
										<div class="reviewer">
											${review.user.username } - <span>01 Jan 2020</span>
										</div>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p>${review.reviews }.</p>
										</c:forEach>
									</div>
									<div class="reviews-submit">
										<h4>Give your Review:</h4>
										<div class="ratting">
											<i class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i> <i class="far fa-star"></i> <i
												class="far fa-star"></i>
										</div>
										<div class="row form">
											<div class="col-sm-6">
												<input type="text" placeholder="Name">
											</div>
											<div class="col-sm-6">
												<input type="email" placeholder="Email">
											</div>
											<div class="col-sm-12">
												<textarea placeholder="Review"></textarea>
											</div>
											<div class="col-sm-12">
												<button>Submit</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="product">
						<div class="section-header">
							<h1>Related Products</h1>
						</div>

						<div
							class="row align-items-center product-slider product-slider-3">
							<c:forEach var="brand" items="${brand}">
							<div class="col-lg-3">
								<div class="product-item">
									<div class="product-title">
										<a href="#">${brand.name }</a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="${pageContext.request.contextPath }/product-detail">
											<img
											src="${pageContext.request.contextPath }/img/${brand.imgProduct }"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3>
										${brand.price }	<span>$</span>
										</h3>
										<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
											Now</a>
									</div>
								</div>
							</div>
							</c:forEach>
							
							<div class="col-lg-3">
								<div class="product-item">
									<div class="product-title">
										<a href="#">Product Name</a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="${pageContext.request.contextPath }/product-detail">
											<img
											src="${pageContext.request.contextPath }/img/bitis-sneaker.jpg"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3>
											<span>$</span>99
										</h3>
										<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
											Now</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="product-item">
									<div class="product-title">
										<a href="#">Product Name</a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="${pageContext.request.contextPath }/product-detail">
											<img
											src="${pageContext.request.contextPath }/img/jordan7_1.jpg"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3>
											<span>$</span>99
										</h3>
										<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
											Now</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="product-item">
									<div class="product-title">
										<a href="#">Product Name</a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="product-detail.html"> <img
											src="${pageContext.request.contextPath }/img/bitis-boots-girl2.jpg"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3>
											<span>$</span>99
										</h3>
										<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
											Now</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="product-item">
									<div class="product-title">
										<a href="#">Product Name</a>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<div class="product-image">
										<a href="product-detail.html"> <img
											src="${pageContext.request.contextPath }/img/bitis-bupper.jpg"
											alt="Product Image">
										</a>
										<div class="product-action">
											<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
												class="fa fa-heart"></i></a> <a href="#"><i
												class="fa fa-search"></i></a>
										</div>
									</div>
									<div class="product-price">
										<h3>
											<span>$</span>99
										</h3>
										<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
											Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
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
							<div class="product-item">
								<div class="product-title">
									<a href="#">Product Name</a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="product-detail.html"> <img
										src="${pageContext.request.contextPath }/img/jordan10_3.jpg"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3>
										<span>$</span>99
									</h3>
									<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
										Now</a>
								</div>
							</div>
							<div class="product-item">
								<div class="product-title">
									<a href="#">Product Name</a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="product-detail.html"> <img
										src="${pageContext.request.contextPath }/img/jordan10_3.jpg"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3>
										<span>$</span>99
									</h3>
									<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
										Now</a>
								</div>
							</div>
							<div class="product-item">
								<div class="product-title">
									<a href="#">Product Name</a>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="product-image">
									<a href="product-detail.html"> <img
										src="${pageContext.request.contextPath }/img/jordan10_3.jpg"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-price">
									<h3>
										<span>$</span>99
									</h3>
									<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
										Now</a>
								</div>
							</div>
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
	<!-- Product Detail End -->

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
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
