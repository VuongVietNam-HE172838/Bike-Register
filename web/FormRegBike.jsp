<%-- Document : FormVatChat Created on : Oct 19, 2023, 8:59:21 PM Author : chun --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form Vat Chat</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <style>
            body {
                background-color: #fdd12d !important;
                font-size: 14px !important;
            }

            .info_motobike {
                padding: 15px;
                background-color: rgb(255, 255, 255);
                border: 1px solid rgb(157, 151, 151);
                border-radius: 7px;
            }

            .general-dr {
                width: 100%;
                height: 40px;
                outline: none;
                border-radius: 5px;
                border: 1px solid hsl(213, 15%, 85%);
            }

            .payment {
                padding: 10px;
                background-color: rgb(255, 255, 255);
                border: 1px solid rgb(157, 151, 151);
                border-radius: 7px;

            }

            .payment button {
                width: 100%;
                background-color: hsl(244, 43%, 46%);
                color: white;
                font-weight: bolder;
                border: none;

            }

            .payment button:hover {
                background-color: #fdd12d;
            }

            .errmsg {
                color: red;

            }

            #mySelect option[disabled] {
                color: grey;
                /* Màu chữ mờ */
            }

            .tooltip-container {
                    position: relative;
                    display: inline-block;
                }

                .tooltip-content {
                    position: absolute;
                    background-color: #fdd12d;
                    color: black;
                    border: 1px solid #2c464f;
                    border-radius: 4px;
                    padding: 10px;
                    z-index: 1;
                    width: 200px;
                    /*top: -30px; */
                    left: 50%;
                    transform: translateX(-50%);
                    transition: opacity 0.1s ease-in-out, visibility 0.1s ease-in-out;
                    opacity: 0;
                    visibility: hidden;
                }

                .tooltip-container:hover .tooltip-content {
                    opacity: 1;
                    visibility: visible;
                    transition-delay: 0.1s;
                }

        </style>

    </head>

    <body>
        <jsp:include page="Part/header.jsp"></jsp:include>

            <form action="registerBike" method="POST" style="margin-top: 100px;">
                <div class="container form_TNDS">
                    <div class="row">
                        <div class="col-md-8 info_motobike">
                            <div id="form_TNDS">

                                <h5 style="font-weight: bold"><i class="fa-solid fa-car"></i> Thông tin về xe</h5>
                                <div class="row">
                                    <div class="col-md-6">
                                        <!--------------------- Hãng xe --------------------->
                                        <div>

                                            <label>Hãng xe<span class="errmsg" style="color: red;"> *</span></label><br />

                                            <input type="text" class="form-control" name="input-brand" >
                                        </div>
                                    <!--------------------- Hieu xe --------------------->
                                    <div>
                                        <br>

                                        <label>Hiệu xe <span class="errmsg" style="color: red;"> *</span></label>

                                        <input type="text" class="form-control" name="input-bikename" >
                                    </div>
                                    <!---------------------So may------------------------>
                                    <br>
                                    <div>

                                        <label>Ngày đăng ký</label>

                                        <input class="form-control" type="text" name="date" value="${currentDate}" readonly>
                                    </div>

                                </div>

                                <!--------------------- BKS --------------------->
                                <div class="col-md-6">
                                    <div>

                                        <label>Số máy<span class="errmsg" style="color: red;"> *</span></label>

                                        <input class="form-control" type="text" name="input-somay">
                                        ${msg1}
                                    </div>
                                    <br>
                                    <!--------------------- so khung --------------------->
                                    <div>

                                        <label>Số khung<span class="errmsg" style="color: red;"> *</span></label>

                                        <input class="form-control" type="text" name="input-soKhung">
                                        ${msg}
                                    </div>
                                </div>
                            </div>

                            

                                <div id="vehicle_owner_information">
                                    <h5 style="margin-top: 10px; font-weight: bold"> <i
                                            class="fas fa-address-card"></i> Thông tin chủ xe
                                    </h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Số CCCD/CMT/Hộ chiếu</label>
                                            <input id="user_iden2" class="form-control" type="text" readonly=""
                                                   value="${sessionScope.user.getCccd()}">
                                            <label>Tên</label>
                                            <input id="user_fullName" class="form-control" type="text"
                                                   readonly="" value="${sessionScope.user.getName()}">
                                            <label>Email</label>
                                            <input id="user_email2" class="form-control"
                                                   type="email"" readonly="" value="
                                                   ${sessionScope.user.getEmail()}">
                                        </div>
                                        <div class=" col-md-6">
                                            <label>Số điện thoại</label>
                                            <input id="user_phoneNum2" class="form-control" type="number"
                                                   readonly value="${sessionScope.user.getPhone()}">
                                            <label>Ngày sinh</label>
                                            <input id="user_dob2" class="form-control" type="date" readonly
                                                   value="${sessionScope.user.getDob()}">
                                            <label>Địa chỉ</label>
                                            <input id="user_address2" class="form-control" type="text" readonly
                                                   value="${sessionScope.user.getAddress()}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                        <input type="submit" class="btn" name="xacnhan" value="Xac nhan">
                        
                    
                    

                    </div>
        </form>

        


</body>
</html>