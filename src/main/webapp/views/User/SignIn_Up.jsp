<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/login.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form:form action="${pageContext.request.contextPath }/login/sign-up" method="post" modelAttribute="user" >
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span>
				 <form:input path="username"	placeholder="UserName"/>
				 <form:errors  path="username" element="span" cssClass="text-danger"/>
				 <form:password path="password" placeholder="PassWord"/>
				  <form:errors  path="password" element="span" cssClass="text-danger"/>
				 <form:input path="fullname" placeholder="FullName"/>
				 <form:errors  path="fullname" element="span" cssClass="text-danger"  />
				<form:input path="email" placeholder="Email" />
				<form:errors  path="email" element="span" cssClass="text-danger"  />
				<button type="submit">Sign Up</button>
			</form:form>
		</div>
		
	<!-- 	 login -->
		<div class="form-container sign-in-container">
			<form:form action="${pageContext.request.contextPath }/login/home" method="post" modelAttribute="userLogin">
				<h1>Sign in</h1>
				<div class="social-container">
						 <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
					 <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
						
				  <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				
				<c:if test="${not empty sessionScope.message }">
					<div class="alert alert-success">
					   ${sessionScope.message}
					</div>
					<c:remove var="message" scope="session"/>
				</c:if>
				
				 <form:input path="username" placeholder="UserName"/> 
				 <form:errors  path="username" element="span" cssClass="text-danger"/>
				 <form:password path="password" placeholder="PassWord"/> <a href="${pageContext.request.contextPath }/forgotpassword" >Forgot your password?</a>
				  <form:errors path="password" element="span" cssClass="text-danger"/>
				<button type="submit">Sign In</button>
			</form:form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script type="text/javascript">const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});

	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});</script>
</body>
</html>