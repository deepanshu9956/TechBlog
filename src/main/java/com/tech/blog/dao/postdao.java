package com.tech.blog.dao;
import com.mysql.cj.protocol.Resultset;
import com.tech.blog.entitites.Category;
import com.tech.blog.entitites.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

public class postdao {
    private Connection con;

    public postdao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getallcategories(){
        ArrayList<Category> a=new ArrayList<>();
        try{
            String q="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet s=st.executeQuery(q);
            while(s.next()){
                int cid=s.getInt("cid");
                String name=s.getString("name");
                String description=s.getString("description");
                Category c=new Category(cid,name,description);
                a.add(c);
            }

        }
        catch(Exception e){
            e.printStackTrace();
        }
        return a;

    }

    public boolean savePost(Post p){
         boolean f=false;
        try{
            String q="insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values (?,?,?,?,?,?)";
            PreparedStatement pstm=this.con.prepareStatement(q);
            pstm.setString(1,p.getPtitle());
            pstm.setString(2,p.getPcontent());
            pstm.setString(3,p.getPcode());
            pstm.setString(4,p.getPpic());
            pstm.setInt(5,p.getCatid());
            pstm.setInt(6,p.getUserid());
            pstm.executeUpdate();
            f=true;

        }
        catch (Exception e){
            e.printStackTrace();
        }

         return f;
    }

    public List<Post> getllpost(){
        List<Post> list=new ArrayList<>();
        try{
            PreparedStatement p=this.con.prepareStatement("Select * from posts order by pid desc");
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                int catid=set.getInt("catid");
                int userid=set.getInt("userid");
                String ptitle=set.getString("ptitle");
                String pcontent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp date=set.getTimestamp("pdate");
                Post post=new Post(pid,ptitle,pcontent,pcode,ppic,date,catid,userid);
                list.add(post);
                out.println(pid);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getpostbycatid(int cid){
        List<Post> list=new ArrayList<>();
        try{
            PreparedStatement p=this.con.prepareStatement("Select * from posts where catid=?");
            p.setInt(1,cid);
            ResultSet set=p.executeQuery();
            while(set.next()){
                int pid=set.getInt("pid");
                int userid=set.getInt("userid");
                String ptitle=set.getString("ptitle");
                String pcontent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp date=set.getTimestamp("pdate");
                Post post=new Post(pid,ptitle,pcontent,pcode,ppic,date,cid,userid);
                list.add(post);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public Post getpostbypid(int pid){
        String q="Select * from posts where pid=?";
        Post post=null;
        try{
            PreparedStatement stm=this.con.prepareStatement(q);
            stm.setInt(1,pid);
            ResultSet set=stm.executeQuery();

            if(set.next()){
                int userid=set.getInt("userid");
                int cid=set.getInt("catid");
                String ptitle=set.getString("ptitle");
                String pcontent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp date=set.getTimestamp("pdate");
                post=new Post(pid,ptitle,pcontent,pcode,ppic,date,cid,userid);

            }

        }
        catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
}
