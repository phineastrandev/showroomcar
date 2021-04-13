<%-- 
    Document   : AddCarSuccess
    Created on : Mar 6, 2021, 2:29:41 PM
    Author     : tranp
--%>

<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<c:if test="${empty USER || USER.role !=1}">
    <c:redirect url="adminLogin.jsp">
    </c:redirect>
</c:if>


<div class="jumbotron text-center" style="margin-top: 200px; font-size: 18px;">
    <h1 class="display-3">Đã thêm xe thành công!</h1>
    <hr>
    <p>
        Thêm thông số cho xe <a href=""data-toggle="modal" data-target="#exampleModal">==================></a>
    </p>
    <p class="lead">
        <a class="btn btn-primary btn-sm"  style=" font-size: 14px;" href="WebLab231GroupAssignment/home" role="button">Trở lại bảng điều khiể</a>
    </p>
</div>
<form action="WebLab231GroupAssignment/AddCarDetail" method="POST">
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm chi tiết xe </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="text" class="modalTextInput form-control" placeholder="Dài rộng cao" name="lwh" required/>
                </div>
                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Chiều dài cơ sở" name="wheelbase" required/>
                </div>

                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Ngầm xe" name="fulload" required />
                </div>
                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Nhiên liệu" name="fuel" required />
                </div>
                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Động cơ" name="enginer" required />
                </div>
                
                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Thời gian tăng tốc" name="time_per_100" required />
                </div>
                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Hộp số" name="gear" required />
                </div>
                <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Ảnh xe" name="img_list" required />
                </div>
                 <div class="modal-body">
                    <input class="modalTextInput form-control" placeholder="Trả trước" name="pre_order" required />
                </div>
                <div class="modal-footer">
                    <button type="submit" class="saveEdit btn btn-primary">Thêm</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@ include file="/includes/footer.jsp" %>
