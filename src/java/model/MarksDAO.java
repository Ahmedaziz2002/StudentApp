package model;

import java.sql.*;
import java.util.*;
import database.DatabaseConnection;
public class MarksDAO {
    private Connection conn;

    public MarksDAO() {
        conn = DatabaseConnection.getConnection();
    }

    public boolean saveMark(String studentId, int subjectId, String semester, String grade) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO marks (student_id, subject_id, semester, grade) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, studentId);
            ps.setInt(2, subjectId);
            ps.setString(3, semester);
            ps.setString(4, grade);
            return ps.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<MarkView> getMarksByStudent(String studentId) {
        List<MarkView> list = new ArrayList<>();
        try {
            String query = "SELECT s.name AS subject_name, m.semester, m.grade " +
                           "FROM marks m JOIN subjects s ON m.subject_id = s.id " +
                           "WHERE m.student_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MarkView mv = new MarkView();
                mv.setSubjectName(rs.getString("subject_name"));
                mv.setSemester(rs.getString("semester"));
                mv.setGrade(rs.getString("grade"));
                list.add(mv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Student getStudentById(String studentId) {
        Student s = null;
        try {
            String sql = "SELECT * FROM students WHERE student_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = new Student();
                s.setStudentId(rs.getString("student_id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
}
