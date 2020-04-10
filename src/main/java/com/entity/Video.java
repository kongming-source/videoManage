package com.entity;

import java.util.List;

public class Video {
    private Integer vid;
    private String vname;
    private String pic;
    private String online;//发布时间
    private String author;
    private String area;//地区
    private Integer duration;
    private Integer power;
    private Integer state;
    private VideoPower videoPower;
    private List<Type> type;

    public Video() {
    }

    public Video(Integer vid, String vname, String pic, String online, String author, String area, Integer duration, Integer power, Integer state, VideoPower videoPower, List<Type> type) {
        this.vid = vid;
        this.vname = vname;
        this.pic = pic;
        this.online = online;
        this.author = author;
        this.area = area;
        this.duration = duration;
        this.power = power;
        this.state = state;
        this.videoPower = videoPower;
        this.type = type;
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public String getVname() {
        return vname;
    }

    public void setVname(String vname) {
        this.vname = vname;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getOnline() {
        return online;
    }

    public void setOnline(String online) {
        this.online = online;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public VideoPower getVideoPower() {
        return videoPower;
    }

    public void setVideoPower(VideoPower videoPower) {
        this.videoPower = videoPower;
    }

    public List<Type> getType() {
        return type;
    }

    public void setType(List<Type> type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Video{" +
                "vid=" + vid +
                ", vname='" + vname + '\'' +
                ", pic='" + pic + '\'' +
                ", online='" + online + '\'' +
                ", author='" + author + '\'' +
                ", area='" + area + '\'' +
                ", duration=" + duration +
                ", power=" + power +
                ", state=" + state +
                ", videoPower=" + videoPower +
                ", type=" + type +
                '}';
    }
}
