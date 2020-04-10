package com.service.impl;

import com.dao.VideoDao;
import com.entity.Video;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoServiceImpl  implements VideoService {

    @Autowired
    private VideoDao videoDao;
    @Override
    public List<Video> query(Video v) {
        return videoDao.query(v);
    }

    @Override
    public List<Video> recommend() {
        PageHelper.startPage(1,8);
        List<Video> list = videoDao.recommend();
        PageInfo<Video> p = new PageInfo<>(list);
        return p.getList();
    }

    @Override
    public PageInfo<Video> pageQuery(Video v,Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Video> list = videoDao.query(v);
        PageInfo<Video> p = new PageInfo<>(list);
       return p;
    }

    @Override
    public Video get(Integer vid) {
        return videoDao.get(vid);
    }

    @Override
    public boolean add(Video v) {
        return videoDao.add(v)>0 ? true : false;
    }

    @Override
    public boolean mod(Video v) {
        return videoDao.mod(v)>0 ? true : false;
    }

    @Override
    public boolean del(Integer vid) {
        return videoDao.del(vid)>0 ? true : false;
    }
}
