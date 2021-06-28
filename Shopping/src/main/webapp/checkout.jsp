<%--
  Created by IntelliJ IDEA.
  User: fahima
  Date: 6/25/2021
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    Customer customer = (Customer)session.getAttribute("current-customer");
    if(customer == null)
    {

        session.setAttribute("message","You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;

    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chekout-page</title>
    <%@include file="components/common_css_js.jsp"%>

</head>
<body>
<%@include file="components/header.jsp"%>

<div class="container">
    <div class="container-fluid mt-3">
        <%@include file="components/message.jsp"%>
    </div>
    <div class="row mt-5 mb-5">
        <div class="col-md-6">
        <!--Card-->
           <div class="card">
               <h2 class="text-center my-3" style="font-style: italic">Your Selected Items</h2>
               <div class="card-body">
                   <div class="cart-body">

                   </div>
               </div>
           </div>
        </div>
        <div class="col-md-6">
        <!--form details-->
            <div class="card">
                <h2 class="text-center my-3" style="font-style: italic">Your Details for Order</h2>
                <div class="card-body">

                    <form action="OrderServlet" method="post">

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input value="<%=customer.getLastName()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName">Name</label>
                            <input value="<%=customer.getCustEmail()%>" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Your Name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Mobile No</label>
                            <input value="<%=customer.getCustMobileNo()%>" type="number" class="form-control" id="exampleInputPhone" aria-describedby="emailHelp" placeholder="Enter Your Contact No">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                            <textarea value="<%=customer.getFirstName()%>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter Your Address" required></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn custom-bg">Order Now</button>
                            <a href="index.jsp" class="btn btn-outline-success">Continue Shopping</a>

                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="components/common_models.jsp"%>
<%@include file="components/footer.jsp"%>
</body>
</html>
