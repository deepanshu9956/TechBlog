<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
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

<div class="container-fluid p-0 m-0 banner_background">
    <div class="jumbotron primary_background text-white">
        <div class="container">
            <h3 class="display-3">Welcome , Friends</h3>
            <p>Welcome to technical Blog,World Of technologies. A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
            <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.[1] The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.</p>
    <a href="registerpage.jsp" class="btn btn-outline-light btn-lg">Start! Its Free</a>
    <a href="loginpage.jsp" class="btn btn-outline-light btn-lg">Login</a>
        </div>
    </div>
</div>
<br>
 <div class="container mainclass">
    <div class="row mb-2">
        <div class="col-md-4">
            <div class="card" >
                <div class="card-body list-group-item-dark">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary_background text-white">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
                <div class="card-body list-group-item-dark">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary_background text-white">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" >
                <div class="card-body list-group-item-dark">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn primary_background text-white">Read More</a>
                </div>
            </div>
        </div>
    </div>
     <div class="row">
         <div class="col-md-4">
             <div class="card" >
                 <div class="card-body list-group-item-dark">
                     <h5 class="card-title">Java Programming</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn primary_background text-white">Read More</a>
                 </div>
             </div>
         </div>
         <div class="col-md-4">
             <div class="card" >
                 <div class="card-body list-group-item-dark">
                     <h5 class="card-title">Java Programming</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn primary_background text-white">Read More</a>
                 </div>
             </div>
         </div>
         <div class="col-md-4">
             <div class="card" >
                 <div class="card-body list-group-item-dark">
                     <h5 class="card-title">Java Programming</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn primary_background text-white">Read More</a>
                 </div>
             </div>
         </div>
     </div>
 </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="Js/myjs.js" type="text/javascript"></script>
</body>
</html>