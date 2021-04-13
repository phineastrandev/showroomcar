<%-- 
    Document   : carList
    Created on : Jan 7, 2021, 7:05:53 PM
    Author     : PC
--%>

<%@ include file="/includes/header.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

</head>

<link rel='stylesheet' id='wp-block-library-css'  href='https://vinfastquangtri.com/wp-includes/css/dist/block-library/style.min.css?ver=5.6' media='all' />
<link rel='stylesheet' id='wp-block-library-theme-css'  href='https://vinfastquangtri.com/wp-includes/css/dist/block-library/theme.min.css?ver=5.6' media='all' />
<link rel='stylesheet' id='contact-form-7-css'  href='https://vinfastquangtri.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.3.2' media='all' />
<link rel='stylesheet' id='cb70d11b8-css'  href='https://vinfastquangtri.com/wp-content/uploads/essential-addons-elementor/cb70d11b8.min.css?ver=1611984055' media='all' />
<link rel='stylesheet' id='hfe-style-css'  href='https://vinfastquangtri.com/wp-content/plugins/header-footer-elementor/assets/css/header-footer-elementor.css?ver=1.5.4' media='all' />
<link rel='stylesheet' id='elementor-icons-css'  href='https://vinfastquangtri.com/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=5.9.1' media='all' />
<link rel='stylesheet' id='elementor-animations-css'  href='https://vinfastquangtri.com/wp-content/plugins/elementor/assets/lib/animations/animations.min.css?ver=3.0.16' media='all' />
<link rel='stylesheet' id='elementor-frontend-legacy-css'  href='https://vinfastquangtri.com/wp-content/plugins/elementor/assets/css/frontend-legacy.min.css?ver=3.0.16' media='all' />
<link rel='stylesheet' id='elementor-frontend-css'  href='https://vinfastquangtri.com/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=3.0.16' media='all' />
<link rel='stylesheet' id='elementor-post-12-css'  href='https://vinfastquangtri.com/wp-content/uploads/elementor/css/post-12.css?ver=1610786307' media='all' />
<link rel='stylesheet' id='lae-animate-styles-css'  href='https://vinfastquangtri.com/wp-content/plugins/addons-for-elementor/assets/css/animate.css?ver=4.6' media='all' />
<link rel='stylesheet' id='lae-sliders-styles-css'  href='https://vinfastquangtri.com/wp-content/plugins/addons-for-elementor/assets/css/sliders.css?ver=4.6' media='all' />
<link rel='stylesheet' id='lae-icomoon-styles-css'  href='https://vinfastquangtri.com/wp-content/plugins/addons-for-elementor/assets/css/icomoon.css?ver=4.6' media='all' />
<link rel='stylesheet' id='lae-frontend-styles-css'  href='https://vinfastquangtri.com/wp-content/plugins/addons-for-elementor/assets/css/lae-frontend.css?ver=4.6' media='all' />
<link rel='stylesheet' id='elementor-pro-css'  href='https://vinfastquangtri.com/wp-content/plugins/elementor-pro/assets/css/frontend.min.css?ver=3.0.8' media='all' />
<link rel='stylesheet' id='elementskit-css-widgetarea-control-editor-css'  href='https://vinfastquangtri.com/wp-content/plugins/elementskit-lite/modules/controls/assets/css/widgetarea-editor.css?ver=2.1.1' media='all' />
<link rel='stylesheet' id='elementor-post-30-css'  href='https://vinfastquangtri.com/wp-content/uploads/elementor/css/post-30.css?ver=1610794877' media='all' />
<link rel='stylesheet' id='elementor-post-59-css'  href='https://vinfastquangtri.com/wp-content/uploads/elementor/css/post-59.css?ver=1610794964' media='all' />
</head>
<body>
    <div style="margin-top: 200px"></div>
    <section style="background-color: white;" data-particle_enable="false" data-particle-mobile-disabled="false" class="elementor-section elementor-top-section elementor-element elementor-element-7acf28d elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="7acf28d" data-element_type="section" data-settings="{&quot;ekit_has_onepagescroll_dot&quot;:&quot;yes&quot;}">
        <div class="elementor-container elementor-column-gap-default">
            <div class="elementor-row">

                <c:forEach items="${listCar}"  var="items">

                    <div class="elementor-column elementor-col-25 elementor-top-column elementor-element elementor-element-e238922" data-id="e238922" data-element_type="column">
                        <div class="elementor-column-wrap elementor-element-populated">
                            <div class="elementor-widget-wrap">
                                <div class="elementor-element elementor-element-131225b elementor-widget elementor-widget-image" >
                                    <div class="elementor-widget-container">
                                        <div class="elementor-image">
                                            <a href="WebLab231GroupAssignment/carDetail?id=${items.id}">
                                                <img width="750" height="439" src="${items.img_list}" class="elementor-animation-grow attachment-large size-large" alt="" loading="lazy" sizes="(max-width: 750px) 100vw, 750px" style="width:100%;height:58.59%;max-width:1024px;" />								</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-element elementor-element-0ae3fa9 elementor-widget elementor-widget-heading" data-id="0ae3fa9" data-element_type="widget" data-settings="{&quot;ekit_we_effect_on&quot;:&quot;none&quot;}" data-widget_type="heading.default">
                                    <div class="elementor-widget-container">
                                        <h3 class="elementor-heading-title elementor-size-default"><a href="https://vinfastquangtri.com/vinfastfadil/">${items.name}</a></h3>		</div>
                                </div>
                                <div class="elementor-element elementor-element-9c16565 elementor-widget elementor-widget-heading" data-id="9c16565" data-element_type="widget" data-settings="{&quot;ekit_we_effect_on&quot;:&quot;none&quot;}" data-widget_type="heading.default">
                                    <div class="elementor-widget-container">
                                        <h6 class="elementor-heading-title elementor-size-default">Giá từ: <fmt:formatNumber type = "number" 
                                                          maxFractionDigits = "3" value = "${items.price}"/> VNĐ</h6>		</div>
                                </div>
                                <div class="elementor-element elementor-element-50e463c elementor-widget elementor-widget-heading" data-id="50e463c" data-element_type="widget" data-settings="{&quot;ekit_we_effect_on&quot;:&quot;none&quot;}" data-widget_type="heading.default">
                                    <div class="elementor-widget-container">
                                        <h6 class="elementor-heading-title elementor-size-default">Chỉ cần đặt cọc <fmt:formatNumber type = "number" 
                                                          maxFractionDigits = "3" value = "${items.preOderPrice}"/> VNĐ</h6>		</div>
                                </div>
                                <div class="elementor-element elementor-element-2bafc27 elementor-widget-divider--view-line elementor-widget elementor-widget-divider" data-id="2bafc27" data-element_type="widget" data-settings="{&quot;ekit_we_effect_on&quot;:&quot;none&quot;}" data-widget_type="divider.default">
                                    <div class="elementor-widget-container">
                                        <div class="elementor-divider">
                                            <span class="elementor-divider-separator">
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-element elementor-element-5f3e373 elementor-widget elementor-widget-heading" data-id="5f3e373" data-element_type="widget" data-settings="{&quot;ekit_we_effect_on&quot;:&quot;none&quot;}" data-widget_type="heading.default">
                                    <div class="elementor-widget-container">
                                        <p class="elementor-heading-title elementor-size-default">${items.contentList}.</p>		</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <%@ include file="/includes/footer.jsp" %>
