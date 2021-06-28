<%--
    Document   : index
    Created on : Jun 19, 2021, 12:57:41 AM
    Author     : fahima
--%>

<%@page import="com.example.helper.FactoryProvider"%>
<%@ page import="com.example.Dao.ProductDao" %>
<%@ page import="com.example.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Dao.CategoryDao" %>
<%@ page import="com.example.entities.Categories" %>
<%@ page import="com.example.helper.Helper" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home-Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
     <%@include file="components/header.jsp"%>
     <div class="container-fluid">
        <div class="row mt-3 mx-3 mb-3">


            <%
                String cat = request.getParameter("category");


                ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list=null;

                if (cat == null || cat.trim().equals("all"))
                {
                    list = productDao.getAllProducts();

                }
                else
                {

                    int cid =Integer.parseInt(cat.trim());
                    list=productDao.getAllProductsById(cid);

                }
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                List<Categories> clist = categoryDao.getCategories();
            %>

             <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item text-font-sans-serif-500-20px text-dark list-group-item-action active">
                     Categories
                    </a>


                <%
                    for (Categories c:clist)
                    {
                %>
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryName() %></a>
                    <%
                    }
                    %>
                </div>
            </div>
            <div class="col-md-10">

                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <!--traversing products -->
                            
                            <%
                                for (Product p:list)
                                {

                            %>
                            <!--Product CArd-->
                            <div class="card product-card">
                                <div class="container text-center">
                                    <img src="images/products/<%=p.getProductPhoto()%>" style="max-height: 200px; max-width: 100%;width: auto;" class="card-img-top m-2" alt="...">

                                </div>
                                <div class="card-body">

                                    <h5 class="card-title"><%=p.getProductName()%></h5>
                                    <p class="card-text"><%=Helper.get10Words(p.getProductDesc())%></p>

                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg" onclick="add_to_cart(<%= p.getProductId()%>,'<%=p.getProductName()%>',<%=p.getPriceAfterDiscount()%>)">Add to Cart</button>
                                    <button class="btn btn-outline-success text-dark fa fa-inr"> <%=p.getPriceAfterDiscount() %>/- <span class="text-muted discount-label fa fa-inr"> <%=p.getProductPrice() %> , <%=p.getProductDiscount() %> off</span></button>


                                </div>
                            </div>

                            <%
                                    
                                }
                                if (list.size()==0)
                                {
                                    out.println("<h3>no items in this category</h3>");
                                }
                            %>
                        </div>
                    </div>
                </div>

            </div>
            </div>

        </div>
     <%@include file="components/common_models.jsp"%>
     <%@include file="components/footer.jsp" %>
    </body>
</html>
