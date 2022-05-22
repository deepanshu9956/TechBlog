<%@ page import="com.tech.blog.entitites.Message" %><%--
  Created by IntelliJ IDEA.
  User: deepu
  Date: 16/05/22
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="Css/mystyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner_background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 64% 100%, 29% 94%, 0 100%, 0 0);
        }
    </style>
</head>
<body class="mainclass">

<%@ include file="navbar.jsp" %>
 <main class="col d-flex justify-content-center align-items-center primary_background banner_background " style="height: 80vh">
     <div class="container">
         <div class="row">
             <div class="col-md-4"></div>
                <div class="card list-group-item-dark">
                    <div class="card-header primary_background text-white text-center"><span class="fa fa-user-plus fa-3x"></span>
                        <p>Login here</p>
                    </div>
                    <%
                       Message m=(Message) session.getAttribute("msg");
                       if(m!=null){
                    %>

                    <div class="alert <%= m.getCssClass()%>" role="alert">
                        <%= m.getContent() %>
                    </div>

                    <%
                           session.removeAttribute("msg");
                       }
                    %>
                    <div class="card-body list-group-item-dark">
                        <form action="loginservlet" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" required  type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <button type="submit" class="btn btn-primary primary_background">Submit</button>
                        </form>
                    </div>
                </div>
         </div>
     </div>
 </main>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="Js/myjs.js" type="text/javascript"></script>
</body>
</html>
