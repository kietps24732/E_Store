<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="nav flex-column nav-pills" aria-orientation="vertical">
		<a class="nav-link" href="${pageContext.request.contextPath}/account/order"><i
		class="fa fa-sign-out-alt"></i>Orders</a>
							
		<a class="nav-link" href="${pageContext.request.contextPath}/account/payment"><i
		class="fa fa-sign-out-alt"></i>Payment</a>
							
		<a class="nav-link" href="${pageContext.request.contextPath}/account/address"><i
		class="fa fa-sign-out-alt"></i>address</a>
							
		<a class="nav-link" href="${pageContext.request.contextPath}/account/editaccount"><i
		class="fa fa-sign-out-alt"></i>Account Details</a>
							
		<a class="nav-link" href="${pageContext.request.contextPath}/account/editaccount/savePass"><i
		class="fa fa-sign-out-alt"></i>ChangePassword</a>
							
		<a class="nav-link" href="${pageContext.request.contextPath}/logout"><i
		class="fa fa-sign-out-alt"></i>Logout</a>
	</div>
</body>
</html>