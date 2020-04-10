package com.entity;

public class Favorites {

    private Integer uid;
    private Integer vid;
    private String createtime;
    private String fstate;
    private User user;
    private Video video;

    public Favorites() {
    }

    public Favorites(Integer uid, Integer vid, String createtime, String fstate, User user, Video video) {
        this.uid = uid;
        this.vid = vid;
        this.createtime = createtime;
        this.fstate = fstate;
        this.user = user;
        this.video = video;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getFstate() {
        return fstate;
    }

    public void setFstate(String fstate) {
        this.fstate = fstate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "Favorites{" +
                "uid=" + uid +
                ", vid=" + vid +
                ", createtime='" + createtime + '\'' +
                ", fstate='" + fstate + '\'' +
                ", user=" + user +
                ", video=" + video +
                '}';
    }
}
