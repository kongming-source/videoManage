package com.service;

import com.entity.Video;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface VideoService {
    //查询所有视频
    public List<Video> query(Video v);

    //首页推荐
    List<Video> recommend();

    //分页查询
    PageInfo<Video> pageQuery(Video v, Integer pageNum, Integer pageSize);

    //加载单个视频
    public  Video get(Integer vid);

    //添加视频
    public boolean add(Video v);

    //更新视频
    public boolean mod(Video v);

    //删除视频
    public boolean del(Integer vid);
}
