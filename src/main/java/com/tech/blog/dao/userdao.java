package com.tech.blog.dao;
import com.tech.blog.entitites.user;

import java.sql.*;
public class userdao {
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }

    //to insert user to database
    public boolean saveUser(user user){

        boolean r=false;
        try{
            //prepare dynamic query
            String query="insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            pstmt.setString(5,user.getAbout());
            //execute
            pstmt.executeUpdate() ;
            r=true;

        }
        catch(Exception e){
            e.printStackTrace();
        }
        return r;
    }

    //get user by email and password
     public user getuserbyEmailandPassword(String email,String password){
        user user =null;
         try{
                String query="select * from user where email=? and password=?";
                PreparedStatement pstmt=con.prepareStatement(query);
                pstmt.setString(1,email);
                pstmt.setString(2,password);
               ResultSet set= pstmt.executeQuery();
               if(set.next()){
                   user=new user();
                   String name=set.getString("name");
                   user.setName(name);
                   user.setPassword(set.getString("password"));
                   user.setAbout(set.getString("about"));
                   user.setEmail(set.getString("email"));
                   user.setGender(set.getString("gender"));
                   user.setId(set.getInt("id"));
                   user.setDateTime(set.getTimestamp("rdate"));
                   user.setProfile(set.getString("profile"));

               }
         }
         catch(Exception e){
              e.printStackTrace();
         }
        return user;

     }

     public boolean updateUser(user user){
        boolean f=false;
        try{
            String query="update user set name=?,email=?,password=?,gender=?,profile=?,about=? where id=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1,user.getName());
            p.setString(2,user.getEmail());
            p.setString(3,user.getPassword());
            p.setString(4,user.getGender());
            p.setString(5,user.getProfile());
            p.setString(6,user.getAbout());
            p.setInt(7,user.getId());

            p.executeUpdate();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
     }
    public user getuserbyid(int cid){
        user user=null;
        try{
            String q="select * from user where id=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1,cid);
            ResultSet set=ps.executeQuery();
            if(set.next()){
                user=new user();
                String name=set.getString("name");
                user.setName(name);
                user.setPassword(set.getString("password"));
                user.setAbout(set.getString("about"));
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setId(set.getInt("id"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return user;
    }
}
