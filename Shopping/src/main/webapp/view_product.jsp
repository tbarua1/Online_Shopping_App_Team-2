<%@ page import="com.example.entities.Customer" %>
<%@ page import="com.example.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Dao.ProductDao" %>
<%@ page import="com.example.helper.FactoryProvider" %><%--
  Created by IntelliJ IDEA.
  User: fahima
  Date: 6/26/2021
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%

    Customer customer = (Customer)session.getAttribute("current-customer");
    if(customer == null)
    {

        session.setAttribute("message","You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    }else
    {

        if(customer.getCustType().equals("normal"))
        {

            session.setAttribute("message","You are not admin ! You can't access this page");
            response.sendRedirect("login.jsp");
            return;

        }


    }
    ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
    List<Product> list = pDao.getAllProducts();

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin-Panel-Products</title>
    <%@include file="components/common_css_js.jsp"%>
</head>
<body>
    <%@include file="components/header.jsp"%>
           <%@include file="components/message.jsp"%>
           <div class="container mt-3">
               <div class="row">
                   <div class="col-md-12">
                       <h3 class="text-center mt-3 text-font-teko-500-10px">List of Products</h3>
                       <table class="table table-striped table-bordered">
                           <thead class="custom-bg">
                           <tr>
                               <th>Product_Id</th>
                               <th>Product_Name</th>
                               <th>Product_Description</th>
                               <th>Product_Price</th>
                               <th>Product_Quantity</th>

                           </tr>
                           </thead>
                           <tbody>
                           <%
                               for (Product p1:list)
                               {


                           %>
                           <tr>
                               <th><%=p1.getProductId()%></th>
                               <td><%=p1.getProductName()%></td>
                               <td><%=p1.getProductDesc()%></td>
                               <td><%=p1.getProductPrice()%></td>
                               <td><%=p1.getProductQuantity()%></td>

                           </tr>

                           <%
                               }
                           %>
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>

    <%@include file="components/common_models.jsp"%>
    <%@include file="components/footer.jsp"%>
</body>
</html>
