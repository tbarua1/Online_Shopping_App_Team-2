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
        <title>Login-Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
     <%@include file="components/header.jsp"%>
      <div class="container">
          <div class="row mt-5">
              <div class="col-md-6 p-3">
                  <div class="card mt-3">
                      <div class="card-header custom-bg">
                           <h3 class="text-center my-3 text-font-teko-500-10px">Login here</h3>
                      </div>
                      <div class="card-body px-5">
                      <%@include file="components/message.jsp" %>

                      <form action="LoginServlet" method="post">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Email address</label>
                          <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                          <small id="emailHelp" class="form-text text-muted"></small>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputPassword1">Password</label>
                          <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <a href="register.jsp" class="text-center d-block mb-2">If not Register...Register here</a>

                        <div class="container text-center">
                        <button type="submit" class="btn custom-bg">Submit</button>
                        <button type="reset" class="btn custom-bg">Reset</button>
                        </div>
                      </form>
                  </div>
              </div>
             </div>
              <div class="col-md-6 p-3">
                              <img  src="images/login.png" style="width:100%;height:100%">
              </div>
          </div>
      </div>
      <%@include file="components/footer.jsp" %>
    </body>
</html>
