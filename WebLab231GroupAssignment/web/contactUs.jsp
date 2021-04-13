<%-- 
    Document   : contactUs
    Created on : Jan 10, 2021, 11:24:54 AM
    Author     : PC
--%>
<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>


<div class="layout-page-title">
    <div class="container">
        <div class="region region-page-title">
            <div id="block-vinfast-page-title--2" class="block block-core block-page-title-block">
                <h1 class="page-title">Liên hệ</h1>
            </div>
        </div>

    </div>
</div>

<div class="clearfix"></div>      
<div class="region region-content" style="background-color: white;">

    <div id="block-vinfast-content" class="block block-system block-system-main-block">


        <form class="contact-us-form" onclick="checkPhone()" data-parsley-validate="" data-drupal-selector="contact-us-form" action="WebLab231GroupAssignment/SendContact" method="POST" id="contact-us-form" accept-charset="UTF-8">
            <main class="page">
                <div class="vf-contact">
                    <div class="container">
                        <h3 class="title way-animate animated" data-animate="fadeInUp">Liên hệ</h3>
                        <div class="contact-form">

                            <div class="js-form-item form-item js-form-type-textfield form-type-textfield js-form-item-fullname form-item-fullname">
                                <label class="form-label js-form-required form-required" for="edit-fullname">Họ và tên</label>
                                <input class="form-input form-text required" data-drupal-selector="edit-fullname" type="text" id="edit-fullname" name="name" value="" size="60" maxlength="128" required="required" aria-required="true" />

                            </div>


                            <div class="js-form-item form-item js-form-type-textfield form-type-textfield js-form-item-address form-item-address">
                                <label class="form-label" for="edit-address">Địa chỉ</label>
                                <input class="form-input form-text" data-drupal-selector="edit-address" type="text" id="edit-address" name="address" value="" size="60" maxlength="128" />
                            </div>

                            <div class="form-group">
                                <div class="cols">
                                    <div class="col-6 col-md-12">
                                        <div class="js-form-item form-item js-form-type-email form-type-email js-form-item-email form-item-email">
                                            <label class="form-label" for="edit-email">Email</label>
                                            <input class="form-input form-email" data-drupal-selector="edit-email" type="email" id="edit-email" required="required" name="email" value="" size="60" maxlength="254" />

                                        </div>

                                    </div>
                                    <div class="col-6 col-md-12">
                                        <div class="js-form-item form-item js-form-type-tel form-type-tel js-form-item-phone form-item-phone">
                                            <label class="form-label js-form-required form-required" for="edit-phone">Số điện thoại</label>
                                            <input class="form-input form-tel required" data-drupal-selector="edit-phone" type="tel" id="edit-phone" id="phone" name="phone" value="" size="13" maxlength="128" required="required" aria-required="true" />
                                        </div>
                                    </div>
                                </div>
                            </div>                      
                            <div id="other-information" class="form-group">
                            </div>   
                            <div class="form-group">
                                <div class="text-center">
                                    <c:if test="${USER.role != 1}">
                                        <div data-drupal-selector="edit-actions" class="form-actions js-form-wrapper form-wrapper" id="edit-actions"><input class="btn-black button js-form-submit form-submit" data-drupal-selector="edit-submit" type="submit" id="edit-submit" value="Gửi" />
                                        </div>
                                    </c:if>
                                    <c:if test="${USER.role == 1}">
                                        <div data-drupal-selector="edit-actions" class="form-actions js-form-wrapper form-wrapper" id="edit-actions"><input class="btn-black button js-form-submit form-submit" data-drupal-selector="edit-submit" type="button" id="edit-submit" value="Bạn là admin" />
                                        </div>
                                    </c:if>
                                </div>
                            </div> 
                            <div id="error-message"></div>                                
                        </div>
                        <div class="divider"></div>
                        <div class="contact-infor" style="font-family: Times New Roman;">
                            <div class="cols">
                                <div class="col-6 col-md-12">
                                    <h4>Trụ sở chính</h4>
                                    <p>Khu kinh tế Đình Vũ – Cát Hải, Đảo Cát Hải, Thị trấn Cát Hải, Huyện Cát Hải, Thành phố Hải Phòng, Việt Nam</p>
                                </div>
                                <div class="col-6 col-md-12">
                                    <h4>Email</h4>
                                    <p><a href="mailto:tranphianh1518@gmail.com">tranphianh1518@gmail.com</a></p>
                                </div>
                                <div class="col-6 col-md-12" >
                                    <h4>Cơ sở</h4>

                                    <p>Lê Duẩn, Thị Trấn Ái Tử, Triệu Phong Quảng Trị</p>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3616.1116020152836!2d107.15835613249509!3d16.77436850305492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3140e5c68f30f485%3A0x866beddcc236b3da!2zVmluZmFzdCBDaGV2cm9sZXQgUXXhuqNuZyBUcuG7iw!5e1!3m2!1sen!2s!4v1614648333991!5m2!1sen!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                </div>
                                <div class="col-6 col-md-12">
                                    <h4>Điện thoại</h4>
                                    <p><a href="tel:1900232389">1900-232389</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

        </form>

    </div>

</div>
<script>
    funtion checkPhone(){
        alert("Gửi thành công!")
    }

</script>

<%@ include file="/includes/footer.jsp" %>
