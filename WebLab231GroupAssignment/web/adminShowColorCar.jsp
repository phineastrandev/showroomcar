<%-- 
    Document   : ShowColorCar
    Created on : Feb 20, 2021, 10:05:08 AM
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
                    Dưới đây là dữ liệu về các bài đăng.
                    .<a href="" data-toggle="modal" data-target="#exampleModal">Thêm màu xe</a>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Bảng màu xe
                </div>
                <jsp:useBean id="cl" scope="page" class="Dao.CarDAO"></jsp:useBean>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Tên xe</th>
                                        <th>Ảnh màu</th>
                                        <th>Tên màu</th>
                                        <th>Mã màu</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Tên xe</th>
                                        <th>Ảnh màu</th>
                                        <th>Tên màu</th>
                                        <th>Mã màu</th>
                                        <th>Xóa</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${listColor}" var="item">
                                    <tr>
                                       
                                        <td>${cl.getCarByID(item.id_car)}</td>
                                        <td style="background-color: ${item.getColor_code()}"><span></span></td>
                                        <td>${item.getColor()}</td>
                                        <td>${item.getColor_code()}</td>
                                        <td><a onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="DeleteColor?id_color=${item.id}"><i class="fas fa-user-slash"></i></a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <form action="addColorCar" method="POST">
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thêm màu cho xe </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="color" class="modalTextInput form-control" placeholder="ID màu" name="id_color" required/>
                            </div>
                            <div class="modal-body">
                                <input class="modalTextInput form-control" placeholder="Tên màu màu" name="name_color" required/>
                            </div>

                            <div class="modal-body">
                                <input class="modalTextInput form-control" placeholder="Ảnh của màu xe" name="img_color" required />
                            </div>
                            <div class="modal-body">
                                <input type="text"  name="id_car" value="${id_car}"/>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="saveEdit btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>
    <%@ include file="/includes/admin/footer.jsp" %>