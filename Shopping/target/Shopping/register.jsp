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
        <title>New-User</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
     <%@include file="components/header.jsp"%>
      <div class="container">
      <div class="row mt-5">
        <div class="col-md-6 p-3">
            <div class="card">
                <div class="card-header custom-bg">
                  <h3 class="text-center my-3 text-font-teko-500-10px">Sign up here</h3>
                </div>
            <%@include file="components/message.jsp" %>
                <div class="card-body px-5">



                          <form action="/RegisterServlet" method="POST">
                            <div class="form-group">
                              <label for="fname">First Name </label>
                              <input name="first_name"  type="text" class="form-control" id="fname" placeholder="Enter First Name here">
                            </div>

                            <div class="form-group">
                            <label for="lname">Last Name </label>
                            <input name="last_name"type="text" class="form-control" id="lname" placeholder="Enter Last Name here">
                            </div>

                             <div class="form-group">
                                          <label for="email"> Email </label>
                                          <input name="email" type="email" class="form-control" id="email" placeholder="Enter Email here">
                             </div>

                              <div class="form-group">
                                           <label for="password"> Password </label>
                                           <input name="password" type="password" class="form-control" id="password" placeholder="Enter Password here">
                              </div>

                               <div class="form-group">
                                            <label for="phone"> Phone </label>
                                            <input name="phone_no" type="number" class="form-control" id="phone" placeholder="Enter PhoneNo here">
                               </div>

                                <div class="form-group">
                                             <label for="address"> Address </label>
                                             <textarea name="address" class="form-control" rows="3" id="address" placeholder="Enter your Address here"></textarea>
                                </div>

                                <a href="login.jsp" class="text-center d-block mb-2">If Already Registered...Login here</a>

                                <div class="container text-center">
                                    <button type="submit" class="btn  custom-bg">Register</button>
                                    <button type="reset" class="btn  custom-bg">Reset</button>
                                </div>
                          </form>

                       </div>
                </div>
            </div>

            <div class="col-md-6 p-3">
                <img class="ml-auto" src="images/shopping.png" style="width:100%;height:100%">
            </div>
        </div>
      </div>
    <%@include file="components/footer.jsp" %>
    </body>
</html>
