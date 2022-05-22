package com.tech.blog.servlets;

import com.tech.blog.dao.userdao;
import com.tech.blog.entitites.Message;
import com.tech.blog.entitites.user;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        userdao dao = new userdao(ConnectionProvider.getconnection());
         user u=dao.getuserbyEmailandPassword(email,password);
         if(u==null){
             //login fail
             //System.out.println("invalid");
             Message msg =new Message("Invalid","error","alert-danger");
                     res.sendRedirect("loginpage.jsp");
                     HttpSession s=req.getSession();
                     s.setAttribute("msg", msg );
         }
         else{
            //success
             HttpSession s=req.getSession();
             s.setAttribute("curruser",u);
             res.sendRedirect("profile.jsp");
         }

    }
}