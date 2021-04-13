<%-- 
    Document   : adminViewerPage
    Created on : Feb 20, 2021, 3:34:37 PM
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
            <h1 class="mt-4">Số lượng truy cập</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="admin">Dashboard</a></li>
                <li class="breadcrumb-item active">Số lượng truy cập</li>
            </ol>
           
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Bảng dữ liệu
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Tên trang</th>
                                    <th>Số lượt truy cập</th>
                                    <th>Ngày truy cập mới </th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Tên trang</th>
                                    <th>Số lượt truy cập</th>
                                    <th>Ngày truy cập mới </th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach items="${list}" begin="0" end="5" var="item">
                                    <tr>
                                        <td>${item.name_page}</td>
                                        <td>${item.viewer}</td>
                                        <td>${item.date}</td>
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