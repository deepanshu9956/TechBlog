package com.tech.blog.servlets;

import com.tech.blog.dao.userdao;
import com.tech.blog.entitites.Message;
import com.tech.blog.entitites.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

import static java.lang.System.out;
@MultipartConfig
public class EditServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String userEmail=req.getParameter("user_email");
            String userName=req.getParameter("user_name");
            String userPassword=req.getParameter("user_password");
            String userAbout=req.getParameter("user_about");
            Part part=req.getPart("image");
            String imageName=part.getSubmittedFileName();
            HttpSession s =req.getSession();
            user user=(user)s.getAttribute("curruser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldimage=user.getProfile();
            user.setProfile(imageName);

            if(user.getProfile().isEmpty()){
                    user.setProfile("default.jpeg");
            }

            //update
            userdao dao=new userdao(ConnectionProvider.getconnection());

            boolean f=dao.updateUser(user);

            if(f){

                    String path=req.getRealPath("/")+"Img"+ File.separator+user.getProfile();
                    String path1=req.getRealPath("/")+"Img"+ File.separator+oldimage;
                    if(!oldimage.equals("default.jpeg"));
                    Helper.deleteFile(path1);
                    if(Helper.saveFile(part.getInputStream(),path)){
                            out.println("gg image saved");
                            Message msg =new Message("Successfully Upadted!","success","alert-success");

                            HttpSession so=req.getSession();
                            so.setAttribute("msg", msg );
                    }

                    out.println("updated details");
            }
            else{
                    out.println("not updated details");
                    Message msg =new Message("Error Occured!","error","alert-danger");

                    HttpSession so=req.getSession();
                    so.setAttribute("msg", msg );
            }
            resp.sendRedirect("profile.jsp");

    }
}
