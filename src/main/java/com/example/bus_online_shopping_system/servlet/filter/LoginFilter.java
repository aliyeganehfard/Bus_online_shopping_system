package com.example.bus_online_shopping_system.servlet.filter;

import com.example.bus_online_shopping_system.controller.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        chain.doFilter(request, response);
        var userService = new UserServiceImpl();
        var out = response.getWriter();
        var username = request.getParameter("username");
        var password = request.getParameter("password");
//        System.out.println("---------------------------------");
        var user = userService.loginUser(username,password);
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
//        System.out.println(user);
        if (user != null){
//            System.out.println("yes");
//            request.getRequestDispatcher("/page/Home.jsp").forward(request,response);
            session.setAttribute("user",user);
            Cookie cookie = new Cookie("userId",user.getId().toString());
            ((HttpServletResponse) response).addCookie(cookie);
            request.getRequestDispatcher("/page/Home.jsp")
                    .forward(request,response);
            chain.doFilter(request,response);
        }else {
            request.getRequestDispatcher("/page/UserNotFound.jsp").
                    forward(request,response);
//            RequestDispatcher rd
//                    = request.getRequestDispatcher("/page/test.html");
//            rd.include(request, response);

        }
    }
}
