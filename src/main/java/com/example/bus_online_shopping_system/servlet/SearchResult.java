package com.example.bus_online_shopping_system.servlet;

import com.example.bus_online_shopping_system.controller.impl.TicketServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(name = "SearchResult", value = "/SearchResult")
public class SearchResult extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        var ticketService = new TicketServiceImpl();
        var ticketList = ticketService.SearchTicket(
          Date.valueOf(request.getParameter("dateOfMoving")),
          request.getParameter("source"),
          request.getParameter("destination")
        );
        request.setAttribute("ticketList",ticketList);
        request.getRequestDispatcher("/page/ViewSearch.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
