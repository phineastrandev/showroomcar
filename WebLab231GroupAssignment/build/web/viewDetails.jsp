<%-- 
    Document   : viewDetails
    Created on : Jan 10, 2021, 9:33:33 AM
    Author     : PC
--%>
<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<div class="modal-specs">
    <div class="modal-dialog">
        <button class="specs-close">Đóng</button>
        <section class="vf-specs">
            <div class="wrapper">
                <div class="image">
                    <img src="${detailing.img_front}" alt="" class="img">
                </div>
                <div class="specs">
                    <h2>THÔNG SỐ ${detailing.name}</h2>
                    <div class="specs-body">
                        <div class="content">
                            <h3>      KÍCH THƯỚC & KHỐI LƯỢNG
                            </h3>
                            <div class="content-item">
                                <div class="content-title">      Dài x Rộng x Cao (mm)
                                </div>
                                <div class="content-group ">
                                    <div class="content-desc">
                                        <div class="content-sub"></div>
                                        <div class="content-text">
                                            ${detailing.getLxWxH()}

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-item">
                                <div class="content-title">      Chiều dài cơ sở (mm)

                                </div>
                                <div class="content-group ">
                                    <div class="content-desc">
                                        <div class="content-sub"></div>
                                        <div class="content-text">
                                            ${detailing.wheelbase}

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-item">
                                <div class="content-title">      Khoảng sáng gầm xe (mm)
                                </div>
                                <div class="content-group ">
                                    <div class="content-desc">
                                        <div class="content-sub"></div>
                                        <div class="content-text">
                                             ${detailing.fullload}

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h3>      ĐỘNG CƠ & VẬN HÀNH
                            </h3>
                            <div class="content-item">
                                <div class="content-title">      Động cơ
                                </div>
                                <div class="content-group is-border">
                                    <div class="content-desc">
                                        <div class="content-sub">
                                            Loại động cơ

                                        </div>
                                        <div class="content-text">
                                            ${detailing.engine}, động cơ xi lanh, 4 xi lanh thẳng hàng

                                        </div>
                                    </div>
                                    <div class="content-desc">
                                        <div class="content-sub">
                                            Công suất tối đa (hp/rmp)

                                        </div>
                                        <div class="content-text">
                                            98/6200

                                        </div>
                                    </div>
                                    <div class="content-desc">
                                        <div class="content-sub">
                                            Mô men xoắn cực đại (Nm/rpm)

                                        </div>
                                        <div class="content-text">
                                            128/4400

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-item">
                                <div class="content-title">      Hộp số
                                </div>
                                <div class="content-group ">
                                    <div class="content-desc">
                                        <div class="content-sub"></div>
                                        <div class="content-text">
                                            ${detailing.gear}

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-item">
                                <div class="content-title">      Dẫn động
                                </div>
                                <div class="content-group ">
                                    <div class="content-desc">
                                        <div class="content-sub"></div>
                                        <div class="content-text">
                                            Cầu trước

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-item">
                                <div class="content-title">      Hệ thống treo trước
                                </div>
                                <div class="content-group ">
                                    <div class="content-desc">
                                        <div class="content-sub"></div>
                                        <div class="content-text">
                                            Kiểu MacPherson

                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
        </section>
                                            
                                            
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>
