<%-- 
    Document   : profileCustomer
    Created on : Feb 23, 2021, 11:04:26 AM
    Author     : tranp
--%>

<%@ include file="/includes/header.jsp" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/profile.css" media="all" />


</head>
<c:if test="${ empty USER }">
    <c:redirect url="adminLogin.jsp">
    </c:redirect>
</c:if>

<div class="container" style="margin-top: 150px; font-size: 18px;">
    <h2 class="text-center text-danger">${mess}</h2>
    <div class="row my-2">
        <div class="col-lg-8 order-lg-2">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Thông tin</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#messages" data-toggle="tab" class="nav-link">Các hoạt động</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Chỉnh sửa</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <h5 class="mb-3" >Thông tin cá nhân</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <h4>Họ Và Tên</h4>
                            <p>
                                ${profileUser.name}
                            </p>
                            <h4>Email</h4>
                            <p>
                                ${profileUser.email}
                            </p>
                            <h4>Số điện thoại</h4>
                            <p>
                                ${profileUser.phone}
                            </p>

                        </div>

                        <div class="col-md-12">
                            <h4 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span> Mô tả</h4>
                            <table class="table table-sm table-hover table-striped">
                                <tbody>                                    
                                    <tr>
                                        <td>
                                            ${profileUser.description}
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--/row-->
                </div>
                <div class="tab-pane" id="messages">

                    <c:if test="${car.borrowed !=0}">
                        <div class="alert alert-info alert-dismissable">
                            <a class="panel-close close" data-dismiss="alert">×</a> This is an <strong>.alert</strong>. Use this to show important messages to the user.
                        </div>
                        <table class="table table-hover table-striped">
                            <tbody>                                    
                                <tr>
                                    <td>
                                        <span class="float-right font-weight-bold"><a href="#"  data-toggle="modal" data-target="#myModal">Xác nhận đã lái thử</a> || <c:if test="${car.borrowed == 1}"> <a href="#"  data-toggle="modal" data-target="#exampleModal">Yêu cầu hủy</a></c:if> <c:if test="${car.borrowed == 2}" >Đang chờ xét duyệt</c:if></span> Xe đã đăng ký mượn: <strong class="text-danger"> ${car.name_car} </strong> <br> Thời gian mượn:  <strong class="text-danger"> ${car.date} </strong>
                                        </td>
                                    </tr>
                                </tbody> 
                                </table> </c:if>
                    </div>
                    <div class="tab-pane" id="edit">
                        <form role="form" action="WebLab231GroupAssignment/updateAccountClient" method="POST">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Họ Và Tên</label>
                                <div class="col-lg-9">
                                    <input style="font-size: 18px;" class="form-control" type="text" name="name" value="${profileUser.name}">
                                <input  type="hidden" name="id" value="${USER.id}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Số điện thoại</label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" class="form-control" name="phone" type="text" value="${profileUser.phone}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" class="form-control" type="email" value="${profileUser.email}" name="email">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Mô tả bản thân</label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" class="form-control" type="text" name="des" value="${profileUser.description}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Địa chỉ</label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" class="form-control" type="text" name="address" value="${profileUser.address}" placeholder="Street">
                            </div>
                        </div>
                        <div class="form-group row">
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Password</label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" class="form-control" name="pass" type="password" value="${profileUser.pass}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Confirm password</label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" class="form-control" name="repass" type="password" value="${profileUser.pass}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input style="font-size: 18px;" type="reset" class="btn btn-secondary" value="Cancel">
                                <input style="font-size: 18px;" onclick="return confirm('Bạn có chắc chắn với thao tác này?')" type="submit" id="ibuttonuser" class="btn btn-primary" value="Save Changes">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 order-lg-1 text-center">
            <img style="vertical-align: middle;
                 width: 250px;
                 height: 250px;
                 border-radius: 50%;" src="${profileUser.avatar}" class="mx-auto img-fluid img-circle d-block avatar" alt="avatar"/>
            <h6 class="mt-2">Tải ảnh khác</h6>
            <label class="custom-file">
                <input type="button" id="file" name="" class="custom-file-input" data-toggle="modal" data-target="#uploadImage"ssssssssssssssssssss>
                <span class="custom-file-control">Chọn ảnh</span>
            </label>
        </div>

    </div>


    <!--Division for Modal-->
    <form id="myModal" class="modal fade" role="dialog" action="WebLab231GroupAssignment/AddFeedBackCarBorrow" method="POST">
        <!--Modal-->
        <div class="modal-dialog">
            <!--Modal Content-->
            <div class="modal-content">
                <!-- Modal Header-->
                <div class="modal-header">
                    <h3>Đánh giá xe</h3>
                    <!--Close/Cross Button--> <button type="button" class="close" data-dismiss="modal" style="color: white;">&times;</button>
                </div> <!-- Modal Body-->
                <div class="modal-body text-center"> <i class="far fa-file-alt fa-4x mb-3 animated rotateIn icon1"></i>
                    <h3>Ý kiến của bạn về xe của chúng tôi</h3>
                    <h5>Giúp chúng tôi hoàn thiện hơn? <strong>Làm ơn cho chúng tôi biết về cảm nhận của bạn.</strong></h5>
                    <hr>
                </div> <!-- Radio Buttons for Rating-->
                <!--Text Message-->
                <div class="text-center">
                    <h4>Những gì mà chúng tôi cần cải thiện?</h4>
                </div> <textarea type="textarea" placeholder="Your Message" required name="feedback" rows="3"></textarea>
                <input name="id_turn_borrow" type="hidden" value="${car.id}"/><!-- Modal Footer-->
                <div class="modal-footer"> <input style="font-size: 18px;" type="submit" class="btn btn-primary" value="Gửi"> <input style="font-size: 18px;" type="submit" class="btn btn-primary" data-dismiss="modal" value="Hủy"> </div>
            </div>
        </div>
    </form>

    <!-- Modal -->
    <form action="WebLab231GroupAssignment/RequireCancel" method="POST" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc xác nhận muốn hủy</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input name="id_turn_borrow" type="hidden" value="${car.id}"/>
                    <input name="note" type="hidden" class="btn btn-primary" value="Yêu cầu hủy lịch mượn gần nhất">
                </div>
                <div class="modal-footer">
                    <input style="font-size: 18px;" type="submit" class="btn btn-primary" value="Xác nhận"> <input style="font-size: 18px;" type="submit" class="btn btn-primary" data-dismiss="modal" value="Hủy">
                </div>
            </div>
        </div>
    </form>

    <form action="WebLab231GroupAssignment/updateAvatar" method="POST">
        <div class="modal fade" id="uploadImage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Gán link ảnh vào đây</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input style="font-size: 18px;" name="avatar" type="text" class="form-control">
                        <input name="id_cus" type="hidden" value="${USER.id}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" style="font-size: 18px;" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <input style="font-size: 18px;" type="submit" class="btn btn-primary" value="Lưu"/>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@ include file="/includes/footer.jsp" %>


