<%--
    Document   : normal
    Created on : Jun 19, 2021, 12:57:41 AM
    Author     : fahima
--%>
<%@page import="com.example.entities.Customer"%>
<%

Customer customer = (Customer)session.getAttribute("current-customer");
if(customer == null)
{

      session.setAttribute("message","You are not logged in !! Login first");
      response.sendRedirect("login.jsp");
      return;

}else
{

    if(customer.getCustType().equals("admin"))
    {

        session.setAttribute("message","You are not a normal user ! Do not  access this page");
        response.sendRedirect("login.jsp");
        return;

    }


}

%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal-Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
     <%@include file="components/header.jsp"%>

        <h1>This is a Normal user Panel</h1>
     <%@include file="components/common_models.jsp"%>
     <%@include file="components/footer.jsp" %>
    </body>
</html>
