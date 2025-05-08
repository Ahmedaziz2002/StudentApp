package database;

import java.sql.*;

public class DatabaseConnection{
    private static final String JDBC_URL="jdbc:mysql://localhost:3306/student_app";
    private static final String JDBC_USER="root";
    private static final String JDBC_PASSWORD="Shamha@2002";
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD);
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}