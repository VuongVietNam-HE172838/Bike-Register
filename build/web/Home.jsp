<%-- 
    Document   : Home.jsp
    Created on : Sep 19, 2023, 10:33:06 PM
    Author     : chun
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/home.css">
        <link rel="stylesheet" href="CSS/header.css" />
        <title>Document</title>

        <!-- bootstrap 4.0-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>

        
        <!-- font ăesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



    </head>
    <body>
        <!--header-->
        <jsp:include page="Part/header.jsp"></jsp:include>

            <!-- body -->
            <div style="background-color: #f5f5f5; padding-top: 2px; padding-bottom: 15px; margin-bottom: 100px;">
                <ul class="my-navbar" style="margin-top: 30px; margin-left: 470px;">
                    <li class="dropdown">
                        <a class="" href="/IMS_InsuranceManageSystem/">Trang chủ</a>
                    </li>
                    <li class="dropdown">
                        <a href="listInsuranceProduct">Dịch vụ</a>
                        
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-bs-toggle="dropdown">Thông tin</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!-- Dropdown menu items -->
                            <a class="dropdown-item" href="#">Tra cứu đăng ký xe</a>
                            <a class="dropdown-item" href="regbike">Lịch sử đăng ký xe</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a class="" href="#">Giới thiệu</a>
                    </li>
                </ul>    
            </div>
                    

            <!--Product list-->
            <section class="container products">
                <h3 class="text-center">Dịch vụ</h3>
                <div class="row">
                    
                    <a href="registerBike" class="col-lg-6 col-sm-6 text-center" style="text-decoration: none; text-shadow: 0px 0px 1px #2c464f; color: #2c464f;">
                        <img src="Image/motorcycle2.png" alt="">
                        <span class="d-block mt-3">Đăng ký mới</span>
                    </a>
                    <a href="listbike" class="col-lg-6 col-sm-6 text-center" style="text-decoration: none; text-shadow: 0px 0px 1px #2c464f; color: #2c464f;">
                        <img src="Image/motorcycle2.png" alt="">
                        <span class="d-block mt-3">Tra cứu</span>
                    </a>
                    
                    <div class="col-sm-2"></div>
                </div>
            </section>

            <!-- footer -->
        <jsp:include page="Part/footer.jsp"></jsp:include>










    </body>
</html>
