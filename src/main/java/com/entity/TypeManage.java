package com.entity;

public class TypeManage {
    private Integer tid;
    private Integer vid;
    private Type type;

    public TypeManage() {
    }

    public TypeManage(Integer tid, Integer vid, Type type) {
        this.tid = tid;
        this.vid = vid;
        this.type = type;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "TypeManage{" +
                "tid=" + tid +
                ", vid=" + vid +
                ", type=" + type +
                '}';
    }
}
