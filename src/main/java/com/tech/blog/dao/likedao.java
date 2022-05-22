package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class likedao {
    Connection con;
    public likedao(Connection con){
        this.con=con;
    }
    public boolean insertLike(int pid,int uid){
        boolean b= false;
         try{
            String q="insert into  liked(pid,uid) values(?,?)";
             PreparedStatement p=this.con.prepareStatement(q);
             p.setInt(1,pid);
             p.setInt(2,uid);
             p.executeUpdate();
             b=true;
         }
         catch(Exception e){
             e.printStackTrace();
        }
         return b;
    }

    public int countlike(int pid){
        int count=0;
        try{
             String q="select count(*) from liked where pid=? ";
             PreparedStatement p=this.con.prepareStatement(q);
             p.setInt(1,pid);
             ResultSet s=p.executeQuery();
             if(s.next()){
                 count=s.getInt("count(*)");
             }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public boolean islikebyuser(int pid,int uid){
        boolean ans=false;

        try{
            String q="select * from liked where pid=? and uid=?";
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1,pid);
            p.setInt(2,uid);

            ResultSet s=p.executeQuery();
            if(s.next()){
                ans=true;
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public boolean deletelike(int pid,int uid){
        boolean ans=false;

        try{
            String q="delete from liked where pid=? and uid=?";
            PreparedStatement p=this.con.prepareStatement(q);
            p.setInt(1,pid);
            p.setInt(2,uid);

            p.executeUpdate();
            ans=true;

        }
        catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }
}
