package com.dao;

import com.entity.UserPower;

import java.util.List;

public interface UserPowerDao {

    //查询所有用户权限列表
    public List<UserPower> query();
}
