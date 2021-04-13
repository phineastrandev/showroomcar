<%-- 
    Document   : luxSa2
    Created on : Jan 19, 2021, 10:55:56 AM
    Author     : PC
--%>

<%@ include file="/includes/header.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="WebLab231GroupAssignment/assets/css/css3/css3.css" media="all" />
</head>
<section class="vf-banner-product" style="margin-top: 75px">
    <h2 class="hidden">Banner</h2>
    <div class="banner-img">
        <figure style="background-image: url(${carDetail.banner_img}); background-size: 100%"></figure>
    </div>
    <div class="banner-copy">
        <div class="copy">
            <p class="way-animate animated fadeInUp" data-animate="fadeInUp" style="opacity: 1; animation-delay: 0s;">
                <img src="WebLab231GroupAssignment/images/carlist/${carDetail.car_logo}" alt="" class="">
            </p>
        </div>
    </div>
</section>
<section class="vf-technology">
    <div class="wrapper">
        <div class="copy">
            <h3 class="way-animate animated fadeInUp" data-animate="fadeInUp" style="opacity: 1; animation-delay: 0s;">VÌ SAO <br>             ${carDetail.name} <br>             LÀ LỰA CHỌN <br>             CHO BẠN?</h3>
            <p class="way-animate animated fadeInUp" data-animate="fadeInUp" style="opacity: 1; animation-delay: 0s;">${carDetail.name} là chiếc xe tiềm năng dành riêng cho những
                khách hàng tinh tế. <br>

                Từ đầu xe bề thế, đuôi xe vuốt về sau kiểu cổ điển đến vành và lốp xe lớn, tất cả sự khác biệt đã tạo nên
                một ${carDetail.name} hài hoà. </p>
        </div>
        <div class="image way-animate animated fadeInUp" data-animate="fadeInUp" style="opacity: 1; animation-delay: 0s;">
            <figure>
                <!--<figcaption>
                        <img src="WebLab231GroupAssignment/images/carlist/LuxA2/product-2.png" alt="" class="img">
                    </figcaption>-->
            </figure>
        </div>
        <ul class="technology-list">
            <li class="way-animate" data-animate="fadeInUp" style="opacity: 0; animation-delay: 0s;">
                <span class="icon" style="background-image: url(WebLab231GroupAssignment/images/carlist/design_0.svg)"></span>
                <div class="text">
                    <h4> ĐỘT PHÁ TƯ DUY THIẾT KẾ </h4>
                    <p> Một chiếc xe được thiết kế vì khách hàng và do chính khách hàng bình chọn. </p>
                </div>
            </li>
            <li class="way-animate" data-animate="fadeInUp" style="opacity: 0; animation-delay: 0s;">
                <span class="icon" style="background-image: url(WebLab231GroupAssignment/images/carlist/fast-forward-arrows_0.svg)"></span>
                <div class="text">
                    <h4> KHOẺ KHOẮN VÀ TINH TẾ </h4>
                    <p> Sự kết hợp giữa hình dáng khỏe khoắn và cấu trúc hoàn hảo tạo nên vẻ ngoài rất hiện đại, bền vững với thời gian cho ${carDetail.name}. </p>
                </div>
            </li>
            <li class="way-animate" data-animate="fadeInUp" style="opacity: 0; animation-delay: 0s;">
                <span class="icon" style="background-image: url(WebLab231GroupAssignment/images/carlist/start_0.svg)"></span>
                <div class="text">
                    <h4> ĐẬM BẢN SẮC VIỆT </h4>
                    <p>Thiết kế táo bạo, đẳng cấp nhưng vô cùng mềm mại với đặc trưng non nước Việt Nam, văn hoá Việt Nam. </p>
                </div>
            </li>
        </ul>
    </div>
</section>

<!--strut2-->
<section class="vf-specs" style="margin-top: 80px;">
    <div class="wrapper">
        <div class="image">
            <img src="${carDetail.getImg_front()}" alt="" class="img">
        </div>
        <div class="specs specs-desk">
            <h2>THÔNG SỐ ${carDetail.name}  </h2>
            <div class="specs-image">
                <img src="${carDetail.getImg_front()}" alt="" class="img">
            </div>
            <div class="specs-body">
                <div class="content">
                    <h3>      KÍCH THƯỚC &amp; KHỐI LƯỢNG 
                    </h3>
                    <div class="content-item">
                        <div class="content-title">      Dài x Rộng x Cao (mm)
                        </div>
                        <div class="content-group ">
                            <div class="content-desc">
                                <div class="content-sub"></div>
                                <div class="content-text">
                                    ${carDetail.getLxWxH() }
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
                                    ${carDetail.wheelbase}

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
                                    ${carDetail.fullload}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="specs-foot">
                    <a href="WebLab231GroupAssignment/carDetailRedirect?id=${carDetail.id}" class="btn-specs btn-more"><i class="icon"></i> <span>Xem thêm</span></a>
                    <a href="WebLab231GroupAssignment/carDetailRedirect?id=${carDetail.id}" class="btn-specs btn-more-mb" data-text="VIEW MORE" data-text-show="Close">
                        <i class="icon"></i> <span>Xem thêm</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

</section>


<section class="vf-configure">
    <div class="container">
        <div class="configure-top way-animate animated fadeInUp" data-animate="fadeInUp" style="opacity: 1; animation-delay: 0s;">
            <h3>THIẾT KẾ CHIẾC XE CỦA BẠN</h3>
            <p>Màu sắc, vành xe cho đến nội thất và cả bộ máy,
                bạn hoàn toàn có quyền quyết định</p>
        </div>
        <div class="configure-main">
            <div class="tab-content">
                <div class="content active" id="luxa2">
                    <div class="configure-name way-animate animated fadeInUp" data-animate="fadeInUp" data-animate-delay="0.2" style="opacity: 1; animation-delay: 0.2s;">
                        <c:forEach items="${listColor}" var="item" begin="0" end="0">
                            <h4 class="name">${item.color}</h4>
                        </c:forEach>


                    </div>
                    <div class="configure-img">
                        <c:forEach items="${listColor}" var="item" begin="0" end="0">
                            <img class="img list-car" src="${item.img_color}" alt="">
                        </c:forEach>


                    </div>
                    <div class="choose-color way-animate animated fadeIn" data-animate="fadeIn" style="opacity: 1; animation-delay: 0s;">
                        <h4>màu sắc </h4>
                        <ul class="color-list">
                            <c:forEach items="${listColor}" var="item" varStatus="index">
                                <c:if test="${index.first }">
                                    <li class="active linkCar" data-name="BRAHMINY WHITE" onclick="imgSlider('${item.img_color}'); nameSlider('${item.color}');" data-image-src="WebLab231GroupAssignment/images/carlist/LuxA2/LUX A M2 (White).png">
                                        <span style="background-color: ${item.color_code}"></span>
                                    </li>
                                </c:if>
                                <c:if test="${not index.first }">
                                    <li class="linkCar" data-name="BRAHMINY WHITE" onclick="imgSlider('${item.img_color}'); nameSlider('${item.color}');" data-image-src="WebLab231GroupAssignment/images/carlist/LuxA2/LUX A M2 (White).png">
                                        <span style="background-color: ${item.color_code}"></span>
                                    </li>
                                </c:if>
                            </c:forEach>

                        </ul>
                    </div>
                </div>
            </div>
            <p class="fadil-noted">
                *Hình ảnh thực tế có thể thay đổi
            </p>
        </div>
    </div>
</section>

<section class="product-review product-comment" id="comments">
    <div class="container">
        <h3 class="text-align-center">Dưới đây là 1 số phản hồi từ khách hàng đã mượn xe</h3>
        <div class="full-width-content">

            <div class="review-content comment-content" >
                <jsp:useBean id="userGet" scope="page" class="Dao.CommentDAO"></jsp:useBean>
                <c:forEach items="${feedBackCar}" var="items" >
                    <c:if test="${not empty items.getFeedBack()}">
                        <div class="item">
                            <div class="avt">
                                <img src="${userGet.getAvatar(items.getUser_ID())}">
                            </div>
                            <div class="info">
                                <p>
                                    <strong class="name">${items.getFullname()}</strong>
                                </p>
                                <div class="content">
                                    ${items.getFeedBack()}
                                </div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>


            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    function imgSlider(anything) {
        document.querySelector('.list-car').src = anything;
    }

    function nameSlider(nameColor) {
        document.querySelector('.name').innerHTML = nameColor;

    }

    $('li.linkCar').on('click', (e) => {
        $('li.linkCar').removeClass('active');
        $(e.currentTarget).addClass('active');
    });


</script>

<%@ include file="/includes/footer.jsp" %>