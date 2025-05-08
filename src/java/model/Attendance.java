package model;

import java.sql.Date;

public class Attendance {
    private int id;
    private String studentId;
    private Date date;
    private String status;

    public Attendance() {}

    public Attendance(String studentId, Date date, String status) {
        this.studentId = studentId;
        this.date = date;
        this.status = status;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
