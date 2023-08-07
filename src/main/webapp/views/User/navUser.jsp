<!-- Top bar Start -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        support@email.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        +012-345-6789
                    </div>
                </div>
            </div>
        </div>
        <!-- Top bar End -->
        
        <!-- Nav Bar Start -->
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="${pageContext.request.contextPath }/home" class="nav-item nav-link">Home</a>
                            <a href="${pageContext.request.contextPath }/product-list" class="nav-item nav-link">Products</a>
                            <a href="${pageContext.request.contextPath }/shop-cart" class="nav-item nav-link">Cart</a>
                            <a href="${pageContext.request.contextPath }/account" class="nav-item nav-link">My Account</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                                <div class="dropdown-menu">
                                    <a href="${pageContext.request.contextPath }/wish-list" class="dropdown-item">Wishlist</a>
                                    <a href="${pageContext.request.contextPath }/login" class="dropdown-item">Login & Register</a>
                                    <a href="${pageContext.request.contextPath }/contact" class="dropdown-item">Contact Us</a>
                                </div>
                            </div>
                           	
                           	<c:if test="${admin.admin == 0 }">
                             <a href="${pageContext.request.contextPath }/index" class="nav-item nav-link" >Manage</a>
                             </c:if>
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                             <%--    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
	                                <c:if test="${ empty sessionScope.user }">
	                                Login
									</c:if>
									<c:if test="${ not empty sessionScope.user }">
									 ${sessionScope.user.username}
									</c:if>
	                               
                                </a> --%>
                                  <c:if test="${ empty sessionScope.user }">
	                                 <a href="${pageContext.request.contextPath }/login" class="nav-link " >
	                             	   Login
	                                </a>
                                </c:if>
                                 <c:if test="${not  empty sessionScope.user }">
		                                 <a href="${pageContext.request.contextPath }/login" class="nav-link dropdown-toggle" data-toggle="dropdown" >
		                               ${sessionScope.user.username}
		                                </a>
                                </c:if>
                                
                                
                                <div class="dropdown-menu">
                                
                          			<c:if test="${ not empty sessionScope.user }">
									  <a href="${pageContext.request.contextPath }/logout" class="dropdown-item">Logout </a>
								</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->      
        
        <!-- Bottom Bar Start -->
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="${pageContext.request.contextPath }/home">
                                <img src="${pageContext.request.contextPath }/img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="search">
                            <input type="text" placeholder="Search">
                            <button><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="user">
                            <a href="${pageContext.request.contextPath }/wish-list" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                                <span> ${count}</span>
                            </a>
                            <a href="${pageContext.request.contextPath }/shop-cart" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>(0)</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bottom Bar End --> 