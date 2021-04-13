<%-- 
    Document   : register
    Created on : Jan 21, 2021, 10:05:07 PM
    Author     : tranp
--%>

 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Sign Up </title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/register/fonts/material-icon/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/register/css/style.css">
    </head>
    <body>

        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title" style="font-family: time new roman">Đăng Ký</h2>
                             <h4 class="form-title text-danger" style="color: red; font-family: time new roman">${message}</h4>
                           
                             <p>${msg}</p>
                             <form name="myForm" onsubmit="validateForm()" action ="registerAction" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="name" id="name" placeholder="Tên của bạn" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email" required/>
                                </div>
                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="username" placeholder="User name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" placeholder="Password" required/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="rePass" id="re_pass" placeholder="Nhập lại password" required/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Đăng Ký" />
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="https://media.baodautu.vn/Images/chicong/2020/08/04/KV_1.jpg" alt="sing up image"></figure>
                            <p class="signup-image-link">Tôi đã sẵn sàng làm thành viên của bạn!</p>
                            <a href="home" class="signup-image-link text-primary">Quay lại trang chủ!</a>
                            <a href="admin" class="signup-image-link text-primary">Đăng nhập</a>
                        </div>
                    </div>
                </div>
            </section>
            
           
        </div>

        

        <!-- JS -->

        <script>
            function validateForm() {
                
                if (g != h) {
                    alert("Pass and repass not match");
                }
            }

        </script>
        <script src="<%=request.getContextPath()%>/assets/register/vendor/jquery/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/register/js/main.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
