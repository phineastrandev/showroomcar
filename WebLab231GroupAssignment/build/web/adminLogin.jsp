<%-- 
    Document   : adminPost
    Created on : Jan 10, 2021, 4:00:38 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <title>Đăng nhập</title>
        <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style6.css">

        <link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    </head>
    <body >
        <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
            <c:if test="${ not empty USER}">
                <c:redirect url = "home"/>
            </c:if>
            <div class="container">

                <div class="card login-card">
                    <div class="row no-gutters">
                        <div class="col-md-5">
                            <img src="images/aboutus/banner.jpg" alt="login" class="login-card-img">
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <div class="brand-wrapper">
                                    <img src="images/favicon.png" alt="logo" class="logo">
                                </div>
                                <p class="login-card-description">Đăng nhập bằng tài khoản của bạn</p>
                                <form action="loginAction" method="POST"">
                                    <div class="form-group">
                                        <label for="email" class="sr-only">Tài khoản</label>
                                        <input type="text" name="username" id="username" class="form-control" placeholder="Username" required> 
                                    </div>

                                    <div class="form-group mb-4">
                                        <label for="password" class="sr-only">Mật khẩu</label>
                                        <input type="password" name="pass" id="password" class="form-control" placeholder="***********" required>
                                                                                
                                    </div>
                                     <p class="text-center text-danger">${msg}</p>
                                    <p class="text-center text-danger">${msg1}</p>
                                    <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit" value="Login">
                                </form>


                                <a href="#!" data-target="#pwdModal" data-toggle="modal" class="forgot-password-link">Quên mật khẩu?</a>
                                <p class="login-card-footer-text">Bạn không có tài khoản? <a href="<%=request.getContextPath()%>/register.jsp" class="text-reset">Đăng kí tại đây.</a></p>
                                <nav class="login-card-footer-nav">
                                    <a href="#!">Điều khoản sử dụng</a>
                                    <a href="#!">Chính sách bảo mật</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <div id="pwdModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h1 class="text-center">What's My Password?</h1>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="text-center">

                                        <p>If you have forgotten your password you can reset it here.</p>
                                        <form action="ForgotPassword" method="POST">
                                            <div class="panel-body">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <input class="form-control input-lg" placeholder="Username" name="username_forgot" type="text" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <input class="form-control input-lg" placeholder="E-mail Address" name="email_forgot" type="email" required>
                                                    </div>
                                                    <input class="btn btn-lg btn-primary btn-block" value="Send My Password" type="submit">
                                                </fieldset>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                        </div>	
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script>
            function validateForm() {
                var x = document.getElementById('username').value;
                var y = document.getElementById('password').value;

                if (x == "" || y == "") {
                    alert("All field must be filled out");
                }
            }
            ;
        </script>

    </body>
</html>