<%-- 
    Document   : adminAccountModify
    Created on : Feb 19, 2021, 8:56:30 PM
    Author     : tranp
--%>

<%@ include file="/includes/admin/header.jsp" %>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4">Modify Account</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="ShowAccount">Show Account</a></li>
                <li class="breadcrumb-item active">Modify</li>
            </ol>
            <div class="card mb-4">
                <div class="card-body">
                    DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                    <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                    .
                </div>
            </div>
            <form action="UpdateAccount" method="POST" class="needs-validation" novalidate>
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom01">Name</label>
                        <input type="text" name="name" class="form-control" id="validationCustom01" placeholder="${acc.name}" value="${acc.name}" required>
                        <input type="hidden" name="id" class="form-control" id="validationCustom01"  value="${acc.id}" >
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationCustom02">Password</label>
                        <input type="text" name="password" class="form-control" id="validationCustom02" placeholder="${acc.pass}" value="${acc.pass}" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationCustomUsername">Username</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                            </div>
                            <input type="text" name="username" class="form-control" id="validationCustomUsername" placeholder="${acc.username}" value="${acc.username}" aria-describedby="inputGroupPrepend" required>
                            <div class="invalid-feedback">
                                Please choose a username.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationCustom03">Address</label>
                        <input type="text" name="address" class="form-control" id="validationCustom03" placeholder="${acc.address}" value="${acc.address}" >
                        <div class="invalid-feedback">
                            Please provide a valid Address.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom04">Phone</label>
                        <input type="text" name="phone" class="form-control" id="validationCustom04" placeholder="${acc.phone}" value="${acc.phone}" >
                        <div class="invalid-feedback">
                            Please provide a valid Phone.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationCustom05">Role</label>
                        <input type="text" name="role" class="form-control" id="validationCustom05" placeholder="${acc.role}" value="${acc.role}" required>
                        <div class="invalid-feedback">
                            Please provide a valid .
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Sure to update this one?
                        </label>
                        <div class="invalid-feedback">
                            You must agree before submitting.
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">Submit form</button>
            </form>


        </div>
    </main>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
    <%@ include file="/includes/admin/footer.jsp" %>
