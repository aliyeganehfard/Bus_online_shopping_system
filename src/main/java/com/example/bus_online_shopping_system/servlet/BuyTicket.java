package com.example.bus_online_shopping_system.servlet;

import com.example.bus_online_shopping_system.controller.impl.OrderServiceImpl;
import com.example.bus_online_shopping_system.controller.impl.TicketServiceImpl;
import com.example.bus_online_shopping_system.controller.impl.UserServiceImpl;
import com.example.bus_online_shopping_system.model.entity.Order;
import com.example.bus_online_shopping_system.model.entity.Ticket;
import com.example.bus_online_shopping_system.model.entity.User;
import com.example.bus_online_shopping_system.model.util.Gender;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.DataInput;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.stream.Stream;

@WebServlet(name = "BuyTicket", value = "/BuyTicket")
public class BuyTicket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            Integer userId = null;
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")) {
                    userId = Integer.valueOf(cookie.getValue());
                }
            }

            var userService = new UserServiceImpl();
            var user = userService.findById(User.class,userId);
            var ticketService = new TicketServiceImpl();
            var ticket = ticketService.findById(Ticket.class, Integer.valueOf(request.getParameter("id")));

            var orderService = new OrderServiceImpl();
            var order = Order.builder()
                    .id(null)
                    .ticket(ticket)
                    .user(user)
                    .name(request.getParameter("name"))
                    .gender(Gender.valueOf(request.getParameter("gender")))
                    .build();
            orderService.save(order);
            request.getRequestDispatcher("/page/Home.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        var ticket = Ticket.builder()
//                .id(Integer.valueOf(request.getParameter("id")))
//                .source(request.getParameter("source"))
//                .destination(request.getParameter("destination"))
//                .dateOfMoving(Date.valueOf("dateOfMoving"))
//                .timeOfMoving(Time.valueOf("timeOfMoving"))
//                .build();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
