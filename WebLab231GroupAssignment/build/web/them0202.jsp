<%-- 
    Document   : them0202
    Created on : Feb 2, 2021, 10:40:41 AM
    Author     : PC
--%>

<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css3/css3.css" media="all" />

</head>

<section class="product-review product-comment" id="comments">
    <div class="container">
        <div class="full-width-content">
            <form onsubmit="return replyComment(this)" data-container=".comment-content" data-child="true">              
                <div class="rc-form review-form">
                    <div class="rc-form comment-form">
                        <div class="row">
                            <div class="col">
                                <div class="control">
                                    <input type="text" name="Title" placeholder="Họ tên *" data-required="1">
                                </div>
                            </div>
                            <div class="col">
                                <div class="control">
                                    <input type="tel" name="Phone" placeholder="Điện thoại">
                                </div>
                            </div>

                            <div class="col">
                                <div class="control">
                                    <input type="email" name="Email" placeholder="Email">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="control">
                                    <textarea title="Nội dung" placeholder="Nội dung. Tối thiểu 15 ký tự *" name="Content" spellcheck="false" data-required="1" data-minlength="15" style="height: 52px; overflow-y: hidden;"></textarea>
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
                <div class="item">
                    <div class="avt">
                        <img src="/Content/web/img/no-avt.png">
                    </div>
                    <div class="info">
                        <p>
                            <strong class="name">Ngân</strong>
                        </p>
                        <p><label><i>27 phút trước</i></label></p>
                        <div class="content">
                            Để hàng nhiều gọi đặc hàng thì báo hết hàng là sao shop.tổng đài cũng ko check dc cửa hàng nào còn hàng để mình tới mua
                        </div>
                       
                    </div>
                </div>
                
      
               
            </div>
        </div>
    </div>
</section>

<%@ include file="/includes/footer.jsp" %>
