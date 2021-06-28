package com.example.servlet;

import com.example.Dao.UserDao;
import com.example.entities.Customer;
import com.example.entities.Product;
import com.example.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class OrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        try(PrintWriter out = response.getWriter()){


            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message"," Hurrey!! Order Placed Successfully  ");
            response.sendRedirect("checkout.jsp");


        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}


