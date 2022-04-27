<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: ali yegane
  Date: 4/25/2022
  Time: 7:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5 pb-5">
    <div class="row">
        <div class="col m-auto ">
            <div class="card m-auto mt-5 w-50 text-center" >
                <h5 class="card-header bg-success text-white text-center">Welcome!</h5>
                <div class="card-body">
                    <h5 class="card-title ">Bus Shopping System!</h5>
                    <p class="card-text"><%= request.getParameter("username") + " welcome to Bus Shopping System Website!" %></p>
                    <a href="http://localhost:8081/Bus_online_shopping_system_war_exploded/index.jsp"
                       class="btn btn-outline-info w-25">Back</a>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
