<%-- 
    Document   : testdrive
    Created on : Jan 10, 2021, 10:45:43 AM
    Author     : PC
--%>

<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css3/css3.css" media="all" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<div class="clearfix"></div>      
<div style="background-color: white;" class="region region-content">

    <div id="block-vinfast-content" class="block block-system block-system-main-block">
        <form class="contact-us-form"  action="WebLab231GroupAssignment/addRegisterForm" method="POST" >
            <main class="page">
                <div class="vf-contact">
                    <div class="container">
                        <h3 class="title way-animate animated" data-animate="fadeInUp">Đăng ký lái thử xe</h3>
                        <h4 class="title way-animate animated" data-animate="fadeInUp">${Borrowed}</h4>
                        <div class="contact-form">

                            <div class="js-form-item form-item js-form-type-textfield form-type-textfield js-form-item-fullname form-item-fullname">
                                <label class="form-label js-form-required form-required" for="edit-fullname">Họ và tên</label>
                                <input class="form-input form-text required" data-drupal-selector="edit-fullname" type="text" id="edit-fullname" name="fullname" value="${USER.name}" size="60" maxlength="128" required="required" aria-required="true" />
                                <input type="hidden" name="id_user" value="${USER.id}"/>

                            </div>
                            <div class="form-group">
                                <div class="cols">
                                    <div class="col-6 col-md-12">
                                        <div class="js-form-item form-item js-form-type-email form-type-email js-form-item-email form-item-email">
                                            <label class="form-label" for="edit-email">Email</label>
                                            <input class="form-input form-email" data-drupal-selector="edit-email" type="email" id="edit-email" name="email" value="${USER.email}" size="60" maxlength="254" />

                                        </div>

                                    </div>
                                    <div class="col-6 col-md-12">
                                        <div class="js-form-item form-item js-form-type-tel form-type-tel js-form-item-phone form-item-phone">
                                            <label class="form-label js-form-required form-required" for="edit-phone">Số điện thoại</label>
                                            <input class="form-input form-tel required" data-drupal-selector="edit-phone" type="tel" id="edit-phone" name="phone" value="${USER.phone}" size="30" maxlength="128" required="required" aria-required="true" />

                                        </div>

                                    </div>                          
                                </div>


                            </div>  
                            <div class="js-form-item form-item js-form-type-textfield form-type-textfield js-form-item-address form-item-address">
                                <label class="form-label" for="edit-address">Ngày đặt</label>
                                <input class="form-input form-text" data-drupal-selector="edit-address" type="datetime-local" id="edit-address"  name="date" size="60" maxlength="128" placeholder="DD-MM-YYYY" required="required" aria-required="true"/>

                            </div>



                            <div class="form-group js-situation-row">
                                <label class="form-label">Loại xe</label>
                                <select class="form-control" name="id_car">
                                    <option value="1">Lux A2.0</option>
                                    <option value="2">Lux SA2.0</option>
                                    <option value="3">FADIL</option>
                                </select>
                            </div>	
                            <div class="js-form-item form-item js-form-type-textfield form-type-textfield js-form-item-address form-item-address">
                                <label class="form-label" for="edit-address">Ghi chú</label>
                                <input class="form-input form-text"  type="text" id="edit-address" name="note" size="60" maxlength="128" placeholder="nội dung" />

                            </div>
                            <div id="other-information" class="form-group">

                            </div>   

                            <div class="form-group">
                                <div class="text-center">
                                    <input autocomplete="off" data-drupal-selector="form-2wvzoroktikvj9bv8y70qres2nnrunacq1hvqcxabu" type="hidden" name="form_build_id" value="form--2WVZOrOkTIkVJ9BV8Y70QRES2nNrunAcQ1hvQcxabU" />
                                    <input data-drupal-selector="edit-contact-us-form" type="hidden" name="form_id" value="contact_us_form" />
                                    <c:choose>
                                        <c:when test="${empty USER}"><a style="text-align: center; font-size: 18px;" href="WebLab231GroupAssignment/adminLogin.jsp">Đăng nhập để đăng ký lái thử</a>
                                        </c:when>
                                        <c:when test="${not empty USER  && USER.role !=1 }">
                                            <div data-drupal-selector="edit-actions" class="form-actions js-form-wrapper form-wrapper" id="edit-actions"><input class="btn-black button js-form-submit form-submit" data-drupal-selector="edit-submit" type="submit" id="edit-submit" name="op" value="Đăng ký" />

                                            </div>
                                        </c:when>
                                        <c:when test="${ USER.role == 1}"><a style="text-align: center; font-size: 18px;">Bạn là admin</a>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div> 
                            <div id="error-message"></div>                                
                        </div>

                    </div>
                </div>
            </main>

        </form>

    </div>

    <section class="product-review product-comment" id="comments">
        <div class="container">
            <div class="full-width-content">
                <c:choose>
                    <c:when test="${empty USER}"><a style="text-align: center;" href="WebLab231GroupAssignment/adminLogin.jsp">Đăng nhập để viết bình luận</a>
                    </c:when>
                    <c:when test="${not empty USER}">
                        <form action="WebLab231GroupAssignment/addFeedBack" method="POST" >              
                            <div class="rc-form review-form">
                                <div class="rc-form comment-form">
                                    <div class="row">
                                        <div class="col">
                                            <div class="control">
                                                <textarea title="Nội dung" placeholder="${msg}" name="content" spellcheck="false" data-required="1" data-minlength="15"  required="Không được để trống" style="height: 52px; overflow-y: hidden;"></textarea>

                                            </div>
                                            <div class="col">
                                                <div class="control">
                                                    <input type="hidden" name="id_author" value="${USER.id}" >
                                                    <c:if test="${USER.role == 2}">
                                                        <input type="hidden" name="author_name" value="${USER.name}" >
                                                    </c:if>
                                                    <c:if test="${USER.role == 1}">
                                                        <input type="hidden" name="author_name" value="Admin" >
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <p class="note">Để gửi bình luận, bạn cần nhập tối thiểu trường họ tên và nội dung</p>
                                        </div>
                                        <div class="col col-end">
                                            <button type="submit"><i class="icon-sending"></i> Gửi bình luận</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:when>
                </c:choose>

                <div class="review-content comment-content" id="commentContent">

                    <input type="hidden" name="commentReq" value="{&quot;modelId&quot;:822,&quot;systemTypeId&quot;:3,&quot;p&quot;:1,&quot;parent&quot;:0,&quot;child&quot;:true,&quot;path&quot;:&quot;/ajax/comment&quot;}">
                    <div id="replyCommentTemplate" style="display:none;">
                        <form onsubmit="return replyComment(this)" data-container=".comment-list" data-child="false">
                            <input name="__RequestVerificationToken" type="hidden" value="gGpclHBDJHZjMB1cOend1TkO-2fSONRmIdynvQY-1UayaWbWC0SeN-RPvpJbH3nwYN5Pjd24DtqzkEbFDMzLmHSg6ao1">
                            <input type="hidden" name="SupportCommentID"><!-- parent ID-->
                            <input type="hidden" name="ModelID" value="822">
                            <input type="hidden" name="SystemTypeID" value="3">
                            <div class="rc-form comment-form">
                                <div class="row">

                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="control">
                                            <textarea title="Nội dung" placeholder="Nội dung. Tối thiểu 15 ký tự *" name="Content" spellcheck="false" data-required="1" data-minlength="15"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <p class="note">Để gửi bình luận, bạn cần nhập tối thiểu trường họ tên và nội dung</p>
                                    </div>
                                    <div class="col col-end">
                                        <button type="submit"><i class="icon-sending"></i> Gửi bình luận</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <jsp:useBean id="userGet" scope="page" class="Dao.CommentDAO"></jsp:useBean>
                    <c:forEach items="${cmList}"  var="item" varStatus="index">
                        <c:if test="${index.index <=2}"> 
                            <div class="item blogBox moreBox" >
                            </c:if>   
                            <c:if test="${index.index >2}"> 
                                <div class="item blogBox moreBox" style="display: none;">
                                </c:if> 
                                <div class="avt">
                                    <img src="${userGet.getAvatar(item.id_author)}">
                                </div>
                                <div class="info">
                                    <p>
                                        <strong class="name">${item.author}</strong>
                                    </p>
                                    <p style="color: red"><label><i>${item.date}</i></label></p>
                                    <div class="content">
                                        ${item.content}
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                        <nav role="navigation" aria-labelledby="pagination-heading">
                            <h4 id="pagination-heading" class="visually-hidden">Pagination</h4>
                            <ul class="js-pager__items pager__items pager-show-more">
                                <li class="pager__item">
                                    <a href="#" title="Go to next page" id="loadMore" rel="next">XEM THÊM TIN TỨC</a>
                                </li>
                            </ul>
                        </nav>


                    </div>
                </div>
            </div>
    </section>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".moreBox").slice(0, 3).show();
        if ($(".blogBox:hidden").length != 0) {
            $("#loadMore").show();
        }
        $("#loadMore").on('click', function (e) {
            e.preventDefault();
            $(".moreBox:hidden").slice(0, 6).slideDown();
            if ($(".moreBox:hidden").length == 0) {
                $("#loadMore").fadeOut('slow');
            }
        });
    });


</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@ include file="/includes/footer.jsp" %>
