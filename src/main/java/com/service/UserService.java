package com.service;

import com.entity.User;
import com.github.pagehelper.PageInfo;

import java.util.List;


public interface UserService {

    //登录处理
    public User login(User u);

    //管理员登录
    public User adminLogin(User u);

    //判断用户名是否重复
    public User judgeUname(String uname);

    //用户查询
    public List<User> query(User u);

    //用户分页查询
    public PageInfo<User> pageQuery(User u, Integer pageNum,Integer pageSize);

    //用户分页查询所有
    public PageInfo<User> pageQueryAll(User u, Integer pageNum,Integer pageSize);

    //加载用户
    public User get(Integer uid);

    //添加用户
    public boolean add(User u);

    //修改用户
    public boolean mod(User u);

    //禁用用户
    public boolean forbidden(Integer uid);

    //解禁用户
    public boolean unForbidden(Integer uid);

    //删除用户
    public boolean del(User u);

}
