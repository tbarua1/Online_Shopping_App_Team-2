<%--
    Document   : admin
    Created on : Jun 19, 2021, 12:57:41 AM
    Author     : fahima
--%>
<%@page import="com.example.entities.Customer"%>
<%@ page import="com.example.Dao.CategoryDao" %>
<%@ page import="com.example.helper.FactoryProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.entities.Categories" %>
<%@ page import="com.example.helper.Helper" %>
<%@ page import="java.util.Map" %>
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

%>
<%
    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
    List<Categories> list = cDao.getCategories();

    //getting Count
   Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
          <%@include file="components/header.jsp" %>

          <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp"%>
            </div>

            <div class="row mt-3 mb-3">
                <div class="col-md-4">
                    <div class="card" data-toggle="tooltip" data-placement="bottom" title="Number of users on this website">
                                        <div class="card-body text-center">
                                        <div class="container">
                                            <img src="images/users.png" style="max-width:125px;" class="img-fluid rounded circle" alt="user_icon">
                                        </div>
                                        <h1><%=m.get("userCount")%></h1>
                                        <h1 class="text-uppercase text-muted">Users</h1>
                                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" data-toggle="tooltip" data-placement="bottom" title="No. of Categories">
                                        <div class="card-body text-center">
                                        <div class="container">
                                             <img src="images/categories.png" style="max-width:125px;" class="img-fluid rounded-circle" alt="categories_icon">
                                        </div>
                                        <h1><%=list.size()%></h1>
                                        <h1 class="text-uppercase text-muted">Categories</h1>
                                        </div>
                    </div>
                </div>
                <div class="col-md-4 ">
                      <div class="card" data-toggle="tooltip" data-placement="left" title="Total no of products">
                                        <div class="card-body text-center">
                                        <div class="container">
                                             <img src="images/product.png" style="max-width:125px;" class="img-fluid rounded-circle" alt="product_icon">
                                        </div>
                                        <h1><%=m.get("productCount")%></h1>
                                        <h1 class="text-uppercase text-muted"> Products</h1>
                                        </div>
                      </div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                     <div class="card" data-toggle="modal" data-target="#add-category-modal">
                                         <div class="card-body mb-2 text-center">
                                            <div class="container">
                                              <img src="images/addcategories.jpg" style="max-width:125px;" class="img-fluid rounded-circle" alt="product_icon">
                                            </div>
                                          <p>Click here to add new categories</p>
                                          <h1 class="text-uppercase text-muted">Add Categories</h1>
                                         </div>
                     </div>
                </div>

                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                                           <div class="card-body mb-2 text-center">
                                                <div class="container">
                                                   <img src="images/addproduct.jpg" style="max-width:125px;" class="img-fluid rounded-circle" alt="product_icon">
                                                </div>
                                             <p>Click here to add new product</p>
                                             <h1 class="text-uppercase text-muted">Add Products</h1>
                                           </div>
                    </div>
                </div>
            </div>
          <div class="row mt-3 mb-3">

              <div class="col-md-12">
                  <div onclick="window.location='view_product.jsp'" class="card" data-toggle="tooltip" data-placement="bottom" title="Click here to view all the products">
                      <div class="card-body mb-2 text-center">
                          <div class="container">
                              <img src="images/viewproduct.png" style="max-width:125px;" class="img-fluid rounded-circle" alt="product_icon">
                          </div>
                          <p>Click here to view all the products</p>
                          <h1 class="text-uppercase text-muted">View Products</h1>
                      </div>
                  </div>
              </div>

          </div>
        </div>
        <!-- Add Categories modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">

                 <form action="ProductOperationServlet" method="post">

                       <input type="hidden" name="operation" value="addcategory">

                     <div class="form-group">
                         <input type="text" class="form-control" name="catName" placeholder="Enter Category Name" required>
                     </div>
                     <div class="form-group">
                         <textarea class="form-control" style="height:250px;" placeholder="Enter category description" name="catDescription" required></textarea>
                     </div>

                     <div class="container text-center">
                         <button class="btn custom-bg">Add Category</button>
                         <button type="button" class="btn custom-bg" data-dismiss="modal">Close</button>
                     </div>
                 </form>


              </div>
            </div>
          </div>
        </div>
        <!--End categories Modal -->
         <!-- Add Products modal -->
                <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header custom-bg">
                        <h5 class="modal-title" id="productModalLabel">Fill Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">

                         <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                          <input type="hidden" name="operation" value="addproduct">
                             <div class="form-group">
                                 <input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required>
                             </div>
                             <div class="form-group">
                                 <textarea class="form-control" style="height:100px;" placeholder="Enter Product description" name="productDescription" required></textarea>
                             </div>
                             <div class="form-group">
                                 <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price" required>
                             </div>
                             <div class="form-group">
                                 <input type="number" class="form-control" name="productQuantity" placeholder="Enter Product Quantity" required>
                             </div>
                             <div class="form-group">
                                 <input type="number" class="form-control" name="productDiscount" placeholder="Enter Product Discount" required>
                             </div>

                             <!--product category -->


                             <div class="form-group">
                                    <select name="catId" class="form-control" id="">
                                       <%
                                           for (Categories c:list) {

                                       %>
                                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryName() %></option>

                                        <%
                                            }
                                        %>
                                    </select>
                             </div>

                             <!-- product files-->
                             <div class="form-group">
                                 <label for="productPic" class="d-block">Select Picture of product</label>
                                 <input type="file" id="productPic" name="pPic" required>
                             </div>
                             <!--Submit Button -->
                             <div class="container text-center">
                                 <button class="btn custom-bg">Add Product</button>
                                 <button type="button" class="btn custom-bg" data-dismiss="modal">Close</button>
                             </div>
                         </form>


                      </div>
                    </div>
                  </div>

                <!--End product Modal -->

                </div>
     <%@include file="components/common_models.jsp" %>
      <script>
          $(function () {
              $('[data-toggle="tooltip"]').tooltip()
          })
      </script>
     <%@include file="components/footer.jsp" %>
    </body>
</html>
