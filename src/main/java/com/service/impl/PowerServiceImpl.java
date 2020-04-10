package com.service.impl;

import com.dao.PowerDao;
import com.entity.Power;
import com.service.PowerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PowerServiceImpl implements PowerService {

    @Autowired
    private PowerDao powerDao;

    @Override
    public boolean add(Power p) {
        return powerDao.add(p)>0 ? true : false;
    }

    @Override
    public Power query(Integer uid) {
        return powerDao.query(uid);
    }

    @Override
    public boolean mod(Power p) {
        return powerDao.mod(p)>0 ? true : false;
    }
}
