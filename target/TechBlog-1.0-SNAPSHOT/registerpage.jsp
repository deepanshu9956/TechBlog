<%--
  Created by IntelliJ IDEA.
  User: deepu
  Date: 16/05/22
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Register Page</title>
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
<%@include file="navbar.jsp"%>
<main class="banner_background primary_background" style="padding: 80px;">
    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card ">
                <div class="card-header text-center primary_background text-white">
                    <span class="fa fa-3x fa-user-circle"></span><br>
                    Register Here
                </div>
                <div class="card-body list-group-item-dark">
                    <form id="reg-form" action="registerservlet" method="post">

                        <div class="form-group">
                            <label for="user_name">User Name</label>
                            <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp"   >
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="form-group">
                            <label>Select Gender</label>
                            <input type="radio" name="gender" value="male"> Male
                            <input type="radio" name="gender" value="female"> Female
                        </div>
                        <div class="form-group">
                            <textarea name="about" class="form-control" rows="5" placeholder="Enter Something"></textarea>
                        </div>

                        <div class="form-group form-check">
                            <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Agree Terms & Condition</label>
                        </div>
                        <div class="container" style="display: none;>
                            <span class="fa fa-refresh fa-spin" id="loader "></span>
                            <h6>please wait..</h6>
                        </div>
                        <button id="submit-btn" type="submit" class="btn btn-primary primary_background">Submit</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="Js/myjs.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){
        console.log("loaded");
        $('#reg-form').on('submit',function(event){
            event.preventDefault();
            let form=new FormData(this);

            $("#submit-btn").hide();
            $("#loader").show();
            /*send this form to register servlet*/
            $.ajax({
                url: "registerservlet",
                type: 'POST',
                data: form,
                success: function(data,textStatus,jqXHR){

                    console.log("hehe");
                    console.log(data);

                    $("#submit-btn").show();
                    $("#loader").hide ();


                     if($("#exampleCheck1").is(':checked')){
                        swal("Registered Successfully")
                            .then((value) => {
                                window.location="loginpage.jsp";
                            });
                     }
                     else{
                         swal("Check the box");
                     }
                    },

                error: function(jqXHR,textStatus,errorThrown){
                    console.log("nono");

                    $("#submit-btn").show();
                    $("#loader").hide ();

                    swal("Something went wrong..try again")

                },
                processData: false,
                contentType: false
            })
        })
    })
</script>
</body>
</html>
