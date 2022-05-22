package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    public static Connection getconnection(){

        try{
            if(con==null) {
                //driver class load
                Class.forName("com.mysql.jdbc.Driver");
                //create connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "password");
                System.out.println("ho gya connection");
            }
        }
        catch(Exception e){
            System.out.println("nhi hua connection");
            e.printStackTrace();
        }
        return con;
    }
}
