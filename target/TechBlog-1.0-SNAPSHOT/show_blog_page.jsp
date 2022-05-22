<%@ page import="com.tech.blog.entitites.user" %>
<%@ page import="com.tech.blog.dao.postdao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entitites.Post" %>
<%@ page import="com.tech.blog.entitites.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tech.blog.entitites.Message" %>
<%@ page import="com.tech.blog.dao.userdao" %>
<%@ page import="com.tech.blog.dao.likedao" %>
<%@ page errorPage="errorpage.jsp" %>

<%--
  Created by IntelliJ IDEA.
  User: deepu
  Date: 20/05/22
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  user user=(com.tech.blog.entitites.user)session.getAttribute("curruser");
  if(user==null){
    response.sendRedirect("loginpage.jsp");
  }
%>

<%
  int postId=Integer.parseInt(request.getParameter("post_id"));
  postdao d=new postdao(ConnectionProvider.getconnection());
  Post p=d.getpostbypid(postId);

%>
<html>
  <head>
    <title>Post Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="Css/mystyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      .banner_background{
        clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 64% 100%, 29% 94%, 0 100%, 0 0);
      }
      .post-title{
        font-weight: 100;
        font-size: 30px;
      }
      .post-date{
        font-style: italic;

      }
      .row-user{
        border:1px solid #e2e2e2;
        padding-top: 15px;

      }
      .post-user-info{
        font-size:20px;
      }
      .post-content{
        font-weight: 100;
        font-size: 25px;
      }

    </style>
  </head>
  <body class="mainclass">
  <nav class="navbar navbar-expand-lg navbar-dark primary_background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-balance-scale"></span>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="profile.jsp">Home<span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
            Explore Categories
          </a>
          <div class="dropdown-menu list-group-item-dark" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="https://en.wikipedia.org/wiki/Programming_language">Programming Language</a><a class="dropdown-item" href="#">Cloud Computing</a><a class="dropdown-item" href="#">Web Technologies</a>
            <a class="dropdown-item" href="https://www.geeksforgeeks.org/data-structures/">Data Structure</a>
            <a class="dropdown-item" href="https://www.geeksforgeeks.org/how-to-prepare-for-competitive-programming/">Competetive Coding</a>
            <a class="dropdown-item" href="https://en.wikipedia.org/wiki/Machine_learning">Machine Learning</a>
            <a class="dropdown-item" href="https://www.investopedia.com/terms/a/artificial-intelligence-ai.asp#:~:text=Artificial%20intelligence%20(AI)%20refers%20to,as%20learning%20and%20problem%2Dsolving.">Artificial Intelligence</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Add Post </a>
        </li>

      </ul>
      <ul class="navbar-nav mr-right">
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%=user.getName()%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logoutservlet">Logout</a>
        </li>
      </ul>
    </div>
  </nav>


  <div class="container">
    <div class="row my-4">
      <div class="col-md-8 offset-md-2">
          <div class="card">
            <div class="card-header primary_background text-white ">

              <h4 class="post-title"><%=p.getPtitle()%></h4>
            </div>
            <div class="card-body list-group-item-dark">
              <img class="card-img-top my-5" height="300px" width="100px" src="Img/<%= p.getPpic()%>" alt="Card image cap">
                <div class="row my-3 primary_background text-white row-user">
                  <div class="col-md-8">
                    <%
                      userdao u=new userdao(ConnectionProvider.getconnection());
                      user usr=u.getuserbyid(p.getUserid());
                    %>
                    <p class="post-user-info"><a href=""><%=usr.getName()%></a> has posted :</p>
                  </div>
                  <div class="'col-md-4">
                    <p class="post-date"><%=p.getPdate()%></p>
                  </div>
                </div>
              <p class="post-content"><%=p.getPcontent()%></p>
              <br>
              <div class="post-code">
              <pre><%=p.getPcode()%></pre>
              </div>
            </div>
            <div class="card-footer text-center primary_background">
              <%
                likedao dao=new likedao(ConnectionProvider.getconnection());

              %>
            <a onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= dao.countlike(p.getPid()) %></span></a>

          </div>


          </div>
      </div>
    </div>
  </div>


  <!-- Modal -->
  <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header primary_background text-white">
          <h5 class="modal-title" id="exampleModalLabel">Tech_Blog</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="container text-center">
            <img src="Img/<%=user.getProfile()%>" class="img-fluid" height="600" width="200" style="border-radius: 50%;" >
            <h5 class="modal-title " id="exampleModalLabel1"><%= user.getName()%></h5>
            <br>
            <div id="profile-details">
              <table class="table">
                <tbody>
                <tr>
                  <th scope="row">ID :</th>
                  <td><%= user.getId()%></td>
                </tr>
                <tr>
                  <th scope="row">Email :</th>
                  <td><%= user.getEmail()%></td>
                </tr>
                <tr>
                  <th scope="row">Gender :</th>
                  <td><%= user.getGender()%></td>
                </tr>
                <tr>
                  <th scope="row">Status :</th>
                  <td><%= user.getAbout()%></td>
                </tr>
                </tbody>
              </table>
            </div>

            <div id="profile-edit" style="display: none;">
              <h3 class="mt-2">Please Edit Carefully</h3>
              <form action="editservlet" method="post" enctype="multipart/form-data">
                <table class="table">
                  <tr>
                    <td>Name: </td>
                    <td><input type ="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                  </tr>
                  <tr>
                    <td>Email: </td>
                    <td><input type ="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                  </tr>
                  <tr>
                    <td>Password: </td>
                    <td><input type ="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                  </tr>
                  <tr>
                    <td>Gender: </td>
                    <td><%= user.getGender() %></td>
                  </tr>
                  <tr>
                    <td>About: </td>
                    <td><textarea rows="3" class="form-control" name="user_about"><%= user.getAbout() %></textarea></td>
                  </tr>
                  <tr>
                    <td>New Pic:</td>
                    <td><input type="file" name="image" class="form control"></td>
                  </tr>

                </table>
                <div class="container">
                  <button type="submit" class="btn btn-outline-primary">Save</button>
                </div>
              </form>
            </div>

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
        </div>
      </div>
    </div>
  </div>


  <!--Post Modal-->

  <!-- Modal -->
  <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="add-poost-modal">Provide the post details..</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id ="add-post-form" action="addpostservlet" method="post">
            <div class="form-group">
              <select class="form-control" name="cid">
                <option selected disabled> Choose </option>
                <%
                  postdao postd=new postdao(ConnectionProvider.getconnection());
                  ArrayList<Category> list=postd.getallcategories();
                  for(Category c : list){

                %>
                <option value="<%=c.getCid()%>"><%=c.getName() %></option>

                <%
                  }
                %>
              </select>
            </div>

            <div class="form-group">
              <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
            </div>
            <div class="form-group">
              <textarea name="pContent" class="form-control" style="height : 200px; " placeholder="Enter Your Content"></textarea>
            </div>
            <div class="form-group">
              <textarea name="pCode" class="form-control" style="height : 200px; " placeholder="Enter Your program (if any)"></textarea>
            </div>
            <div class="form-group">
              <input name="pic" type="file" placeholder="Select Picture">
            </div>


            <div class="'container text-center">
              <button type="submit" class="btn btn-outline-primary">Post</button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <script src="Js/myjs.js" type="text/javascript"></script>
  <script>
    $(document).ready(function(){
      let editstatus=false;
      $('#edit-profile-button').click(function(){
        if(editstatus==false){
          $('#profile-details').hide()

          $('#profile-edit').show();
          editstatus=true;
          $(this).text("Back");
        }
        else{
          $('#profile-details').show()

          $('#profile-edit').hide();
          editstatus=false;
          $(this).text("Edit");

        }
      })
    })

    $(document).ready(function(e){
      $("#add-post-form").on("submit",function(event){
        console.log("f");
        event.preventDefault();
        let form=new FormData(this);
        $.ajax({
          url: "addpostservlet",
          type: "POST",
          data: form,
          success: function(data,textstatus,jqxhr){

            swal("Good Job","saved successfully","success");

          },
          error : function(data,textstatus,jqxhr){
            swal("Error!!","Something  went wrong try again...","error");
          },
          processData: false,
          contentType: false

        })

      })
    } )

  </script>

    </body>
</html>
