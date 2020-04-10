package com.service.impl;

import com.dao.UserDao;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User login(User u) {
        return userDao.login(u);
    }

    @Override
    public User adminLogin(User u) {
        return userDao.adminLogin(u);
    }

    @Override
    public User judgeUname(String uname) {
        return userDao.judgeUname(uname);
    }

    @Override
    public List<User> query(User u) {
        return userDao.query(u);
    }

    @Override
    public PageInfo<User> pageQuery(User u, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list = userDao.query(u);
        PageInfo<User> p = new PageInfo<>(list);
        return p;
    }

    @Override
    public PageInfo<User> pageQueryAll(User u, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> list = userDao.queryAll(u);
        PageInfo<User> p = new PageInfo<>(list);
        return p;
    }

    @Override
    public User get(Integer uid) {
        return userDao.get(uid);
    }

    @Override
    public boolean add(User u) {
        return userDao.add(u)>0 ? true : false;
    }

    @Override
    public boolean mod(User u) {
        return userDao.mod(u)>0 ? true : false;
    }

    @Override
    public boolean forbidden(Integer uid) {
        return userDao.forbidden(uid)>0 ? true : false;
    }

    @Override
    public boolean unForbidden(Integer uid) {
        return userDao.unForbidden(uid)>0 ? true : false;
    }

    @Override
    public boolean del(User u) {
        return userDao.del(u)>0 ? true : false;
    }


}
