package com.dao;

import com.entity.Video;

import java.util.List;

public interface VideoDao {
    //查询所有视频
    public List<Video> query(Video v);

    //首页推荐
    List<Video> recommend();

    //加载单个视频
    public  Video get(Integer vid);

    //添加视频
    public int add(Video v);

    //更新视频
    public int mod(Video v);

    //删除视频
    public int del(Integer vid);
}
