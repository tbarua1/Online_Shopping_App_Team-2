<%@page import="com.example.entities.Customer"%>
<%

Customer cust = (Customer)session.getAttribute("current-customer");

%>


<nav class="navbar navbar-expand-lg navbar-light custom-bg sticky-top">
  <div class="container">
  <a class="navbar-brand text-font-sans-serif-500-20px" href="index.jsp"><img src="images/logoo.png" style="width:100%;"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link text-font-sans-serif-500-20px" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
     </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link text-font-sans-serif-500-20px" href="#" data-toggle="modal" data-target="#cart"  ><i class="fa fa-cart-plus"style="font-size: 35px; color:rgb(26, 8, 190);"></i><span class="ml-0 cart-items">()</span></a>
            </li>
     <%

          if(cust == null)
          {

     %>
         <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                   <a class="nav-link text-font-sans-serif-500-20px" href="login.jsp">Login</a>
                  </li>
             <li class="nav-item active">
                     <a class="nav-link text-font-sans-serif-500-20px" href="register.jsp">Register</a>
             </li>
          </ul>
    <%

    }else{

     %>
     <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
               <a class="nav-link text-font-sans-serif-500-20px" href="<%=cust.getCustType().equals("admin")?"admin.jsp":"index.jsp"%>"><%= cust.getCustEmail()%></a>
              </li>
             <li class="nav-item active">
                     <a class="nav-link text-font-sans-serif-500-20px" href="LogoutServlet">Logout</a>
             </li>
          </ul>

   <% }

    %>

    </div>
  </div>
</nav>