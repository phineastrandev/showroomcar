

<%@ taglib prefix = "s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<%@ include file="/includes/header.jsp" %>
<section>
    <div class="layout-highlighted"></div>
    <div class="clearfix"></div>
    <div class="region region-content">
        <h1>${ listColor.Color}</h1>
        <div id="block-vinfast-content" class="block block-system block-system-main-block">

            <main class="page vf-home">

                <section class="vf-banner">
                    <h2 class="hidden"></h2>
                    <div class="banner-img">

                        <a href="" class="banner-link">
                            <div class="banner-item">
                                <figure class="banner-item">
                                    <img class="img imgd" src="WebLab231GroupAssignment/images/home/im1.jpg"/>
                                </figure>
                            </div>
                        </a>

                        <a href="" class="banner-link">
                            <div class="banner-item">
                                <figure class="banner-item"  >
                                    <img class="img imgd"   src="https://vinfast365.com.vn/wp-content/uploads/2020/03/banner-lux-a-120.jpg"/>
                                    <img class="img imgm" src="WebLab231GroupAssignment/images/home/mobilesize.jpg"/>
                                </figure>
                            </div>
                        </a>
                    </div>
                    <div class="banner-copy">	



                        <div class="copy">           
                            <h3 class="animated" data-animation-in="fadeInUp">
                                <a href=""></a>
                            </h3>
                            <p class="list-btn animated" data-animation-in="fadeInUp" data-delay-in="0.05">            
                            </p>
                        </div>  


                        <div class="copy">           
                            <h3 class="animated" data-animation-in="fadeInUp">
                                <a href=""></a>
                            </h3>
                            <p class="list-btn animated" data-animation-in="fadeInUp" data-delay-in="0.05">            
                            </p>
                        </div>  

                    </div>
                </section>


                <section class="vf-newsroom" style="background-color: white;">
                    <div class="container">
                        <h3 class="title way-animate animated" data-animate="fadeInUp">TIN TỨC</h3>
                        <div class="cols newsrooms">
                            <%-- <jsp:useBean id ="fpost" scope="page" class="model.BlogDAO"></jsp:useBean> --%>
                            <div class="col">
                                <article class="newsroom-w100 way-animate animated" data-animate="fadeIn">
                                    <div class="img">
                                        <a href="WebLab231GroupAssignment/blogDetail?id_blog=${displayBlog.id}"" class="link-hidden"></a>
                                        <figure style="background-image: url('${ displayBlog.img }')"></figure>
                                    </div>
                                    <div class="copy">
                                        <h4>${ displayBlog.title }</h4>

                                    </div>
                                </article>
                            </div>
                            <div class="divider-vert"></div>


                            <div class="col">

                                <c:forEach  begin="1" end="3" items="${blogs}"  var="blogList">

                                    <article class="newsroom-w50 way-animate" data-animate="fadeIn" style="opacity: 0; animation-delay: 0s;">
                                        <div class="img">
                                            <a href="WebLab231GroupAssignment/blogDetail?id_blog=${blogList.id}" class="link-hidden"></a>
                                            <figure style="background-image: url('${blogList.img}')"></figure>
                                        </div>
                                        <div class="copy">
                                            <div><p></p></div>
                                            <h4> </h4>
                                            <h4> ${blogList.title}</h4>
                                            <p>Ngày Đăng: ${blogList.date}</p>
                                        </div>

                                    </article>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </section>


                <div class="field field--name-field-body-paragraph field--type-entity-reference-revisions field--label-hidden field__items">
                    <div class="field__item"><section class="vf-videofficial">
                            <div class="videofficials">
                                <div class="video-wrap">
                                    <div class="btn-video way-animate animated" data-animate="fadeIn">
                                        <img src="WebLab231GroupAssignment/images/home/play-button-2.svg" alt="Play Video">
                                    </div>
                                    <h4 class="way-animate animated" data-animate="fadeInUp">CHÍNH SÁCH GIÁ CHÀO NĂM MỚI 2021 CHO XE Ô TÔ LUXURY CAR ÁP DỤNG THÁNG 1 & 2/2021</h4>
                                </div>
                                <div class="video">
                                    <video autoplay loop playsinline preload="metadata" poster='WebLab231GroupAssignment/images/home/thumbnail-3.png'>
                                        <source src="https://vinfast.vn/themes/custom/vinfast/static/file/Vinfast60s.mp4">
                                    </video>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="field__item">        
                    </div>
                </div>
            </main>
        </div>
    </div>
</section>
<%@ include file="/includes/footer.jsp" %>
