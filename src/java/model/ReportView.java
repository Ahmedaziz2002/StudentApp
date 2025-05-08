package model;

public class ReportView {
    private String studentId;
    private String studentName;
    private String email;
    private String subjectName;
    private String semester;
    private double gpa;

    // Constructors
    public ReportView() {}

    public ReportView(String studentId, String studentName, String email, String subjectName, String semester, double gpa) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.email = email;
        this.subjectName = subjectName;
        this.semester = semester;
        this.gpa = gpa;
    }

    // Getters and Setters
    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

    public String getSemester() { return semester; }
    public void setSemester(String semester) { this.semester = semester; }

    public double getGpa() { return gpa; }
    public void setGpa(double gpa) { this.gpa = gpa; }
}
