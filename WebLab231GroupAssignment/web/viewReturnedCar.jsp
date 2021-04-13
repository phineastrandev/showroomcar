<%-- 
    Document   : viewReturnedCar
    Created on : Feb 23, 2021, 12:56:15 AM
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
            <h1 class="mt-4">Tables</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="showRegisterTest">Quay lại</a></li>
            </ol>
           
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Bảng đã trả xe
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
                                    <th>Trả xe</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Tên khách hàng</th>
                                    <th>Tên xe</th>
                                    <th>Ngày mượn</th>
                                    <th>Số điện thoại/Email</th>
                                    <th>Ghi chú</th>
                                    <th>Trả xe</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                        <td>${item.fullname}</td>
                                        <td>${item.name_car}</td>
                                        <td>${item.date}</td>
                                        <td>${item.phone} / ${item.email}</td>
                                        <td>${item.note}</td>
                                        <td><i class="fas fa-check-circle"></i></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@ include file="/includes/admin/footer.jsp" %>
