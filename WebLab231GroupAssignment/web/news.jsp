<%-- 
    Document   : news
    Created on : Jan 26, 2021, 5:26:40 PM
    Author     : PC
--%>

<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/scroll.css" media="all" />
</head>
<body>
    
    <div role="main" class="main relative news-page-all" style="margin-top: 200px;">
        <i class="fas fa-chevron-up" id="fa-chevron-up"></i>
        <div class="container mt-10">
            <div class="row">
                <div class="col-12 col-lg-6">
                    <ul class="ul-list-pj">


                        <jsp:useBean id="cate" scope="page" class="Dao.CategoryDAO"></jsp:useBean>
                            <li class="cateLink"><a href="WebLab231GroupAssignment/blog" title="Tất cả">Tất cả</a></li>
                            <c:forEach items="${cate.all}" var="cates" varStatus="index">
                            <li class="cateLink "><a  href="WebLab231GroupAssignment/getByCate?id_cate=${cates.id}">${cates.name}</a></li>
                            </c:forEach>

                    </ul>
                </div>
                <div class="col-12 col-lg-6 box-filter-promo">

                </div>
            </div>
            <div class="row list-promo mt-3  pb-15 position-relative">
                <div class="views-element-container">
                    <div class="view view-node-function-by-itnvtoi view-id-node_function_by_itnvtoi view-display-id-page_3 js-view-dom-id-dff285d7dbc9edec973d4cac9227b7d7edd783b30202983739b75cc2ba7a67ef">
                        <div class="view-filters">
                            <form class="views-exposed-form" data-drupal-selector="views-exposed-form-node-function-by-itnvtoi-page-3" action="WebLab231GroupAssignment/SearchTitle" method="GET" id="views-exposed-form-node-function-by-itnvtoi-page-3" accept-charset="UTF-8">
                                <div class="form--inline clearfix">
                                    <div class="js-form-item form-item js-form-type-textfield form-type-textfield js-form-item-title form-item-title form-no-label">
                                        <input placeholder="Nhập từ khóa tìm kiếm" data-drupal-selector="edit-title" type="text" id="edit-title" name="title_search" value="" size="30" maxlength="128" class="form-text">
                                    </div>
                                    <div class="js-form-item form-item js-form-type-select form-type-select js-form-item-tid form-item-tid form-no-label">
                                        <select data-drupal-selector="edit-tid" id="edit-tid" name="tid" class="form-select"><option value="All" selected="selected">- Any -</option><option value="844">Thị trường</option><option value="845">Phong cách</option><option value="846">Công nghệ</option><option value="847">Cộng đồng</option><option value="848">Công ty</option></select>
                                    </div>
                                    <div data-drupal-selector="edit-actions" class="form-actions js-form-wrapper form-wrapper" id="edit-actions--2">
                                        <input data-drupal-selector="edit-submit-node-function-by-itnvtoi" type="submit" id="edit-submit-node-function-by-itnvtoi" value="Tìm kiếm" class="button js-form-submit form-submit">
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="view-content"> 
                            <c:forEach items="${listBlog}" var="blogList" varStatus="index">
                                <c:if test="${index.index <=5}"> 
                                    <div class="views-row blogBox moreBox">
                                    </c:if>   
                                    <c:if test="${index.index >5}"> 
                                        <div class="views-row blogBox moreBox"  style="display: none;">
                                        </c:if> 
                                        <div class="views-field views-field-nothing"><span class="field-content">
                                                <div class="promo-img">
                                                    <a href="WebLab231GroupAssignment/blogDetail?id_blog=${blogList.id}" hreflang="vi">
                                                        <img src="${blogList.img}" width="360" height="200" alt="" typeof="Image" class="image-style-news-360x200">
                                                    </a>
                                                    <div class="statistic">
                                                        <div class="view"> ${blogList.viewer}</div>
                                                    </div>
                                                </div>
                                                <div class="col-12 promo-des">
                                                    <h3>
                                                        <a href="WebLab231GroupAssignment/blogDetail?id_blog=${blogList.id}" hreflang="vi">${blogList.title}</a>
                                                    </h3>
                                                    <p>
                                                        <span><a href="WebLab231GroupAssignment/getByCate?id_cate=${blogList.category}" hreflang="vi">${cate.getCateByID(blogList.category)}</a></span>
                                                        <span><i class="fa fa-clock-o" aria-hidden="true"></i> ${blogList.date}</span>
                                                    </p>
                                                </div>
                                            </span>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
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
            </div>
        </div>
        <script type="text/javascript">
            $('li.cateLink').on('click', (e) => {
                $('li.cateLink').removeClass('selected');
                $(e.currentTarget).addClass('selected');
            });

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
            
            
            
            
            $(document).ready(function () {
                    $(window).scroll(function () {
                        if ($(window).scrollTop() > 300) {
                            $('#fa-chevron-up').css({
                                "opacity": "1", "pointer-events": "auto"
                            });
                        } else {
                            $('#fa-chevron-up').css({
                                "opacity": "0", "pointer-events": "none"
                            });
                        }
                    });
                    $('#fa-chevron-up').click(function () {
                        $('html').animate({scrollTop: 0}, 500);
                    });
                });
            
        </script>
</body>
<%@ include file="/includes/footer.jsp" %>


