<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Change Password</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath }/css/account-changepass.css" rel="stylesheet">
</head>
<body id="page-top">
<!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="${pageContext.request.contextPath}/views/Admin/slideAdmin.jsp"></jsp:include>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="${pageContext.request.contextPath}/views/Admin/navAdmin.jsp"></jsp:include>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Change Password</h1>
                

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">ChangePassword</h6>
                        </div>
                        <div class="card-body">
                            <div class=" " id="changepass-tab" role="tabpanel" aria-labelledby="changepass-nav">
                           
                          
                           <c:if test="${message == true}">
						    <div class="alert alert-info" role="alert">
							  Change  successfully !
							</div>  							
						  </c:if>	
						  				
						  <c:if test="${message == false}">
						   <div class="alert alert-danger" role="alert">
							 Incorrect Data Entry ! 
							</div>  
						  </c:if>
					
                           
                           
                            <form action="${pageContext.request.contextPath}/index/editaccount/savePass" method="POST">                     
                                <div class="row">
                                
                                    <div class="col-md-12">
                                        <input name="password" class="form-control" type="password" placeholder="Current Password">
                                    </div>
                                    <div class="col-md-6">
                                        <input name="passwordNew" class="form-control" type="password" placeholder="New Password">
                                    </div>
                                    <div class="col-md-6">
                                        <input name="passwordConfirm" class="form-control" type="password" placeholder="Confirm Password">
                                    </div>
                                    <div class="col-md-12">
                                        <button type="submit" class="btn">Save Changes</button>
                                    </div>
                                    
                                </div>
                                </form>
                            </div>              
                        </div>
                        </div>
                     

                </div>
                <!-- /.container-fluid -->
                    
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->
        
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

  

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
   
    <script src="${pageContext.request.contextPath }/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/js/demo/datatables-demo.js"></script>
</body>
</html>