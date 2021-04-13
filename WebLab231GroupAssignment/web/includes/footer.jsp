<%-- 
    Document   : footer
    Created on : Jan 6, 2021, 8:35:42 PM
    Author     : PC
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>

<div class="region region-footer">
    <nav role="navigation" aria-labelledby="block-vinfast-footer-menu" id="block-vinfast-footer" class="block block-menu navigation menu--footer">

        <h2 class="visually-hidden" id="block-vinfast-footer-menu">Menu</h2>
        <!-- Load Facebook SDK for JavaScript -->
        <div id="fb-root"></div>
        <script>
            window.fbAsyncInit = function () {
                FB.init({
                    xfbml: true,
                    version: 'v10.0'
                });
            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>

        <!-- Your Chat Plugin code -->
        <div class="fb-customerchat"
             attribution="setup_tool"
             page_id="104336315055179"
             theme_color="#ff5ca1"
             logged_in_greeting="Xin chào! Tôi có thể giúp gì cho bạn?"
             logged_out_greeting="Xin chào! Tôi có thể giúp gì cho bạn?">
        </div>

        <div class="clearfix"></div>
        <footer class="footer">
            <h2 class="hidden">Footer</h2>
            <div class="container">
                <div class="footer-main">
                    <nav class="social-top">
                        <a href="#" class="icon-social">
                            <svg aria-hidden="true" data-prefix="fab" data-icon="facebook-f"
                                 class="svg-inline--fa fa-facebook-f fa-w-9" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 264 512">
                                <path fill="currentColor"
                                      d="M76.7 512V283H0v-91h76.7v-71.7C76.7 42.4 124.3 0 193.8 0c33.3 0 61.9 2.5 70.2 3.6V85h-48.2c-37.8 0-45.1 18-45.1 44.3V192H256l-11.7 91h-73.6v229">
                                </path>
                            </svg>
                        </a>
                        <a href="#" class="icon-social">
                            <svg aria-hidden="true" data-prefix="fab" data-icon="youtube"
                                 class="svg-inline--fa fa-youtube fa-w-18" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                                <path fill="currentColor"
                                      d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z">
                                </path>
                            </svg>
                        </a>
                        <a href="#" class="icon-social">
                            <svg role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path fill="currentColor"
                                      d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z">
                                </path>
                            </svg>
                        </a>
                        <a href="#" class="icon-social">
                            <svg aria-hidden="true" data-prefix="fab" data-icon="instagram"
                                 class="svg-inline--fa fa-instagram fa-w-14" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                <path fill="currentColor"
                                      d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z">
                                </path>
                            </svg>
                        </a>
                    </nav>
                    <div class="footer-menu">
                        <ul>

                            <li>
                                <a href="WebLab231GroupAssignment/contactUs.jsp"><h4>Liên hệ<i class="icon"></i></h4></a>
                                <nav>
                                    <p>1900 232389</p>
                                </nav>
                                <nav>
                                    <p>customer_care@.....vn</p>
                                </nav>
                                <li>
                                    <a href="WebLab231GroupAssignment/blog"><h4>Tin tức<i class="icon"></i></h4></a>
                                    <li>
                                        <a href="WebLab231GroupAssignment/carList.jsp"><h4>Thông tin xe<i class="icon"></i></h4></a>

                                        <c:forEach items="${listCar}"  var="carList">
                                            <nav>
                                                <a href="WebLab231GroupAssignment/carDetail?id=${carList.id}">${carList.name}</a>
                                            </nav>
                                        </c:forEach>

                                        <li>
                                            <a href="WebLab231GroupAssignment/testDrive"><h4>Đăng ký lái thử<i class="icon"></i></h4></a><br>

                                                <li>
                                                    </ul>
                                                    </div>
                                                    <div class="footer-social">
                                                        <nav class="social">
                                                            <a target="_blank" href="https://www.facebook.com/Anhtpde140084/" class="icon-social">
                                                                <svg aria-hidden="true" data-prefix="fab" data-icon="facebook-f" class="svg-inline--fa fa-facebook-f fa-w-9" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 264 512"><path fill="currentColor" d="M76.7 512V283H0v-91h76.7v-71.7C76.7 42.4 124.3 0 193.8 0c33.3 0 61.9 2.5 70.2 3.6V85h-48.2c-37.8 0-45.1 18-45.1 44.3V192H256l-11.7 91h-73.6v229"></path></svg>
                                                            </a>
                                                            <a target="_blank" href="https://www.youtube.com/channel/UC_cksPWanjpbJMz3oKVcA_A" class="icon-social">
                                                                <svg aria-hidden="true" data-prefix="fab" data-icon="youtube" class="svg-inline--fa fa-youtube fa-w-18" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><path fill="currentColor" d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"></path></svg>
                                                            </a>
                                                            <a target="_blank" href="https://www.instagram.com/tran_phi_anh_2008/" class="icon-social">
                                                                <svg role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                                                    <path fill="currentColor" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
                                                                </svg>
                                                            </a>
                                                            <a target="_blank" href="https://www.instagram.com/tran_phi_anh_2008/" class="icon-social">
                                                                <svg aria-hidden="true" data-prefix="fab" data-icon="instagram" class="svg-inline--fa fa-instagram fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path></svg>
                                                            </a>
                                                        </nav>
                                                        <p>. All rights reserved.</p>
                                                        <p>© Copyright 2021</p>
                                                    </div>
                                                    <div class="footer-email">
                                                        <div class="wrapper">
                                                            <h3>Đăng ký ngay<br></h3>
                                                            <div class="input-group">
                                                                <input type="text" class="form-input" placeholder="Enter email address">
                                                                    <button class="input-group-btn">Đăng ký</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    </div>
                                                    </footer>

                                                    <div id="overlay"></div>  
                                                    <noscript>
                                                        <div>
                                                            For full functionality of this site it is necessary to enable JavaScript.
                                                            Here are the
                                                            <a href="http:http://www.enable-javascript.com/" target="_blank">instructions
                                                                how to enable JavaScript in your web
                                                                browser</a>.
                                                        </div>
                                                    </noscript>
                                                    </nav>

                                                    </div>



                                                    <div class="layout-tabs">
                                                        <div class="container">
                                                            <div class="region region-tabs">

                                                            </div>

                                                        </div>
                                                    </div>

                                                    </div>

                                                    </div>


                                                    <script type="application/json" data-drupal-selector="drupal-settings-json">{"path":{"baseUrl":"\/","scriptPath":null,"pathPrefix":"en\/","currentPath":"node\/37","currentPathIsAdmin":false,"isFront":true,"currentLanguage":"en"},"pluralDelimiter":"\u0003","ajaxPageState":{"libraries":"classy\/base,classy\/messages,core\/html5shiv,core\/normalize,paragraphs\/drupal.paragraphs.unpublished,system\/base,vinfast\/global-css,vinfast\/global-js,vinfast\/messages","theme":"vinfast","theme_token":null},"ajaxTrustedUrl":[],"user":{"uid":0,"permissionsHash":"8da8f646ddb9c9773eccb4c992b493eca61b8462d8d79b10a92964f3884c9520"}}</script>
                                                    <script src="WebLab231GroupAssignment/assets/js/js_FQNndRGqQOn0_u2fxm53RfTCNo8b4M5uFATpT16iWlA.js"></script>

                                                    <style type='text/css'>    

                                                        .embeddedServiceHelpButton .helpButton {
                                                            height: auto !important;
                                                            right: 12px !important;
                                                            bottom: 0 !important;
                                                        }

                                                        .embeddedServiceSidebarMinimizedDefaultUI.minimizedContainer:focus {
                                                            text-decoration: none !important;
                                                        }

                                                        .embeddedServiceSidebarMinimizedDefaultUI,
                                                        .embeddedServiceHelpButton .helpButton .uiButton {
                                                            background-color: #8f1015 !important;
                                                            max-width: 210px !important;
                                                            height: 35px !important;
                                                            font-size: 1.4rem !important;
                                                            width: auto !important;
                                                            border: none !important;
                                                            min-width: 90px !important;
                                                            padding:0 12px 0 10px !important;
                                                            font-family: "Montserrat", sans-serif !important;
                                                            border-radius: 12px 12px 0 0 !important;
                                                        }

                                                        .embeddedServiceSidebarMinimizedDefaultUI .content {
                                                            padding: 0 !important;
                                                        }

                                                        .embeddedServiceSidebarMinimizedDefaultUI:focus .message,
                                                        .helpButtonEnabled:focus .helpButtonLabel {
                                                            text-decoration: none !important;
                                                        }
                                                        .embeddedServiceSidebarMinimizedDefaultUI.helpButton {
                                                            bottom: 0 !important; 
                                                        }
                                                        .embeddedServiceSidebarMinimizedDefaultUI .minimizedText {
                                                            font-size: 1.4rem !important;
                                                        }
                                                        .embeddedServiceIcon.x-small svg {
                                                            width: 1.7rem !important;
                                                            height: 1.7rem !important;
                                                        }
                                                        .embeddedServiceSidebarMinimizedDefaultUI .messageContent {
                                                            margin: 0 !important;
                                                        }
                                                    </style>
                                                    <script type='text/javascript' src='https://service.force.com/embeddedservice/5.0/esw.min.js'></script>
                                                    <script src="https://www.google.com/recaptcha/api.js"></script>
                                                    <script lang="javascript">var __vnp = {code: 3297, key: '', secret: '2da15ff7fa798c84b591b8f594d5a3ed'};(function () {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.defer = true;
                ga.src = '//core.vchat.vn/code/tracking.js';
                var s = document.getElementsByTagName('script');
                s[0].parentNode.insertBefore(ga, s[0]);
            })();</script>
                                                    </body>
                                                    </html>
