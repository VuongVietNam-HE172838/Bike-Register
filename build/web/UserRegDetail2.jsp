<%-- Document : Staff_ContractRequest_detail Created on : Nov 2, 2023, 12:40:04 AM Author : pc minh --%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết yêu cầu</title>
        
        <!-- bootstrap5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>

        <!--//font awéome-->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <style>
            .myimg {
                margin-right: 10px;
                max-width: 63px;
                object-fit: cover;
                object-position: center;
                box-shadow: 0 0 10px #2c464f;
            }

            #main-container {
                box-shadow: 0 33px 61px -29px rgb(0 0 0/80%);
                object-fit: cover;
                border-radius: 25px;
            }
            .mybtn {
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1) ;
                border-radius: 5px ;
                border: none ;
                cursor: pointer ;
                transition: box-shadow 0.3s ease ;
                margin-right: 10px
            }
            .mybtn:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
            }

            .swal2-cancel{
                margin-right: 10px !important;
            }
        </style>
    </head>
    <body style="background-color: hsl(47,98%,58%);">
        <jsp:include page="Part/header.jsp"></jsp:include>
            <form class="form-info" id="turung" style="margin-top: 150px" method="POST" action="UserClaimListSV" enctype="multipart/form-data">
                <div>
                    <div class="container bg-white mt-5 mb-5" id="main-container">
                        <div class="row">
                            <!--Thông tin chi tiết yêu cầu-->
                            <div class="col-md-5 ">
                                <div class="d-flex justify-content-center mt-3 mb-3">
                                    <h4>Chi tiết yêu cầu đăng kí xe</h4>
                                </div>
                                <div>
                                    <table class="table " >
                                        <thead >
                                            <tr >
                                                <th scope="col">#</th>
                                                <th scope="col">Thông tin</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr scope="row">
                                                <th>Người đăng kí</th>
                                                <td>${u.getName()}</td>
                                        </tr>
                                        <tr scope="row">
                                            <th>Email</th>
                                            <td>${u.getEmail()}</td>
                                        </tr>
                                        <tr scope="row">
                                            <th>Số điện thoại</th>
                                            <td>
                                                ${u.getPhone()}
                                            </td>
                                        </tr >
                                        <tr scope="row">
                                            <th>Địa chỉ</th>
                                            <td>
                                                ${u.getAddress()}
                                            </td>
                                        </tr >
                                        <tr scope="row">
                                            <th>Ngày sinh</th>
                                            <td>
                                                ${u.getDob()}
                                            </td>
                                        </tr >
                                        <tr scope="row">
                                            <th>Cccd</th>
                                            <td>
                                                ${u.getCccd()}
                                            </td>
                                        </tr >
                                        
                                        <tr scope="row">
                                            <th>Trạng thái</th>
                                            <c:if test="${b.getVerify()=='1'}">
                                                    <td>Đã duyệt</td>
                                                </c:if>
                                                <c:if test="${b.getVerify()=='0'}">
                                                    <td>Chờ duyệt</td>
                                                </c:if>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <div class="col-md-2">
                            <div class="d-flex justify-content-center mt-5">
                                <h4></h4>
                            </div>
                            <div>

                            </div>
                        </div>
                        <!--Thông tin hợp đồng-->
                        <div class="col-md-5">
                            <div class="d-flex justify-content-center mt-3 mb-3">
                                <h4>Chỉ tiết yêu cầu</h4>
                            </div>
                            <div>
                                <table class="table " >
                                    <thead >
                                        <tr >
                                            <th scope="col">#</th>
                                            <th scope="col">Thông tin</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr scope="row">
                                            <th>Hãng xe</th>
                                            <td>${b.getBrand()}</td>
                                        </tr>
                                        <tr scope="row">
                                            <th>Hiệu xe</th>
                                            <td>${b.getName()}</td>
                                        </tr>
                                        <tr scope="row">
                                            <th>Số khung</th>
                                            <td>${b.getSokhung()}</td>
                                        </tr>
                                        <tr scope="row">
                                            <th>Số máy</th>
                                            <td>${b.getSomay()}</td>
                                        </tr>
                                        <tr scope="row">
                                            <th>Ngày đăng kí <i style="color: gray;font-size: 13px">(dd/mm/yyyy)</i></th>
                                            <td  class="creationDateHere" id="creationDate">
                                                ${b.getNgaydk()}</td>
                                        </tr >
                                        <!--===================================================================================================-->

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row ">
                        <div class="col-md-12  mb-3"><hr>
                            <div class="d-flex justify-content-center">
                                <a type="button" href="adminReglist?mod=back" class="btn btn-secondary mybtn">
                                    Trở lại
                                </a>
                                <a href="adminReglist?mod=reject&sokhung=${b.getSokhung()}" class="btn btn-danger mybtn" id="denyBtn">
                                    Từ chối
                                </a>
                                <a href="approve?sokhung=${b.getSokhung()}" class="btn btn-success mybtn" id="approveBtn" style="margin-right: 153px">
                                    Phê duyệt
                                </a>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </form>
                                        
                                        
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
                    var newDateFormat = year + '-' + month + '-' + day;
                    dateElements[i].textContent = newDateFormat;
                }
            }
            changeDateFormat();


        </script>                  
    </body>
</html>