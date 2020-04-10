package com.service;

import com.entity.UserPower;

import java.util.List;

public interface UserPowerService {

    //查询所有用户权限列表
    public List<UserPower> query();
}
