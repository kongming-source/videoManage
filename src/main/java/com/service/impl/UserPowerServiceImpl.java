package com.service.impl;

import com.dao.UserPowerDao;
import com.entity.UserPower;
import com.service.UserPowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserPowerServiceImpl implements UserPowerService {

    @Autowired
    private UserPowerDao userPowerDao;
    @Override
    public List<UserPower> query() {
        return userPowerDao.query();
    }
}
