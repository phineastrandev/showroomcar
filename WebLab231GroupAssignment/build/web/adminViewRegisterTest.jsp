<%-- 
    Document   : adminViewRegisterTest
    Created on : Feb 23, 2021, 12:41:18 AM
    Author     : tranp
--%>

<%@ include file="/includes/admin/header.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

</head>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4">Tables</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
                <li class="breadcrumb-item active">Tables</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    Dưới đây là danh sách khách hàng đăng ký mượn xe.
                    <a  href="showReturnedCar">Xem danh sách khách hàng đã trả xe</a>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Bảng tài khoản
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <th>Tên xe</th>
                                    <th>Ngày mượn</th>
                                    <th>Số điện thoại/Email</th>
                                    <th>Ghi chú</th>
                                    <th>Trả xe || Xóa yêu cầu</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <th>Tên xe</th>
                                    <th>Ngày mượn</th>
                                    <th>Số điện thoại/Email</th>
                                    <th>Ghi chú</th>
                                    <th>Trả xe || Xóa yêu cầu</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach items="${list}" var="item" >
                                    <tr>
                                        <td>${item.fullname}</td>
                                        <td>${item.name_car}</td>
                                        <td>${item.date}</td>
                                        <td>${item.phone} / ${item.email}</td>
                                        <td>${item.note}</td>
                                        <td><button onclick="myFunction()"><a href="UpdateRegister?id_register=${item.id}"><i class="fas fa-truck-pickup"></i></a></button> ----||--- <button onclick="return confirm('Bạn có chắc chắn muốn xóa?')"><a style="color: red;" href="DeleteCarBorrow?id_register=${item.id}"><i class="fas fa-ban"></i></a></button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </main>
    <script>
        function myFunction() {
            alert("Bạn có chắc chắn làm điều này?")
        }
    </script><script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <%@ include file="/includes/admin/footer.jsp" %>