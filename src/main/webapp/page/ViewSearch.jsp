<%@ page import="com.example.bus_online_shopping_system.model.entity.Ticket" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script>
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })
    </script>
</head>

<body>

<div class="container mt-5 pb-5">
    <div class="row">
        <div class="col-12 m-2">
            <c:forEach items="${requestScope.ticketList}" var="ticket">
                <div class="card order-1 d-inline-block m-2" style="width: 18rem;">
                    <img class="card-img-top" src="http://localhost:8081/Bus_online_shopping_system_war_exploded/img/download.png" alt="Card image cap">
                    <div class="card-body order-1">
                        <h5 class="card-title pb-2 text-center">${ticket.source} To ${ticket.destination}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Id : ${ticket.id}</h6>
                        <h6 class="card-subtitle mb-2 text-muted">Date : ${ticket.dateOfMoving}</h6>
                        <h6 class="card-subtitle mb-2 text-muted">Time : ${ticket.timeOfMoving}</h6>
                        <div class="d-flex justify-content-end ">
                            <a href="#" aria-current="page" class="card-link btn btn-outline-primary w-25"
                               data-toggle="modal"
                               data-target="#${ticket.id}">Buy </a>
                        </div>


                    </div>
                </div>

                <%--                        card--%>
                <div class="modal fade w-100" id="${ticket.id}" tabindex="-1" role="dialog" aria-labelledby="Buy"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <form action="BuyTicket" method="get">

                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Buy the Ticket</h5>
                                </div>
                                <div class="modal-body">

                                    <div class="form-group shadow-2-strong"
                                         style="border-radius: 1rem;">
                                        <div class="card-body text-center ">
                                                <%--id--%>
                                            <div class="form-outline mb-4 d-inline-block w-25">
                                                <input type="text" id="id" name="id"
                                                       class="form-control form-control-lg"
                                                       value="${ticket.id}" readonly/>
                                                <label class="form-label" for="id">source</label>
                                            </div>
                                                <%--id--%>
                                                <%--timeOfMoving--%>
                                            <div class="form-outline mb-4 d-inline-block w-25">
                                                <input type="text" id="timeOfMoving" name="time"
                                                       class="form-control form-control-lg" disabled
                                                       value="${ticket.timeOfMoving}"/>
                                                <label class="form-label" for="timeOfMoving">time</label>
                                            </div>
                                                <%--timeOfMoving--%>
                                                <%--dateOfMoving--%>
                                            <div class="form-outline mb-4 d-inline-block w-25">
                                                <input type="text" id="dateOfMoving" name="dateOfMoving"
                                                       class="form-control form-control-lg" disabled
                                                       value="${ticket.dateOfMoving}"/>
                                                <label class="form-label" for="dateOfMoving">source</label>
                                            </div>
                                                <%--dateOfMoving--%>
                                                <%--source--%>
                                            <div class="form-outline d-inline-block " style="width: 49%;">
                                                <input type="text" id="typeEmailX-2" name="source"
                                                       class="form-control form-control-lg" disabled
                                                       value="${ticket.source}"/>
                                                <label class="form-label" for="typeEmailX-2">source</label>
                                            </div>
                                                <%--source--%>
                                                <%--destination--%>
                                            <div class="form-outline d-inline-block " style="width: 49%;">
                                                <input type="text" id="destination" name="source"
                                                       class="form-control form-control-lg" disabled
                                                       value="${ticket.destination}"/>
                                                <label class="form-label" for="destination">destination</label>
                                            </div>
                                                <%--destination--%>
                                            <hr>
                                                <%--username--%>
                                            <div class="form-outline w-50 d-inline-block ">
                                                <input type="text" id="name" name="name"
                                                       class="form-control form-control-lg"/>
                                                <label class="form-label" for="name">name</label>
                                            </div>
                                                <%--username--%>
                                                <%--gender--%>
                                            <div class="form-outline mt-2">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" value="MALE" type="radio"
                                                           name="gender" id="MALE"
                                                           checked>
                                                    <label class="form-check-label" for="MALE">
                                                        MALE
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" value="FEMALE" type="radio"
                                                           name="gender"
                                                           id="FEMALE">
                                                    <label class="form-check-label" for="FEMALE">
                                                        FEMALE
                                                    </label>
                                                </div>
                                            </div>
                                                <%--gender--%>

                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-outline-secondary btn-lg"
                                           data-dismiss="modal" value="Close">
                                    <input class="btn btn-outline-primary btn-lg" type="submit"
                                           value="Buy">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <%--                        card--%>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
