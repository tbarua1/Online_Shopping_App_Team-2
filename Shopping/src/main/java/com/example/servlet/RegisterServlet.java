package com.example.servlet;

import com.example.entities.Customer;
import com.example.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import static com.example.helper.FactoryProvider.getFactory;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset-UTF-8");
        try(PrintWriter out = response.getWriter()){

            try{
                String custAddress =request.getParameter("address");
                String custEmail =request.getParameter("email");
                String custMobileNo=request.getParameter("phone_no");
                String custPassword=request.getParameter("password");
                String firstName=request.getParameter("first_name");
                String lastName=request.getParameter("last_name");


                //validations
                if(firstName.isEmpty()){
                  out.println("Name couldn't Blank");
                  return;
                }
            //creating user object to create data
           Customer customer = new Customer(custAddress,custEmail,custMobileNo,custPassword,firstName,lastName,"normal");

              Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction transaction = hibernateSession.beginTransaction();

                int custID = (int) hibernateSession.save(customer);

                transaction.commit();
                hibernateSession.close();

                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Registration Successful !!  Customer id is  " + custID);
                response.sendRedirect("register.jsp");
                return;


            }catch (Exception e){
                e.printStackTrace();
            }
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
    }// </editor-fold>

}


