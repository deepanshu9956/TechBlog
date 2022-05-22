<%--
  Created by IntelliJ IDEA.
  User: deepu
  Date: 17/05/22
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<html>
  <head>
    <title>Sorry!! Something Went Wrong</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="Css/mystyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      .banner_background{
        clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 64% 100%, 29% 94%, 0 100%, 0 0);
      }
    </style>
  </head>
  <body>

  <%@ include file="navbar.jsp" %>
  <div class="container text-center">
    <br>
    <br>
    <img src="Img/accidental-slip-542551_1280.jpeg" class="img-fluid center align-items-center " width="500" height="600" stye="margin: 20px" >

    <h5 class="display-3 center ">OOPS! Something went wrong..</h5>
    <h6 class="text-dark center "><%= exception %></h6> <br>
    <a href="index.jsp" class="btn btn-dark mt-3 "> Home</a>

  </div>
  
  </body>
</html>
