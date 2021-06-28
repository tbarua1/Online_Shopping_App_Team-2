<%@page import="com.example.entities.Customer"%>
<%

Customer cust = (Customer)session.getAttribute("current-customer");

%>


<nav class="navbar navbar-expand-lg navbar-light custom-bg sticky-top">
  <div class="container">
  <a class="navbar-brand text-font-sans-serif-500-20px" href="index.jsp">Xeom Fashion</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link text-font-sans-serif-500-20px" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-font-sans-serif-500-20px" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Categories
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
     </ul>
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
               <a class="nav-link text-font-sans-serif-500-20px" href="#"><%= cust.getCustEmail()%></a>
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