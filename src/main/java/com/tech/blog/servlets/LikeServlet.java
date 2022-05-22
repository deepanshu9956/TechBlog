package com.tech.blog.servlets;

import com.tech.blog.dao.likedao;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LikeServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String operation=req.getParameter("operation");
            int uid=Integer.parseInt(req.getParameter("uid"));

        int pid=Integer.parseInt(req.getParameter("pid"));
        likedao dao=new likedao(ConnectionProvider.getconnection());
         if(operation.equals("like")){
             boolean f=dao.insertLike(pid,uid);

         }
    }
}
