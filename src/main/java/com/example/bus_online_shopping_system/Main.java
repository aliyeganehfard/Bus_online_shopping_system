package com.example.bus_online_shopping_system;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Main", value = "/Main")
public class Main extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        var username = request.getParameter("username") + " welcome to site!";
//        var password = request.getParameter("password");
//        out.print(username);
//        out.print(password);

//        out.print(username + " welcome to site");
        out.println("<html><body>");
        out.println("<h1>" + username + "</h1>");
        out.println("</body></html>");
        out.close();
//        response.sendRedirect("/page/Home.jsp");
//        response.addHeader("Refresh","/page/Home.jsp");
        HttpSession session = request.getSession();

        request.getRequestDispatcher("/page/Home.jsp")
                .forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
