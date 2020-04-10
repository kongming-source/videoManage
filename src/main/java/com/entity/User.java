package com.entity;

public class User {

    private  Integer uid;
    private String uname;
    private String password;
    private String sex;
    private String phone;
    private String email;
    private Integer state;
    private Power userPower;

    public User() {
    }

    public User(Integer uid, String uname, String password, String sex, String phone, String email, Integer state, Power userPower) {
        this.uid = uid;
        this.uname = uname;
        this.password = password;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.state = state;
        this.userPower = userPower;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Power getUserPower() {
        return userPower;
    }

    public void setUserPower(Power userPower) {
        this.userPower = userPower;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", state=" + state +
                ", userPower=" + userPower +
                '}';
    }
}
