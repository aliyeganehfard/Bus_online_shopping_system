package com.example.bus_online_shopping_system.servlet;

import com.example.bus_online_shopping_system.controller.impl.OrderServiceImpl;
import com.example.bus_online_shopping_system.model.entity.Order;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeleteOrder", value = "/DeleteOrder")
public class DeleteOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        var orderService = new OrderServiceImpl();
        var order = orderService.findById(Order.class,Integer.valueOf(request.getParameter("id")));
        orderService.delete(order);
        request.getRequestDispatcher("/page/Home.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
