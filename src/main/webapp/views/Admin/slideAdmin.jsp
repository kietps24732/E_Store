<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- Sidebar -->
          <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/home">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin <sup>E</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath }/index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

          
            <!-- Heading -->
            <div class="sidebar-heading">
              Quản Lý
            </div>
         <!-- Order Table-->
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDH"
                    aria-expanded="true" aria-controls="collapseDH">
                    <i class="fas fa-list fa-sm fa-fw"></i>
                    <span>Order</span>
                </a>
                <div id="collapseDH" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Order</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/order">Order</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/order/delivering">Delivering</a>                  
                    	<a class="collapse-item" href="${pageContext.request.contextPath }/index/order/delivered">Delivered</a>
                    </div>
                </div>
            </li>


                <!-- Loại hàng -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLH"
                        aria-expanded="true" aria-controls="collapseLH">
                        <i class="fas fa-list fa-sm fa-fw"></i>
                        <span>Category</span>
                    </a>
                    <div id="collapseLH" class="collapse" aria-labelledby="headingUtilities"
                        data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Danh Sách:</h6>
                            <a class="collapse-item" href="${pageContext.request.contextPath }/index/category">Category</a>
                             <a class="collapse-item" href="${pageContext.request.contextPath }/index/category/create-new">Create new</a>  
                        </div>
                    </div>
                </li>

                <!-- Sản Phẩm -->
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSP"
                    aria-expanded="true" aria-controls="collapseSP">
                    <i class="fas fa-list fa-sm fa-fw"></i>
                    <span>Product</span>
                </a>
                <div id="collapseSP" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Chỉnh Sửa Sản Phẩm:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath }/index/product">All Product</a>
                         <a class="collapse-item" href="${pageContext.request.contextPath }/index/product/create-product">Create New Products</a> 
                    </div>
                </div>
            </li>

        

            <!-- Khách hàng -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseKH"
                    aria-expanded="true" aria-controls="collapseKH">
                    <i class="fas fa-list fa-sm fa-fw"></i>
                    <span>User</span>
                </a>
                <div id="collapseKH" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">See Users:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/user">Users</a>
                		<a class="collapse-item" href="${pageContext.request.contextPath}/index/user/create-user">Create User</a>
                    </div>
                </div>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
               Statistics
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTK"
                    aria-expanded="true" aria-controls="collapseTK">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Products</span>
                </a>
                <div id="collapseTK" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Classify 1:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/selling">Best Selling</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/favotite">Favotite Product </a>
                 
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Classify 2:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/inventory">Inventory</a>
                      
                    </div>
                </div>
            </li>

            <!-- Thống Kê  Doanh Thu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDT"
                    aria-expanded="true" aria-controls="collapseDT">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Thống Kê Doanh Thu</span>
                </a>
                <div id="collapseDT" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Revenue Statistics:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/Revenue/day">Today</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/Revenue/month">Monthly</a>
                        
                       
               
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <div class="sidebar-heading">
               
              Cài Đặt
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Tài Khoản</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Chỉnh Sửa</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/changepassword">Đổi Mật Khẩu</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/index/editaccount">Sửa Thông Tin</a>
                    </div>
                </div>
            </li>


               <!-- Divider -->
               <hr class="sidebar-divider d-none d-md-block">
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


         

        </ul>