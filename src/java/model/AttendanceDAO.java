package model;

import java.sql.*;
import java.util.*;
import model.Attendance;
import database.DatabaseConnection;

public class AttendanceDAO {
    public boolean registerAttendance(Attendance attendance) {
        String sql = "INSERT INTO attendance(student_id, date, status) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, attendance.getStudentId());
            stmt.setDate(2, attendance.getDate());
            stmt.setString(3, attendance.getStatus());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Attendance> getAttendanceByStudentId(String studentId) {
        List<Attendance> records = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE student_id = ? ORDER BY date DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, studentId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getInt("id"));
                a.setStudentId(rs.getString("student_id"));
                a.setDate(rs.getDate("date"));
                a.setStatus(rs.getString("status"));
                records.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }
}
