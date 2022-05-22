<%@ page import="com.tech.blog.dao.postdao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entitites.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="static java.sql.DriverManager.println" %>
<%@ page import="static java.awt.SystemColor.text" %>
<%@ page import="com.tech.blog.dao.likedao" %>
<%@ page import="com.tech.blog.entitites.user" %>
<%
    user user=(com.tech.blog.entitites.user)session.getAttribute("curruser");
    if(user==null){
        response.sendRedirect("loginpage.jsp");
    }
%>

<%
    postdao p=new postdao(ConnectionProvider.getconnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
if(cid==0){

     posts=p.getllpost();
}
else{
    posts=p.getpostbycatid(cid);
}

if(posts.size()==0){
    PrintWriter outs = response.getWriter();
    outs.println("<h4 class='display-3 text-center'>No Post in this section..</h4>" );
    return;
}
    for(Post post :posts){
%>
     <div class="col-md-6 mt-4">
        <div class="card">
        <img class="card-img-top" width="100px" height="300px" src="Img/<%= post.getPpic()%>" alt="Card image cap">
            <div class="card-body list-group-item-dark">
                <b><%=post.getPtitle()%></b>
                <p><%=post.getPcontent()%></p>

            </div>
            <div class="card-footer text-center primary_background">
                <%
                    likedao dao=new likedao(ConnectionProvider.getconnection());

                %>
                <a href="#jsp" onclick="doLike(<%=post.getPid()%>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span id="<%=post.getPid()%>"><%= dao.countlike(post.getPid()) %></span></a>

                <a href="show_blog_page.jsp?post_id=<%=post.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>


            </div>
        </div>
     </div>
<%
    }
%>