package com.tech.blog.servlets;

import com.tech.blog.dao.userdao;
import com.tech.blog.entitites.Message;
import com.tech.blog.entitites.user;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static java.lang.System.out;
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String check=req.getParameter("check");
            //out.println(check);
            if(check==null){
                out.println(check);
            }
            else{
                String name=req.getParameter("user_name");
                String email=req.getParameter("user_email");
                String password=req.getParameter("user_password");
                String gender=req.getParameter("gender");
                String about=req.getParameter("about");
                //create user object
                user user=new user(name,email,password,gender,null,about);


                //create a user dao object
                userdao dao=new userdao(ConnectionProvider.getconnection());


                if(dao.saveUser(user)){
//                    Message msg =new Message("Invalid","success","alert-danger");
//                    HttpSession s= req.getSession();
//                    s.setAttribute("msg",msg);
                    out.println("done saving");
                }
                else{
//                    Message msg =new Message("Invalid","error","alert-danger");
//                    HttpSession s= req.getSession();
//                    s.setAttribute("msg",msg);
                    out.println("fk ! Cant save");
                }

        }
    }
}
