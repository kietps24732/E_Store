<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<%@ taglib  uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin 2 - Tables</title>

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
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="${pageContext.request.contextPath }/views/Admin/slideAdmin.jsp"></jsp:include>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <jsp:include page="${pageContext.request.contextPath }/views/Admin/navAdmin.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="container-fluid">
				<a href="${pageContext.request.contextPath}/index/category" class="btn btn-secondary mb-3"><i class="bi bi-sign-turn-left"></i> Quay lại</a> 
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Edit Catagoy</h1>
                	

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"> Loại Hàng</h6>
                        </div>
                        <div class="card-body">
                       			
							<form:form  action="${pageContext.request.contextPath}/index/category/save" modelAttribute="category" method="POST">													  
							 
							  <div class="row mb-3">
							    <label for="inputEmail3" class="col-sm-2 col-form-label">Id:</label>
							    <div class="col-sm-10">
							      <form:input path="id" cssClass="form-control" />			            
							    </div>
							  </div>
								
							
							   <div class="row mb-3">
							    <label for="inputEmail3" class="col-sm-2 col-form-label">Name:</label>
							    <div class="col-sm-10">
							      <form:input path="name" cssClass="form-control" />
							      
							    </div>
							  </div>							 		 	
				                            <button class="btn btn-primary mt-3"><i class="bi bi-folder-check"></i>  Update</button>
				                            <button formaction="${pageContext.request.contextPath}/index/category/delete" formmethod="post" class="btn btn-danger mt-3"><i class="bi bi-trash3"></i> Delete</button>						
							</form:form>
                           
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