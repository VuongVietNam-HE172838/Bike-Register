<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/sidebar.css">
    <title>User Panel</title>

    <!-- bootstrap5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-
              iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/Zpi
              Bw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- font ăesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!-- bootstrap5 5icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <!-- boxincon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        
        <link rel="stylesheet" href="CSS/admin_blog_dashboard.css"/>
        <link rel="stylesheet" href="CSS/header.css" />
        
        <style>
            .stats {
                font-size: 18px;
                position: absolute;
                top: 20px;
            }
            
            .card-i {
                margin-top: 10px;
                margin-right: 10px;
            }
            
            .right-info {
                text-shadow: 0px 0px 1px black;
            }
            

            .card-footer a:hover {
                text-shadow: 0px 0px 1px #2c464f;
            }
        </style>

</head>

<body>
    
    <header id="my-header">

                <div class="my-logo">
                    <i class="fa-solid fa-shield-halved fa-2xl" style="color: #fdd12d;"></i>
                    <span>G5insurance</span>

                </div>
                <!-- menu icon -->

                <div class="bx bx-menu" id="my-menu-icon"></div>


                

                <!-- pro5 -->
                <div class="my-profile">
                    <c:if test="${sessionScope.user != null}">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-bs-toggle="dropdown" style="text-decoration: none;">
                                <img src=" " alt="">
                                <span id="my-username" style="color: black;">
                                    ${sessionScope.user.name}
                                </span>
                            </a>

                            <div class="dropdown-menu" aria-labelledby="navbarDropdown"
                                style="background-color: #fdd12d;">
                                <!-- Dropdown menu items -->
                                <a class="dropdown-item" href="UserProfile.jsp">Profile</a>
                                
                                

                                <!--phân quyền admin-->
                                <c:if test="${sessionScope.user.role.equals('admin')}">
                                    <a class="dropdown-item" href="admin_dashboard">Trang quản lý</a>
                                </c:if>


                                <a class="dropdown-item" href="logout">Đăng xuất</a>

                            </div>
                        </li>
                    </c:if>



                    <c:if test="${sessionScope.user == null}">
                        <ul class="navbar-nav menutrai">
                            <li class="d-flex align-items-center float-right" id="btnlogin">
                                <a href="Login.jsp"
                                    style="padding: 8px; text-decoration: none; text-shadow: 0px 0px 1px #2c464f; color: #2c464f;">
                                    <i class="fa fa-user" style="color: #2c464f"></i>
                                    Đăng nhập
                                </a>

                            </li>
                        </ul>
                        <ul class="navbar-nav menutrai">
                            <li class="d-flex align-items-center float-right" id="btnlogin">
                                <a href="Register.jsp"
                                    style="padding: 8px; text-decoration: none; text-shadow: 0px 0px 1px #2c464f; color: #2c464f;">
                                    <i class="fa fa-user" style="color: #2c464f"></i>
                                    Đăng ký
                                </a>
                            </li>
                        </ul>
                    </c:if>


                </div>
            </header>

    
    <div class="container-fluid">
                <div class="row">
                    <div class="col min-vh-100 p-4">
                        <div class="container mt-5">

                            <div class="my-row row">

                                <div class="my-column1 col-md-12">
                                    <h4 style="text-align: center; font-weight: bold;">Lịch sử đăng ký</h4>
                                    <br>
<!--                                    <div style="text-align: center;">
                                        <a href="UserInsuranceList?status=active" class="btn btn-warning">Đang hiệu lực</a>
                                        <a href="UserInsuranceList?status=expired" class="btn btn-warning">Hết hiệu lực</a>
                                        <a href="UserInsuranceList?status=pending" class="btn btn-warning">Đang chờ phê duyệt</a>
                                    </div>-->
                                    
                                    
                                    
                                    <div class="row" style="margin-top: 20px;">

                                    <c:forEach items="${listbike}" var="b">

                                        <div class="col-md-6 mb-3">
                                            <div class="card text-dark h-100">
                                                
                                                    <div class="card-body py-5 d-flex">
                                                        <div class="col-sm-6">
                                                            <span class="left-info">Chủ sở hữu:</span>
                                                            <br>
                                                            <br>
                                                            <span class="left-info">Tên xe:</span>
                                                            <br>
                                                            <br>
                                                            <span class="left-info">Số khung:</span>
                                                            <br>
                                                            <br>
                                                            <span class="left-info">Ngày đăng ký:</span>
                                                            <br>
                                                            <br>
                                                            <span class="left-info">Trạng thái:</span>
                                                            
                                                        </div>
                                                        <div class="col-sm-6 " style="text-align: right">
                                                            <span class="right-info">${sessionScope.user.getName()}</span>
                                                            <br>
                                                            <br>
                                                            <span class="right-info " >${b.getName()}</span>
                                                            <br>
                                                            <br>
                                                            <span class="right-info " >${b.getSokhung()}</span>
                                                            <br>
                                                            <br>
                                                            <span class="right-info creationDateHere" id="creationDate">${b.getNgaydk()}</span>
                                                            <br>
                                                            <br>
                                                            <c:if test="${b.getVerify()=='1'}">
                                                                <span class="right-info" style="">Đã duyệt</span>
                                                            </c:if>
                                                            <c:if test="${b.getVerify()=='0'}">
                                                                <span class="right-info">Đang duyet </span>
                                                            </c:if>
                                                        </div>
                                                        
                                                        
                                                    </div>
                                               

                                            </div>
                                        </div>

                                    </c:forEach>



                                    </div>


                                </div>
                    </div>
                </div>
            </div>
        </div>


    <!--Jquery-->
    
    
    
        <script>
            function setCurrentDate() {
                var currentDate = new Date();
                var formattedDate = currentDate.toISOString().split('T')[0];
                document.getElementById("creationDate").value = formattedDate;
            }
            setCurrentDate();

            function changeDateFormat() {
                var dateElements = document.getElementsByClassName("creationDateHere");

                for (var i = 0; i < dateElements.length; i++) {
                    var oldDateText = dateElements[i].textContent;
                    var dateParts = oldDateText.split('-');
                    var day = dateParts[0];
                    var month = dateParts[1];
                    var year = dateParts[2];
                    var newDateFormat = year + '/' + month + '/' + day;
                    dateElements[i].textContent = newDateFormat;
                }
            }
            changeDateFormat();
        </script>
    
</body>

</html>