<%-- 
    Document   : adminTables
    Created on : Feb 19, 2021, 9:48:06 AM
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
                <li class="breadcrumb-item active">Tables</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    Dưới đây là dữ liệu về tài khoản của khách hàng và các nhân sự trong showroom xe.
                    .
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
                                    <th>Tên</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Phone</th>
                                    <th>Xóa</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                     <th>Tên</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Phone</th>
                                    <th>Xóa</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach items="${listAccount}" var="item">
                                    <tr>
                                        <td>${item.name}</td>
                                        <td>${item.email}</td>
                                        <td>${item.role}</td>
                                        <td>${item.phone}</td>
                                        <td><a onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="DeleteAcc?id_acc=${item.id}"><i class="fas fa-user-slash"></i></a></td>
                                        <td><a href="DisplayAccountByID?id_account=${item.id}"><i class="fas fa-edit"></i></a></td>
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