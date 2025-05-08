package model;

public class User{
    private String username;
    private String password;
    private String role;
    
    public String getUserName(){return username;}
    public void setUserName(String username){this.username=username;}
    
    public String getPassword(){return password;}
    public void setPassword(String password){this.password=password;}
    
    public String getRole(){return role;}
    public void setRole(String role){this.role=role;}
    
}