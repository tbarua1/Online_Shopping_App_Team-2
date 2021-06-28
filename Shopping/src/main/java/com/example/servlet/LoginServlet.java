package com.example.servlet;

import com.example.Dao.UserDao;
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

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        try(PrintWriter out = response.getWriter()){

             //coding area

              String email = request.getParameter("email");
              String password = request.getParameter("password");

              //validations

              //authentication
             UserDao userDao = new UserDao(FactoryProvider.getFactory());
             Customer customer = userDao.getCustomerByEmailAndPassword(email,password);
             //System.out.println(customer);
            HttpSession httpSession = request.getSession();

            if(customer==null)
            {

                httpSession.setAttribute("message","Oops!! Invalid Details ...Try Again!!");
                response.sendRedirect("login.jsp");
                return;
            }else {
                out.println("<h1> Welcome " + customer.getLastName() + "</h1>");

                //login
                httpSession.setAttribute("current-customer",customer);

                if (customer.getCustType().equals("admin"))
                {
                   //admin:-admin.jsp
                   response.sendRedirect("admin.jsp");
                }else if (customer.getCustType().equals("normal"))
                {
                    //normal:-normal.jsp
                    response.sendRedirect("index.jsp");
                }else
                {
                    out.println("we have not identified user type");
                }
            }




            }catch (Exception e){
                e.printStackTrace();
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
