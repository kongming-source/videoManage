package com.entity;

public class UserPower {
    private Integer userPower_id;
    private String userPower_name;

    public UserPower() {
    }

    public UserPower(Integer userPower_id, String userPower_name) {
        this.userPower_id = userPower_id;
        this.userPower_name = userPower_name;
    }

    public Integer getUserPower_id() {
        return userPower_id;
    }

    public void setUserPower_id(Integer userPower_id) {
        this.userPower_id = userPower_id;
    }

    public String getUserPower_name() {
        return userPower_name;
    }

    public void setUserPower_name(String userPower_name) {
        this.userPower_name = userPower_name;
    }

    @Override
    public String toString() {
        return "UserPower{" +
                "userPower_id=" + userPower_id +
                ", userPower_name='" + userPower_name + '\'' +
                '}';
    }
}
