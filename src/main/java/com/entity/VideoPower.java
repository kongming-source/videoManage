package com.entity;

public class VideoPower {
    private Integer videoPower_id;
    private String videoPower_name;

    public VideoPower() {
    }

    public VideoPower(Integer videoPower_id, String videoPower_name) {
        this.videoPower_id = videoPower_id;
        this.videoPower_name = videoPower_name;
    }

    public Integer getVideoPower_id() {
        return videoPower_id;
    }

    public void setVideoPower_id(Integer videoPower_id) {
        this.videoPower_id = videoPower_id;
    }

    public String getVideoPower_name() {
        return videoPower_name;
    }

    public void setVideoPower_name(String videoPower_name) {
        this.videoPower_name = videoPower_name;
    }

    @Override
    public String toString() {
        return "VideoPower{" +
                "videoPower_id=" + videoPower_id +
                ", videoPower_name='" + videoPower_name + '\'' +
                '}';
    }
}
