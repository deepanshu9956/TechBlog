package com.tech.blog.servlets;

import com.tech.blog.dao.postdao;
import com.tech.blog.entitites.Message;
import com.tech.blog.entitites.Post;
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
public class AddPostServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int cid=Integer.parseInt(req.getParameter("cid"));
        String ptitle=req.getParameter("pTitle");
        String pcontent=req.getParameter("pContent");
        String pcode=req.getParameter("pCode");

        HttpSession session=req.getSession();
        user user=(user)session.getAttribute("curruser");
        Part part=req.getPart("pic");


        Post p=new Post(ptitle,pcontent,pcode,part.getSubmittedFileName(),null,cid,user.getId());
        postdao post=new postdao(ConnectionProvider.getconnection());
        if(post.savePost(p)){
            out.println("posted");
            String path=req.getRealPath("/")+"Img"+ File.separator+part.getSubmittedFileName();

            if(Helper.saveFile(part.getInputStream(),path)){
                out.println("gg image saved");
            }
        }
        else{
            out.println("error");
        }


    }
}
