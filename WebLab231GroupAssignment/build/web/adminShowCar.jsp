<%-- 
    Document   : ShowCar
    Created on : Feb 20, 2021, 10:05:08 AM
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
                    Dưới đây là các loại xe hiện có
                    <a target="_blank" href="" data-toggle="modal" data-target="#exampleModal">Thêm mới xe</a>
                    .<h6 class="text-left text-danger">${ThemOkk}</h6>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Bảng xe
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Tên xe</th>
                                    <th>Giá bán</th>
                                    <th>Nhãn hiệu</th>
                                    <th>Ảnh xe</th>
                                    <th>Xóa</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Tên xe</th>
                                    <th>Giá bán</th>
                                    <th>Nhãn hiệu</th>
                                    <th>Ảnh xe</th>
                                    <th>Xóa</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach items="${listCar}" var="item">
                                    <tr>
                                        <td>${item.name}</td>
                                        <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}"/></td>
                                        <td>${item.brand}</td>
                                        <td><img width="375" height="219" src="${item.img_list}"/></td>
                                        <td><a onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="DeleteCar?id_car=${item.id}"><i class="fas fa-ban"></i></a></td>
                                        <td><a href="AdminCarDetail?id=${item.id}"><i class="fas fa-edit"></i></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <form action="AddCar" method="POST">
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thêm xe </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="text" class="modalTextInput form-control" placeholder="Tên xe" name="name" required/>
                    </div>
                    <div class="modal-body">
                        <input class="modalTextInput form-control" placeholder="Nhãn hiệu" name="brand" required/>
                    </div>

                    <div class="modal-body">
                        <input class="modalTextInput form-control" placeholder="Giá xe" name="price" required />
                    </div>
                    <div class="modal-body">
                        <input class="modalTextInput form-control" placeholder="Ảnh xe" name="image" required />
                    </div>
                    <div class="modal-body">
                        <input class="modalTextInput form-control" placeholder="Link xe ( dưới 20 ký tự)" name="url" required />
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="saveEdit btn btn-primary">Thêm</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <%@ include file="/includes/admin/footer.jsp" %>