package com.example.bus_online_shopping_system.servlet;

import com.example.bus_online_shopping_system.controller.impl.UserServiceImpl;
import com.example.bus_online_shopping_system.model.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SignUp", value = "/SignUp")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        var user = User.builder()
                .id(null)
                .username(request.getParameter("username"))
                .password(request.getParameter("password"))
                .build();
        var userService = new UserServiceImpl();
        userService.save(user);
        request.getRequestDispatcher("/page/SingUpSuccess.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
