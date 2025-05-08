package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.ReportView;
import database.DatabaseConnection;

public class ReportDAO {

    public List<ReportView> getReportBySemester(String semester) {
        List<ReportView> reports = new ArrayList<>();
        String sql = "SELECT s.student_id, s.name AS student_name, s.email, subj.name AS subject_name, m.semester, " +
                     "AVG(CASE m.grade " +
                     "    WHEN 'A+' THEN 4.0 " +
                     "    WHEN 'A'  THEN 4.0 " +
                     "    WHEN 'A-' THEN 3.7 " +
                     "    WHEN 'B+' THEN 3.3 " +
                     "    WHEN 'B'  THEN 3.0 " +
                     "    WHEN 'B-' THEN 2.7 " +
                     "    WHEN 'C+' THEN 2.3 " +
                     "    WHEN 'C'  THEN 2.0 " +
                     "    WHEN 'D'  THEN 1.0 " +
                     "    ELSE 0.0 END) AS gpa " +
                     "FROM marks m " +
                     "JOIN students s ON m.student_id = s.student_id " +
                     "JOIN subjects subj ON m.subject_id = subj.id " +
                     "WHERE m.semester = ? " +
                     "GROUP BY s.student_id, subj.name, m.semester, s.name, s.email";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, semester);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ReportView report = new ReportView();
                report.setStudentId(rs.getString("student_id"));
                report.setStudentName(rs.getString("student_name"));
                report.setEmail(rs.getString("email"));
                report.setSubjectName(rs.getString("subject_name"));
                report.setSemester(rs.getString("semester"));
                report.setGpa(rs.getDouble("gpa"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }
}
