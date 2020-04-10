package com.dao;

import com.entity.User;

import java.util.List;

public interface UserDao {

    //处理登录
    public User login(User u);

    //用户名查重
    public User judgeUname(String uname);

    //查询所有用户，带其他信息
    public List<User> query(User u);

    //查询所有用户，不带其他信息
    public List<User> queryAll(User u);

    //加载用户
    public User get(Integer uid);

    //添加用户
    public int add(User u);

    //修改用户
    public int mod(User u);

    //禁用用户
    public int forbidden(Integer uid);

    //解禁用户
    public int unForbidden(Integer uid);

    //删除用户
    public int del(User u);

    //管理员登录
    public User adminLogin(User u);


}
