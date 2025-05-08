package model;

import java.sql.*;
import model.User;
import database.DatabaseConnection;

public class UserDAO{
    public User checkLogin(String username,String password)throws Exception{
        Connection con=DatabaseConnection.getConnection();
        PreparedStatement ps=con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs=ps.executeQuery();
        
        User user=null;
        if(rs.next()){
            user=new User();
            user.setUserName(rs.getString("username"));
            user.setRole(rs.getString("role"));
        }
        con.close();
        return user;
    }
}