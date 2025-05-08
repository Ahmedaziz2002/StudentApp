package model;

import java.sql.*;
import java.util.*;
import model.Subject;
import database.DatabaseConnection;

public class SubjectDAO {
    private Connection conn;

    public SubjectDAO() {
        conn = DatabaseConnection.getConnection();
    }

    public List<Subject> getAllSubjects() {
        List<Subject> list = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM subjects");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
