package com.dao;

import com.entity.Power;

public interface PowerDao {

    //查询用户权限
    public Power query(Integer uid);
    //添加用户权限
    public int add(Power p);
    //更新用户权限
    public int mod(Power p);
    //删除用户权限
    public int del(Power p);
}
