package com.service.impl;

import com.dao.TypeManageDao;
import com.entity.Type;
import com.entity.TypeManage;
import com.service.TypeManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeManageServiceImpl implements TypeManageService {
    @Autowired
    private TypeManageDao typeManageDao;
    @Override
    public List<Type> get(Integer vid) {
        return typeManageDao.get(vid);
    }

    @Override
    public boolean add(TypeManage tm) {
        return typeManageDao.add1(tm)>0 ? true : false;
    }

    @Override
    public List<TypeManage> queryByType(Integer tid) {
        return typeManageDao.queryByType(tid);
    }
}
