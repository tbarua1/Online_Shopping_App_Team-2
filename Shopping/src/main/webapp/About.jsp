<%--
    Document   : about
    Created on : Jun 19, 2021, 12:57:41 AM
    Author     : fahima
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About-Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
     <%@include file="components/header.jsp"%>

       <div class="container mt-3 mb-3">
           <div class="card">
               <div class="card-header">
                   <h3>Objective of this project</h3>

                   <p class="text-justify"> The objective of this project is to develop a general purpose e-commerce
                   store where any kind of product can be bought from the comfort of home through
                       the internet.</p>
                   <p>An online store is a  virtual store on the internet where customers can
                   browse the catalog and select products of interest, the selected items collected in a shopping cart. At checkout time , the items in the shopping cart will be presented as an order.</p>


               </div>
               <div class="card-body">

                   <h3>Project Description</h3>

                    <p>Any member can register and view available products.<br><br>
                    only registered member can purchase multiple products regardless of quantity.<br><br>
                    Contact us page is available to contact Admin for Queries.<br><br>
                        Admin is the head to add the categories and product in the database.</p>


                    <ol>There are Four Roles available here.....

                  <h5>visitor</h5>
                        <li>Visitor can view , and search available Products.</li>

                   <h5>User</h5>
                        <li>User can view and purchase Products.</li>

                   <h5>Operator</h5>
                        <li>Operator can excess add option and can view everything of admin panel and also users some information.</li>

                            <h5>Admin</h5>
                    <li>An Admin has some extra privilege including all privilege of visitor and User.
                        An Admin can add products, see the list of the products information, and upload product.</li></ol>

               </div>

               <div class="card-footer">
               <h3>Design and Development program for project</h3>

                   <ul>
                       <li>Html5</li>
                       <li>CSS3</li>
                       <li>javaScript</li>
                       <li>BootStrap 4(Grid & Frameworks)</li>
                       <li>jQuery</li>
                       <li>Mysql Database with Mysql Workbench and SqlYog</li>
                       <li>Java</li>
                       <li>Servlets & Jsp</li>
                       <li>Hibernate</li>
                   </ul>

               </div>
           </div>
       </div>

    <%@include file="components/common_models.jsp"%>
     <%@include file="components/footer.jsp"%>
    </body>
</html>
