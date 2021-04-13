<%-- 
    Document   : adminModifyCar
    Created on : Feb 20, 2021, 8:51:38 PM
    Author     : tranp
--%>


<%@ include file="/includes/admin/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4">Modify Account</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="ShowCarAdmin">Show Car</a></li>
                <li class="breadcrumb-item active">Modify</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                    <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                    .
                </div>
            </div>
            <form action="UpdateCar" method="POST" class="needs-validation" novalidate>
               
                <div class="form-row">
                   <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Tên</label>
                        <input type="text" name="name" class="form-control" id="validationCustom05"  value="${carDetail.name}" required>
                        <input type="hidden" name="id" value="${carDetail.id}" />
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Giá bán</label>
                        <input type="text" name="price" class="form-control" id="validationCustom04" value="${carDetail.price}"   >
                        <div class="invalid-feedback">
                            Please provide a valid.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Hộp số</label>
                        <input type="text" name="gear" class="form-control" id="validationCustom05"  value="${carDetail.gear}"  required>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Dài rộng cao</label>
                        <input type="text" name="lwh" class="form-control" id="validationCustom05" value="${carDetail.getLxWxH()}"    required>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Chiều dài cơ sở</label>
                        <input type="text" name="wheelbase" class="form-control" id="validationCustom05"  value="${carDetail.wheelbase}" required>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                        <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Khoảng sáng gầm</label>
                        <input type="text" name="fulload" class="form-control" id="validationCustom05"  value="${carDetail.fullload}" required>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                        <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Nhiên liệu tiêu thụ</label>
                        <input type="text" name="fuel" class="form-control" id="validationCustom05"  value="${carDetail.fuel}" required>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                        <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Chỉnh sửa màu xe</label>
                        <a href="ShowColor?id_car=${carDetail.id}"><button type="button"  class="form-control" >Go</button></a>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Sure to update this one?
                        </label>
                        <div class="invalid-feedback">
                            You must agree before submitting.
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">Submit form</button>
            </form>


        </div>
    </main>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
    <%@ include file="/includes/admin/footer.jsp" %>
