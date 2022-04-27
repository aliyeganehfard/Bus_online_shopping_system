<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css"/>

    <!-- Bootstrap Date-Picker Plugin -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>


    <script>
        $(document).ready(function () {
            let date_input = $('input[name="date"]'); //our date input has the name "date"
            let container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            let options = {
                // format: 'mm/dd/yyyy',
                format: 'yyyy/dd/mm',
                container: container,
                todayHighlight: true,
                autoclose: true,
            };
            date_input.datepicker(options);
        })



    </script>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button
                class="navbar-toggler"
                type="button"
                data-mdb-toggle="collapse"
                data-mdb-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="#">Bus Shopping System</a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#" data-toggle="modal" data-target="#SingIn">Sign
                        In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#" data-toggle="modal" data-target="#SingUp">Sign
                        Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#" data-toggle="modal" data-target="#Ticket">Add
                        Ticket</a>
                </li>

            </ul>

        </div>
    </div>
</nav>

<%--singIn--%>

<div class="modal fade" id="SingIn" tabindex="-1" role="dialog" aria-labelledby="SingIn"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="loginServlet" method="get">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Sign In</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-group shadow-2-strong"
                         style="border-radius: 1rem;">
                        <div class="card-body text-center ">


                            <div class="form-outline mb-4 mt-5">
                                <input type="text" id="typeEmailX-2" name="username"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typeEmailX-2">username</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" id="typePasswordX-2" name="password"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typePasswordX-2">Password</label>
                            </div>

                            <!-- Checkbox -->
                            <div class="form-check d-flex justify-content-start mb-4">
                                <input class="form-check-input" type="checkbox" value=""
                                       id="form1Example3"/>
                                <label class="form-check-label" for="form1Example3"> Remember
                                    password </label>
                            </div>

                            <%--                            <input class="btn btn-outline-primary btn-lg btn-block" type="submit"--%>
                            <%--                                   value="Login">--%>


                        </div>
                    </div>
                    <%--                </form>--%>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="Close">
                    <input class="btn btn-outline-primary btn-lg" type="submit"
                           value="Login">

                </div>
            </form>
        </div>
    </div>
</div>

<%--singIn--%>
<%--register--%>
<div class="modal fade" id="SingUp" tabindex="-1" role="dialog" aria-labelledby="SingUp"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="SignUp" method="get">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle1">Sign Up</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-group shadow-2-strong"
                         style="border-radius: 1rem;">
                        <div class="card-body text-center ">


                            <div class="form-outline mb-4 mt-5">
                                <input type="text" id="typeEmailX-21" name="username"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typeEmailX-2">username</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" id="typePasswordX-21" name="password"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typePasswordX-2">Password</label>
                            </div>

                            <!-- Checkbox -->
                            <div class="form-check d-flex justify-content-start mb-4">
                                <input class="form-check-input" type="checkbox" value=""
                                       id="form1Example31"/>
                                <label class="form-check-label" for="form1Example3"> Remember
                                    password </label>
                            </div>

                            <%--                            <input class="btn btn-outline-primary btn-lg btn-block" type="submit"--%>
                            <%--                                   value="Login">--%>


                        </div>
                    </div>
                    <%--                </form>--%>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="Close">
                    <input class="btn btn-outline-primary btn-lg" type="submit"
                           value="Register">

                </div>
            </form>
        </div>
    </div>
</div>
<%--register--%>
<%--ticket--%>
<div class="modal fade" id="Ticket" tabindex="-1" role="dialog" aria-labelledby="Ticket"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form action="AddTicket" method="get">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle11">Add Ticket</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-group shadow-2-strong"
                         style="border-radius: 1rem;">
                        <div class="card-body text-center ">


                            <div class="form-outline mb-4 mt-5">
                                <input type="text" id="typeEmailX-211" name="source"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typeEmailX-2">source</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="typePasswordX-211" name="destination"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typePasswordX-2">destination</label>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="typePasswordXdf-211" name="dateOfMoving"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typePasswordX-2">date</label>
<%--                                <input class="form-control form-control-lg" id="date" name="date"--%>
<%--                                       placeholder="YYYY/MM/DD" type="text"/>--%>
<%--                                <label class="control-label" for="date">Date</label>--%>
                            </div>


                            <div class="form-outline mb-4">
                                <input type="text" id="typePasswordX-211d" name="time"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="typePasswordX-2">time</label>
                            </div>

                        </div>
                    </div>
                    <%--                </form>--%>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-outline-secondary btn-lg" data-dismiss="modal" value="Close">
                    <input class="btn btn-outline-primary btn-lg" type="submit"
                           value="Submit">
                </div>
            </form>
        </div>
    </div>
</div>
<%--ticket--%>

<%--<div class="container">--%>
<%--    <div class="row mt-5">--%>
<%--        <div class="col-lg-6 col-sm-12 pb-5 mt-5">--%>

<%--        </div>--%>
<%--        <div class="col-lg-6 col-sm-12 pb-5 mt-5">--%>

<%--            <form action="SignUp" method="get">--%>
<%--                <div class="form-group border border-secondary shadow-2-strong mt-5" style="border-radius: 1rem;">--%>
<%--                    <div class="card-body p-5 text-center">--%>

<%--                        <h3 class="mb-5">Sign Up</h3>--%>

<%--                        <div class="form-outline mb-4">--%>
<%--                            <input type="text" name="username" class="form-control form-control-lg"/>--%>
<%--                            <label class="form-label" for="typeEmailX-2">username</label>--%>
<%--                        </div>--%>

<%--                        <div class="form-outline mb-4">--%>
<%--                            <input type="password" name="password" class="form-control form-control-lg"/>--%>
<%--                            <label class="form-label" for="typePasswordX-2">Password</label>--%>
<%--                        </div>--%>

<%--                        <!-- Checkbox -->--%>
<%--                        <div class="form-check d-flex justify-content-start mb-4">--%>
<%--                            <input class="form-check-input" type="checkbox" value=""/>--%>
<%--                            <label class="form-check-label" for="form1Example3"> Remember password </label>--%>
<%--                        </div>--%>

<%--                        <input class="btn btn-outline-primary btn-lg btn-block" type="submit" value="Register">--%>


<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script>
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
    })

    // Data Picker Initialization
    $('.datepicker').datepicker({
        inline: true
    });
</script>
</body>
</html>