package com.example.bus_online_shopping_system.servlet;

import com.example.bus_online_shopping_system.controller.impl.TicketServiceImpl;
import com.example.bus_online_shopping_system.model.entity.Ticket;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet(name = "AddTicket", value = "/AddTicket")
public class AddTicket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        var ticket = Ticket.builder()
                .id(null)
                .source(request.getParameter("source"))
                .destination(request.getParameter("destination"))
                .dateOfMoving(Date.valueOf(request.getParameter("dateOfMoving")))
                .timeOfMoving(Time.valueOf(request.getParameter("time")))
                .build();
        var ticketService = new TicketServiceImpl();
        ticketService.save(ticket);
        request.getRequestDispatcher("/page/AddTicketSuccess.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
