<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.bus_online_shopping_system.model.entity.User" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.bus_online_shopping_system.controller.impl.UserServiceImpl" %>
<%@ page import="com.example.bus_online_shopping_system.controller.UserService" %>
<%@ page import="com.example.bus_online_shopping_system.controller.impl.OrderServiceImpl" %>
<%@ page import="com.example.bus_online_shopping_system.model.entity.Order" %>
<%@ page import="java.util.List" %>

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
<%
    //    HttpSession session1 = request.getSession();
//    User user = (User) session1.getAttribute("user");
    Integer userId = null;
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("userId")) {
            userId = Integer.valueOf(cookie.getValue());
        }
    }
    UserServiceImpl userService = new UserServiceImpl();
    User user = userService.findById(User.class, userId);
%>
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
            <form action="SearchResult" method="get">
                <a class="navbar-brand" href="#">Search </a>
                <ul class="navbar-nav me-auto mb-1 mt-3 mb-lg-0 d-inline-block">
                    <li class="nav-item d-inline-block mx-2">
                        <input type="text" id="typeEmailX-2" name="source"
                               class="form-control form-control" placeholder="source"/>
                    </li>

                    <li class="nav-item d-inline-block mx-2">
                        <input type="text" id="typeE" name="destination"
                               class="form-control form-control" placeholder="destination"/>
                    </li>

                    <li class="nav-item d-inline-block mx-2">
                        <input type="text" id="d2" name="dateOfMoving"
                               class="form-control form-control" placeholder="date"/>
                    </li>

                    <li class="nav-item mx-2 d-inline-block">
                        <input class="btn btn-primary " type="submit"
                               value="Search">
                    </li>

                    <div class="align-content-end d-inline-block mx-3" style="direction: rtl">
                        <li class="nav-item mx-2 d-inline-block">
                            <h4 class="nav-link" aria-current="page"><%= user.getUsername() %> <b>|</b></h4>
                        </li>
                    </div>
                </ul>
            </form>
        </div>
    </div>
</nav>

<%
    HttpSession httpSession = request.getSession();
    OrderServiceImpl orderService = new OrderServiceImpl();
    List<Order> orders = orderService.getUserOrder(userId);
    request.setAttribute("orders", orders);

%>

<div class="container">
    <div class="row">
        <div class="col-12 m-2">
            <%----%>
            <c:forEach items="${orders}" var="order">
                <div class="card order-1 d-inline-block m-2" style="width: 18rem;">
                    <form action="DeleteOrder">
                        <img class="card-img-top" src="http://localhost:8081/Bus_online_shopping_system_war_exploded/img/download.png" alt="Card image cap">
                        <div class="card-body order-1">
                            <input class="card-title pb-2 text-center d-none" type="text" name="id" value="${order.id}">
                            <h5 class="card-title pb-2 text-center">Ticket (${order.id})</h5>
                            <h6 class="card-subtitle mb-2 text-muted ">Name : ${order.name}</h6>
                            <h6 class="card-subtitle mb-2 text-muted ">Gender : ${order.gender}</h6>
                            <h6 class="card-subtitle mb-2 text-muted ">Source : ${order.ticket.source}</h6>
                            <h6 class="card-subtitle mb-2 text-muted ">Destination : ${order.ticket.destination}</h6>
                            <h6 class="card-subtitle mb-2 text-muted ">Time : ${order.ticket.timeOfMoving}</h6>
                            <h6 class="card-subtitle mb-2 text-muted ">Date : ${order.ticket.timeOfMoving}</h6>
                            <input class="btn btn-outline-danger btn-sm" type="submit"
                                   value="DELETE">
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
