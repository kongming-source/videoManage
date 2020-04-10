package com.entity;

public class Power {
    private Integer uid;
    private Integer upid;
    //修改时要用
    private Integer old;
    private String startTime;
    private Integer duration;
    private Integer upstate;
    private UserPower  power;

    public Power() {
    }

    public Power(Integer uid, Integer upid, Integer old, String startTime, Integer duration, Integer upstate, UserPower power) {
        this.uid = uid;
        this.upid = upid;
        this.old = old;
        this.startTime = startTime;
        this.duration = duration;
        this.upstate = upstate;
        this.power = power;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getUpid() {
        return upid;
    }

    public void setUpid(Integer upid) {
        this.upid = upid;
    }

    public Integer getOld() {
        return old;
    }

    public void setOld(Integer old) {
        this.old = old;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getUpstate() {
        return upstate;
    }

    public void setUpstate(Integer upstate) {
        this.upstate = upstate;
    }

    public UserPower getPower() {
        return power;
    }

    public void setPower(UserPower power) {
        this.power = power;
    }

    @Override
    public String toString() {
        return "Power{" +
                "uid=" + uid +
                ", upid=" + upid +
                ", old=" + old +
                ", startTime='" + startTime + '\'' +
                ", duration=" + duration +
                ", upstate=" + upstate +
                ", power=" + power +
                '}';
    }
}
