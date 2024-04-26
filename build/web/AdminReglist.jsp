

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách bảo hiểm</title>

        <!-- bootstrap5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>-->

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-
              iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/Zpi
              Bw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- bootstrap5 5icon -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link rel="stylesheet" href="CSS/admin_blog_dashboard.css"/>

    </head>
    <body>

        <!--header-->
        <jsp:include page="Part/header.jsp"></jsp:include>


            <!--sidebar-->





            <!-- ---------------------------------------------------------------------------------------------------------------------------- -->



            <div class="container-fluid">
                <div class="row">
                    <div class="col min-vh-100 p-4">
                        <div class="container mt-5">

                            <div class="my-row row">

                                <!-- Column 1: Blog Post Table -->
                                <div class="my-column1 col-md-9">
                                    <h2 style="display: inline-block;">Yêu cầu đăng ký</h2>
                                    <!--                                    go to blog page-->

                                    <!-- Blog Post Table -->
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Chủ sở hữu</th>
                                                <th>Hãng</th>
                                                <th>Xe</th>
                                                <th>Số khung</th>
                                                <th>Số máy</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Example row, you can use a loop to generate rows dynamically -->
                                        <c:forEach items="${listbike}" var="b">
                                            <tr>

                                                <td>${b.getUid()}</td>
                                                <td>${b.getBrand()}</td>
                                                <td>${b.getName()}</td>
                                                <td>${b.getSokhung()}</td>
                                                <td>${b.getSomay()}</td>
                                                <c:if test="${b.getVerify()=='1'}">
                                                    <td>Đã duyệt</td>
                                                </c:if>
                                                <c:if test="${b.getVerify()=='0'}">
                                                    <td>Chờ duyet</td>
                                                </c:if>
                                                <td>
                                                    <!-- Edit Button -->
                                                    <a href="adminRegDetail?mod=detail&sokhung=${b.getSokhung()} " class="my-btn btn btn-primary">Chi tiết</a>
                                                </td>
                                            </tr>
                                        </c:forEach>    
                                        <!-- Repeat rows for each blog post -->
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>






    </body>
</html>
