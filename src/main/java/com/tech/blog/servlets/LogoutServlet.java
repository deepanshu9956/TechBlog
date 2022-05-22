package com.tech.blog.servlets;

import com.tech.blog.entitites.Message;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession s=req.getSession();
        s.removeAttribute("curruser");
        Message m=new Message("Logout Successfully","success","alert-success");
        s.setAttribute("msg",m);
        res.sendRedirect("loginpage.jsp");


    }
}
