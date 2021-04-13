<%-- 
    Document   : news0102
    Created on : Feb 1, 2021, 7:53:34 AM
    Author     : PC
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/bootstrap.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/custom.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/demo-shop-8.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/grid.less" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/layers.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/scaffolding.less" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/swiper.min.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/theme.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/vendor.min.css" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/utilities.less" media="all" />
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css2/promo.css" media="all" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
</head>
<div role="main" class="main" style="margin-top: 50px">
    <section class="page-header mb-lg">
        <div class="container">
            <ul class="breadcrumb">
                <div class="region region-breadcrumb">

                    <div id="block-porto-breadcrumbs" class="block block-system block-system-breadcrumb-block">
                        <nav class="breadcrumb" role="navigation" aria-labelledby="system-breadcrumb">
                            <h2 id="system-breadcrumb" class="visually-hidden">Breadcrumb</h2>
                            <ol>
                                <li>
                                    <a href="/vi">Home</a>
                                </li>
                                <li>
                                    Xe hơi kết nối: Cuộc chiến giữa các hãng xe với Big Tech
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </ul>
        </div>
    </section>
    <div class="col-12 p-0">
        <div class="region region-content">
            <div data-drupal-messages-fallback="" class="hidden"></div>
            <div id="block-porto-content" class="block block-system block-system-main-block">
                <div role="main" class="main relative">
                    <div class="container promo-back-white pt-3 pb-3">
                        <div class="row">
                            <div class="col-12 col-md-7 col-lg-8">
                                <div class="col-12 p-0">
                                    <ul class="ul-cate-news">
                                        <li class="active">
                                            <div class="views-element-container">
                                                <div class="view view-term-function-by-itnvtoi view-id-term_function_by_itnvtoi view-display-id-block_2 js-view-dom-id-f114762926d07e6e3f92030bb14c56fdc47cc6524fc830d7a95b4b721e28b48b">
                                                    
                                                </div>
                                            </div>
                                        </li>
                                        <div class="views-element-container">
                                            <div class="view view-term-function-by-itnvtoi view-id-term_function_by_itnvtoi view-display-id-block_3 js-view-dom-id-c41874bef13b8163857673e7766962eea5c40611d0a3dfa98cbe9dcc9bcd2742">
                                                <div class="view-content">
                                                    <jsp:useBean id="cate" scope="page" class="Dao.CategoryDAO"></jsp:useBean>
                                                        <li class="cateLink"><a href="WebLab231GroupAssignment/blog" title="Tất cả">Tất cả</a></li>
                                                        <c:forEach items="${cate.all}" var="cates" varStatus="index">
                                                        <li class="cateLink "><a  href="WebLab231GroupAssignment/getByCate?id_cate=${cates.id}">${cates.name}</a></li>
                                                        </c:forEach>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </ul>
                                </div>
                                <h1 class="promo-h1">
                                    <span class="field field--name-title field--type-string field--label-hidden">${blogDetail.title}</span>

                                </h1>
                                <div class="promo-detail-status pb-4">
                                    <div>
                                        <span class="mr-2"><i class="far fa-clock"></i> ${blogDetail.date}</span>
                                        <span><i class="far fa-user"></i> 
                                            <span class="field field--name-uid field--type-entity-reference field--label-hidden">
                                                <span lang="" about="/vi/user/40" typeof="schema:Person" property="schema:name" datatype="">Admin</span>
                                            </span>

                                        </span>
                                    </div>
                                    <div>

                                        <ul>
                                            <li>
                                                <a href="" title=""><i class="far fa-eye"></i> 
                                                </a>
                                                <div class="views-element-container">
                                                    <div class="view view-node-function-by-itnvtoi view-id-node_function_by_itnvtoi view-display-id-block_6 js-view-dom-id-634e04708f0a1b96fc696573ba1ff901da822afab9671cb456a780f5effe8ce5">
                                                        <div class="view-content">
                                                            <div class="views-row">

                                                                <div class="views-field views-field-nothing"><span class="field-content">
                                                                        ${blogDetail.viewer}
                                                                    </span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="promo-detail-status d-none d-md-block">
                                    <div>
                                        <div class="like-fb">
                                            <div class="a2a_kit a2a_kit_size_32 a2a_default_style a2a_vertical_style" style="line-height: 32px;">
                                                <a class="a2a_button_facebook_like" style="width: 90px;"><div class="fb-like fb_iframe_widget" data-href="https://vinfastauto.com/vi/xe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech?fbclid=IwAR0Jqkjl4pjICzsjnDJ-t9d1opOe2VDpgjga-IUHlXxQi2qwJk_3JhTldfg" data-width="90" data-layout="button_count" data-ref="addtoany" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=0&amp;container_width=82&amp;href=https%3A%2F%2Fvinfastauto.com%2Fvi%2Fxe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech%3Ffbclid%3DIwAR0Jqkjl4pjICzsjnDJ-t9d1opOe2VDpgjga-IUHlXxQi2qwJk_3JhTldfg&amp;layout=button_count&amp;locale=vi_VN&amp;ref=addtoany&amp;sdk=joey&amp;width=90"><span style="vertical-align: bottom; width: 90px; height: 28px;"><iframe name="f2bf1c91c4e5bf8" width="90px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v3.1/plugins/like.php?app_id=0&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df3e034b24883428%26domain%3Dvinfastauto.com%26origin%3Dhttps%253A%252F%252Fvinfastauto.com%252Ff2596c1faade0e%26relation%3Dparent.parent&amp;container_width=82&amp;href=https%3A%2F%2Fvinfastauto.com%2Fvi%2Fxe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech%3Ffbclid%3DIwAR0Jqkjl4pjICzsjnDJ-t9d1opOe2VDpgjga-IUHlXxQi2qwJk_3JhTldfg&amp;layout=button_count&amp;locale=vi_VN&amp;ref=addtoany&amp;sdk=joey&amp;width=90" style="border: none; visibility: visible; width: 90px; height: 28px;" class=""></iframe></span></div></a>
                                                <div style="clear: both;"></div></div>
                                        </div>
                                        <div id="fb-root"></div>
                                        <script async="" defer="" crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&amp;version=v9.0&amp;appId=409935576218390&amp;autoLogAppEvents=1" nonce="RrpmIlo4"></script>
                                        <div class="fb-save fb_iframe_widget" data-uri="https://www.instagram.com/facebook/" ddata-size="small" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=0&amp;container_width=0&amp;locale=vi_VN&amp;sdk=joey&amp;uri=https%3A%2F%2Fwww.instagram.com%2Ffacebook%2F"><span style="vertical-align: bottom; width: 158px; height: 28px;"><iframe name="f3e5eed5e185074" width="1000px" height="1000px" data-testid="fb:save Facebook Social Plugin" title="fb:save Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v3.1/plugins/save.php?app_id=0&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df3aa304dea31828%26domain%3Dvinfastauto.com%26origin%3Dhttps%253A%252F%252Fvinfastauto.com%252Ff2596c1faade0e%26relation%3Dparent.parent&amp;container_width=0&amp;locale=vi_VN&amp;sdk=joey&amp;uri=https%3A%2F%2Fwww.instagram.com%2Ffacebook%2F" style="border: none; visibility: visible; width: 158px; height: 28px;" class=""></iframe></span></div>
                                    </div>
                                    <div>
                                        <span class="a2a_kit a2a_kit_size_18 addtoany_list" data-a2a-url="https://vinfastauto.com/vi/xe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech" data-a2a-title="Xe hơi kết nối: Cuộc chiến giữa các hãng xe với Big Tech" style="line-height: 18px;"><a class="a2a_button_facebook" target="_blank" href="/#facebook" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_facebook" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path fill="#707070" d="M17.78 27.5V17.008h3.522l.527-4.09h-4.05v-2.61c0-1.182.33-1.99 2.023-1.99h2.166V4.66c-.375-.05-1.66-.16-3.155-.16-3.123 0-5.26 1.905-5.26 5.405v3.016h-3.53v4.09h3.53V27.5h4.223z"></path></svg></span><span class="a2a_label">Facebook</span></a><a class="a2a_button_twitter" target="_blank" href="/#twitter" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_twitter" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path fill="#707070" d="M28 8.557a9.913 9.913 0 0 1-2.828.775 4.93 4.93 0 0 0 2.166-2.725 9.738 9.738 0 0 1-3.13 1.194 4.92 4.92 0 0 0-3.593-1.55 4.924 4.924 0 0 0-4.794 6.049c-4.09-.21-7.72-2.17-10.15-5.15a4.942 4.942 0 0 0-.665 2.477c0 1.71.87 3.214 2.19 4.1a4.968 4.968 0 0 1-2.23-.616v.06c0 2.39 1.7 4.38 3.952 4.83-.414.115-.85.174-1.297.174-.318 0-.626-.03-.928-.086a4.935 4.935 0 0 0 4.6 3.42 9.893 9.893 0 0 1-6.114 2.107c-.398 0-.79-.023-1.175-.068a13.953 13.953 0 0 0 7.55 2.213c9.056 0 14.01-7.507 14.01-14.013 0-.213-.005-.426-.015-.637.96-.695 1.795-1.56 2.455-2.55z"></path></svg></span><span class="a2a_label">Twitter</span></a><a class="a2a_button_email" target="_blank" href="/#email" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_email" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path fill="#707070" d="M26 21.25v-9s-9.1 6.35-9.984 6.68C15.144 18.616 6 12.25 6 12.25v9c0 1.25.266 1.5 1.5 1.5h17c1.266 0 1.5-.22 1.5-1.5zm-.015-10.765c0-.91-.265-1.235-1.485-1.235h-17c-1.255 0-1.5.39-1.5 1.3l.015.14s9.035 6.22 10 6.56c1.02-.395 9.985-6.7 9.985-6.7l-.015-.065z"></path></svg></span><span class="a2a_label">Email</span></a><a class="a2a_button_linkedin" target="_blank" href="/#linkedin" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_linkedin" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d="M6.227 12.61h4.19v13.48h-4.19V12.61zm2.095-6.7a2.43 2.43 0 0 1 0 4.86c-1.344 0-2.428-1.09-2.428-2.43s1.084-2.43 2.428-2.43m4.72 6.7h4.02v1.84h.058c.56-1.058 1.927-2.176 3.965-2.176 4.238 0 5.02 2.792 5.02 6.42v7.395h-4.183v-6.56c0-1.564-.03-3.574-2.178-3.574-2.18 0-2.514 1.7-2.514 3.46v6.668h-4.187V12.61z" fill="#707070"></path></svg></span><span class="a2a_label">LinkedIn</span></a></span>
                                    </div>
                                </div>
                                <div class="col-12 p-0  mt-5 line-1-E4E4E4 news-content">
                                    <!-- code content nằm ở đây --->
                                    ${blogDetail.content}
y                                </div>
                                <div class="col-12 promo-tag mt-5 mb-5 p-0">
                                    <span>Tags: ${cate.getCateByID(blogDetail.category)}</span>
                                    <div class="views-element-container">
                                        <div class="view view-node-function-by-itnvtoi view-id-node_function_by_itnvtoi view-display-id-block_10 js-view-dom-id-1a2a041772f1601aa89e1b6bdb835f67a90b7113f3601701f4ecc91a83da8659">
                                            <div class="view-content">
                                                <div class="views-row">
                                                    <div class="views-field views-field-field-tags"><div class="field-content">
                                                        </div></div>
                                                </div>
                                            </div>

                                        </div>


                                    </div>
                                </div>
                                <div class="promo-detail-status line-1-E4E4E4 mb">
                                    <div>
                                        <div class="like-fb">
                                            <div class="a2a_kit a2a_default_style" style="line-height: 16px;">
                                                <a class="a2a_button_facebook_like" style="width: 90px;"><div class="fb-like fb_iframe_widget" data-href="https://vinfastauto.com/vi/xe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech?fbclid=IwAR0Jqkjl4pjICzsjnDJ-t9d1opOe2VDpgjga-IUHlXxQi2qwJk_3JhTldfg" data-width="90" data-layout="button_count" data-ref="addtoany" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=0&amp;container_width=86&amp;href=https%3A%2F%2Fvinfastauto.com%2Fvi%2Fxe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech%3Ffbclid%3DIwAR0Jqkjl4pjICzsjnDJ-t9d1opOe2VDpgjga-IUHlXxQi2qwJk_3JhTldfg&amp;layout=button_count&amp;locale=vi_VN&amp;ref=addtoany&amp;sdk=joey&amp;width=90"><span style="vertical-align: bottom; width: 90px; height: 28px;"><iframe name="f313cc815854d6c" width="90px" height="1000px" data-testid="fb:like Facebook Social Plugin" title="fb:like Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v3.1/plugins/like.php?app_id=0&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df5a09e02baebe4%26domain%3Dvinfastauto.com%26origin%3Dhttps%253A%252F%252Fvinfastauto.com%252Ff2596c1faade0e%26relation%3Dparent.parent&amp;container_width=86&amp;href=https%3A%2F%2Fvinfastauto.com%2Fvi%2Fxe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech%3Ffbclid%3DIwAR0Jqkjl4pjICzsjnDJ-t9d1opOe2VDpgjga-IUHlXxQi2qwJk_3JhTldfg&amp;layout=button_count&amp;locale=vi_VN&amp;ref=addtoany&amp;sdk=joey&amp;width=90" style="border: none; visibility: visible; width: 90px; height: 28px;" class=""></iframe></span></div></a>
                                                <div style="clear: both;"></div></div>
                                        </div>
                                        <div id="fb-root"></div>
                                        <script async="" defer="" crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&amp;version=v9.0&amp;appId=409935576218390&amp;autoLogAppEvents=1" nonce="RrpmIlo4"></script>
                                        <div class="fb-save fb_iframe_widget" data-uri="https://www.instagram.com/facebook/" ddata-size="small" fb-xfbml-state="rendered" fb-iframe-plugin-query="app_id=0&amp;container_width=0&amp;locale=vi_VN&amp;sdk=joey&amp;uri=https%3A%2F%2Fwww.instagram.com%2Ffacebook%2F"><span style="vertical-align: bottom; width: 158px; height: 28px;"><iframe name="f106b036dc5d6fc" width="1000px" height="1000px" data-testid="fb:save Facebook Social Plugin" title="fb:save Facebook Social Plugin" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" src="https://www.facebook.com/v3.1/plugins/save.php?app_id=0&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df17b5334652fe24%26domain%3Dvinfastauto.com%26origin%3Dhttps%253A%252F%252Fvinfastauto.com%252Ff2596c1faade0e%26relation%3Dparent.parent&amp;container_width=0&amp;locale=vi_VN&amp;sdk=joey&amp;uri=https%3A%2F%2Fwww.instagram.com%2Ffacebook%2F" style="border: none; visibility: visible; width: 158px; height: 28px;" class=""></iframe></span></div>
                                    </div>
                                    <div>
                                        Chia sẻ bài viết này 
                                        <span class="a2a_kit a2a_kit_size_18 addtoany_list" data-a2a-url="https://vinfastauto.com/vi/xe-hoi-ket-noi-cuoc-chien-giua-cac-hang-xe-voi-big-tech" data-a2a-title="Xe hơi kết nối: Cuộc chiến giữa các hãng xe với Big Tech" style="line-height: 18px;"><a class="a2a_button_facebook" target="_blank" href="/#facebook" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_facebook" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path fill="#707070" d="M17.78 27.5V17.008h3.522l.527-4.09h-4.05v-2.61c0-1.182.33-1.99 2.023-1.99h2.166V4.66c-.375-.05-1.66-.16-3.155-.16-3.123 0-5.26 1.905-5.26 5.405v3.016h-3.53v4.09h3.53V27.5h4.223z"></path></svg></span><span class="a2a_label">Facebook</span></a><a class="a2a_button_twitter" target="_blank" href="/#twitter" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_twitter" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path fill="#707070" d="M28 8.557a9.913 9.913 0 0 1-2.828.775 4.93 4.93 0 0 0 2.166-2.725 9.738 9.738 0 0 1-3.13 1.194 4.92 4.92 0 0 0-3.593-1.55 4.924 4.924 0 0 0-4.794 6.049c-4.09-.21-7.72-2.17-10.15-5.15a4.942 4.942 0 0 0-.665 2.477c0 1.71.87 3.214 2.19 4.1a4.968 4.968 0 0 1-2.23-.616v.06c0 2.39 1.7 4.38 3.952 4.83-.414.115-.85.174-1.297.174-.318 0-.626-.03-.928-.086a4.935 4.935 0 0 0 4.6 3.42 9.893 9.893 0 0 1-6.114 2.107c-.398 0-.79-.023-1.175-.068a13.953 13.953 0 0 0 7.55 2.213c9.056 0 14.01-7.507 14.01-14.013 0-.213-.005-.426-.015-.637.96-.695 1.795-1.56 2.455-2.55z"></path></svg></span><span class="a2a_label">Twitter</span></a><a class="a2a_button_email" target="_blank" href="/#email" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_email" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path fill="#707070" d="M26 21.25v-9s-9.1 6.35-9.984 6.68C15.144 18.616 6 12.25 6 12.25v9c0 1.25.266 1.5 1.5 1.5h17c1.266 0 1.5-.22 1.5-1.5zm-.015-10.765c0-.91-.265-1.235-1.485-1.235h-17c-1.255 0-1.5.39-1.5 1.3l.015.14s9.035 6.22 10 6.56c1.02-.395 9.985-6.7 9.985-6.7l-.015-.065z"></path></svg></span><span class="a2a_label">Email</span></a><a class="a2a_button_linkedin" target="_blank" href="/#linkedin" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_linkedin" style="background-color: transparent; width: 18px; line-height: 18px; height: 18px; background-size: 18px; border-radius: 3px;"><svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><path d="M6.227 12.61h4.19v13.48h-4.19V12.61zm2.095-6.7a2.43 2.43 0 0 1 0 4.86c-1.344 0-2.428-1.09-2.428-2.43s1.084-2.43 2.428-2.43m4.72 6.7h4.02v1.84h.058c.56-1.058 1.927-2.176 3.965-2.176 4.238 0 5.02 2.792 5.02 6.42v7.395h-4.183v-6.56c0-1.564-.03-3.574-2.178-3.574-2.18 0-2.514 1.7-2.514 3.46v6.668h-4.187V12.61z" fill="#707070"></path></svg></span><span class="a2a_label">LinkedIn</span></a></span>
                                        <!-- END OUTPUT from 'modules/contrib/addtoany/templates/addtoany-standard.html.twig' -->


                                    </div>
                                </div>
                                <div class="col-12 p-0 d-none d-md-block">
                                    <div class="views-element-container">

                                        <div class="big-cmt-wrapper container view view-node-functions-haitran view-id-node_functions_haitran view-display-id-block_2 js-view-dom-id-bed02d5a2d02b857d2d0db0e6a1122b7886c811bfa826bb522e32c7843d7853d">

                                            <div class="view-empty">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-5 col-lg-4 fix-back-mb">

                                <div class="col-12 mb-5 box-news-r p-0 d-none d-md-block">
                                    <h2>PHỔ BIẾN</h2>

                                    <div class="views-element-container">
                                        <div class="view view-node-function-by-itnvtoi view-id-node_function_by_itnvtoi view-display-id-block_2 js-view-dom-id-f054e9aaecd85184e2041f3653dc2ba3322bfb94706ffda1fc53bca05271f17c">



                                            <div class="view-content">
                                                <c:forEach  begin="0" end="2" items="${listBlog}"  var="blogList">
                                                    <div class="views-row">

                                                        <div class="views-field views-field-nothing"><span class="field-content">
                                                                <div class="row box-news-r-item mb-5">
                                                                    <div class="col-6 position-relative">

                                                                        <a href="WebLab231GroupAssignment/blogDetail?id_blog=${blogList.id}" hreflang="vi">
                                                                            <img src="${blogList.img}" width="200" height="200" alt="" typeof="Image" class="image-style-news-200x200" />
                                                                        </a>
                                                                        <div class="statistic">
                                                                            <div class="view">   <i class="far fa-eye">${blogList.viewer} </i></div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-6 promo-des">
                                                                        <p class="p-flex"><span><a href="/vi/cong-ty" hreflang="vi">Công ty</a></span> <span>${blogList.date}</span></p>
                                                                        <h3><a href="WebLab231GroupAssignment/blogDetail?id_blog=${blogList.id}" hreflang="vi">${blogList.title}</a></h3>
                                                                    </div>
                                                                </div>
                                                                <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-field.html.twig' -->

                                                            </span></div>
                                                        <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-fields.html.twig' -->

                                                    </div>
                                                </c:forEach>


                                                <!--3 item list -->


                                            </div>
                                        </div>
                                        <!-- END OUTPUT from 'core/themes/classy/templates/views/views-view.html.twig' -->

                                    </div>


                                </div>
                                <div class="col-12 p-0 mb-5 banner_qc">
                                    <div class="views-element-container">
                                        <div class="view view-term-function-by-itnvtoi view-id-term_function_by_itnvtoi view-display-id-block_1 js-view-dom-id-ed11b4b5e1c6b003a6ec2b31d737e88dbf1cb7f00f6a141a5abe9f15bf704d42">
                                            <div class="view-content">
                                                <div class="views-row">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container promo-back-white pt-3 pt-5 mt0-mb d-md-none">
                        <div class="row">
                            <div class="col-12 col-md-7 col-lg-4 order-md-12">
                                <div class="col-12 mb-5 box-news-r slide-box-news-r-mb p-0">

                                    <div class="views-element-container">

                                        <div class="view view-node-function-by-itnvtoi view-id-node_function_by_itnvtoi view-display-id-block_2 js-view-dom-id-be47353a5e67b08aa94d53badd50f558b49deec82be7035a8716dbadb76132be">
                                            <div class="view-content owl-loaded owl-drag">

                                                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s;"><div class="owl-item"><div class="views-row">

                                                                <div class="views-field views-field-nothing"><span class="field-content">
                                                                        <div class="row box-news-r-item mb-5">
                                                                            <div class="col-6 position-relative">
                                                                                <a href="/vi/vinfast-ra-mat-3-dong-o-dien-tu-lai-khang-dinh-tam-nhin-tro-thanh-hang-xe-dien-thong-minh-toan-cau" hreflang="vi">

                                                                                    <img src="/sites/default/files/styles/news_200x200/public/2021-01/VF33_frontview_0.jpg?itok=uVWg8i_I" width="200" height="200" alt="Vf33" typeof="Image" class="image-style-news-200x200">

                                                                                </a>




                                                                                <div class="statistic">
                                                                                    <div class="view"> 6,389</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6 promo-des">
                                                                                <p class="p-flex"><span><a href="/vi/cong-ty" hreflang="vi">Công ty</a></span> <span>22.01.2021</span></p>
                                                                                <h3><a href="/vi/vinfast-ra-mat-3-dong-o-dien-tu-lai-khang-dinh-tam-nhin-tro-thanh-hang-xe-dien-thong-minh-toan-cau" hreflang="vi">VinFast ra mắt 3 dòng ô tô điện tự lái - khẳng định tầm nhìn trở thành hãng xe điện thông minh toàn cầu</a></h3>
                                                                            </div>
                                                                        </div>
                                                                        <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-field.html.twig' -->

                                                                    </span></div>
                                                                <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-fields.html.twig' -->

                                                            </div></div><div class="owl-item"><div class="views-row">

                                                                <!-- THEME DEBUG -->
                                                                <!-- THEME HOOK: 'views_view_fields' -->
                                                                <!-- BEGIN OUTPUT from 'core/themes/stable/templates/views/views-view-fields.html.twig' -->
                                                                <div class="views-field views-field-nothing"><span class="field-content">

                                                                        <!-- THEME DEBUG -->
                                                                        <!-- THEME HOOK: 'views_view_field' -->
                                                                        <!-- BEGIN OUTPUT from 'core/themes/stable/templates/views/views-view-field.html.twig' -->
                                                                        <div class="row box-news-r-item mb-5">
                                                                            <div class="col-6 position-relative">





                                                                                <a href="/vi/vinfast-ra-mat-hai-dong-xe-may-dien-moi-cung-he-thong-tram-doi-pin-tren-toan-quoc" hreflang="vi">









                                                                                    <img src="/sites/default/files/styles/news_200x200/public/2021-01/anh-thumb-vinfast-ra-mat-hai-dong-xe-may-dien-moi-cung-he-thong-tram-doi-pin-tren-toan-quoc.jpg?itok=8d4TFSRU" width="200" height="200" alt="" typeof="Image" class="image-style-news-200x200">







                                                                                </a>




                                                                                <div class="statistic">
                                                                                    <div class="view"> 1,186</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6 promo-des">
                                                                                <p class="p-flex"><span><a href="/vi/thi-truong" hreflang="vi">Thị trường</a></span> <span>12.09.2019</span></p>
                                                                                <h3><a href="/vi/vinfast-ra-mat-hai-dong-xe-may-dien-moi-cung-he-thong-tram-doi-pin-tren-toan-quoc" hreflang="vi">VinFast ra mắt hai dòng xe máy điện mới cùng hệ thống trạm đổi pin trên toàn quốc</a></h3>
                                                                            </div>
                                                                        </div>
                                                                        <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-field.html.twig' -->

                                                                    </span></div>
                                                                <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-fields.html.twig' -->

                                                            </div></div><div class="owl-item"><div class="views-row">

                                                                <!-- THEME DEBUG -->
                                                                <!-- THEME HOOK: 'views_view_fields' -->
                                                                <!-- BEGIN OUTPUT from 'core/themes/stable/templates/views/views-view-fields.html.twig' -->
                                                                <div class="views-field views-field-nothing"><span class="field-content">

                                                                        <!-- THEME DEBUG -->
                                                                        <!-- THEME HOOK: 'views_view_field' -->
                                                                        <!-- BEGIN OUTPUT from 'core/themes/stable/templates/views/views-view-field.html.twig' -->
                                                                        <div class="row box-news-r-item mb-5">
                                                                            <div class="col-6 position-relative">





                                                                                <a href="/vi/vinfast-ra-mat-2-dong-xe-may-dien-moi-va-cong-bo-mo-hinh-trai-nghiem-mua-sam-o2o" hreflang="vi">









                                                                                    <img src="/sites/default/files/styles/news_200x200/public/2021-01/xe%20may%20dien%20vinfast.jpg?itok=YzDoiHah" width="200" height="200" alt="" typeof="Image" class="image-style-news-200x200">







                                                                                </a>




                                                                                <div class="statistic">
                                                                                    <div class="view"> 703</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-6 promo-des">
                                                                                <p class="p-flex"><span><a href="/vi/cong-ty" hreflang="vi">Công ty</a></span> <span>21.01.2021</span></p>
                                                                                <h3><a href="/vi/vinfast-ra-mat-2-dong-xe-may-dien-moi-va-cong-bo-mo-hinh-trai-nghiem-mua-sam-o2o" hreflang="vi">VinFast ra mắt 2 dòng xe máy điện mới và công bố mô hình trải nghiệm mua sắm O2O</a></h3>
                                                                            </div>
                                                                        </div>
                                                                        <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-field.html.twig' -->

                                                                    </span></div>
                                                                <!-- END OUTPUT from 'core/themes/stable/templates/views/views-view-fields.html.twig' -->

                                                            </div></div></div></div><div class="owl-nav disabled"><div class="owl-prev">prev</div><div class="owl-next">next</div></div><div class="owl-dots"><div class="owl-dot active"><span></span></div><div class="owl-dot"><span></span></div></div></div>

                                        </div>

                                        <!-- END OUTPUT from 'core/themes/classy/templates/views/views-view.html.twig' -->

                                    </div>

                                    <!-- END OUTPUT from 'core/themes/classy/templates/form/container.html.twig' -->



                                </div>
                            </div>
                            <div class="col-12 col-md-7 col-lg-8">
                                <!-- <img class="w-100" src="/themes/porto/img/vinfast/comment.png" title="" /> -->


                                <!-- THEME DEBUG -->
                                <!-- THEME HOOK: 'container' -->
                                <!-- BEGIN OUTPUT from 'core/themes/classy/templates/form/container.html.twig' -->
                                <div class="views-element-container">

                                    <!-- THEME DEBUG -->
                                    <!-- THEME HOOK: 'views_view' -->
                                    <!-- BEGIN OUTPUT from 'core/themes/classy/templates/views/views-view.html.twig' -->
                                    <div class="big-cmt-wrapper container view view-node-functions-haitran view-id-node_functions_haitran view-display-id-block_2 js-view-dom-id-29375c58c814ad2bf8379e16b06d2b396c966754592f493884565b75f73206fa">



                                        <div class="view-empty">

                                        </div>



                                        <!-- THEME DEBUG -->
                                        <!-- THEME HOOK: 'views_mini_pager' -->
                                        <!-- BEGIN OUTPUT from 'core/themes/classy/templates/views/views-mini-pager.html.twig' -->

                                        <!-- END OUTPUT from 'core/themes/classy/templates/views/views-mini-pager.html.twig' -->


                                    </div>

                                    <!-- END OUTPUT from 'core/themes/classy/templates/views/views-view.html.twig' -->

                                </div>

                                <!-- END OUTPUT from 'core/themes/classy/templates/form/container.html.twig' -->


                            </div>     
                        </div>
                    </div>

                </div>
                <!-- END OUTPUT from 'themes/porto/templates/itnvtoi/node--news--full.html.twig' -->
            </div>
            <!-- END OUTPUT from 'core/themes/classy/templates/block/block.html.twig' -->
        </div>
        <!-- END OUTPUT from 'core/themes/classy/templates/layout/region.html.twig' -->
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>