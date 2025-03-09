package com.example.model;

public class User {
    // Fields corresponding to the customer table
    private String cmob;       // Customer Mobile
    private String cname;      // Customer Name
    private String cadd;       // Customer Address
    private String carea;      // Customer Area
    private String ccity;      // Customer City
    private String email;      // Customer Email
    private String uname;      // Username
    private String upass;      // Password
    private String secq;       // Security Question
    private String ans;        // Security Answer

    // Default Constructor
    public User() {}

    // Parameterized Constructor (optional, for convenience)
    public User(String cmob, String cname, String cadd, String carea, String ccity, String email, String uname, String upass, String secq, String ans) {
        this.cmob = cmob;
        this.cname = cname;
        this.cadd = cadd;
        this.carea = carea;
        this.ccity = ccity;
        this.email = email;
        this.uname = uname;
        this.upass = upass;
        this.secq = secq;
        this.ans = ans;
    }

    // Getter and Setter Methods
    public String getCmob() {
        return cmob;
    }

    public void setCmob(String cmob) {
        this.cmob = cmob;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCadd() {
        return cadd;
    }

    public void setCadd(String cadd) {
        this.cadd = cadd;
    }

    public String getCarea() {
        return carea;
    }

    public void setCarea(String carea) {
        this.carea = carea;
    }

    public String getCcity() {
        return ccity;
    }

    public void setCcity(String ccity) {
        this.ccity = ccity;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getSecq() {
        return secq;
    }

    public void setSecq(String secq) {
        this.secq = secq;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
}