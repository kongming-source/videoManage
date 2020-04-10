package com.service;

import com.entity.Type;
import com.entity.TypeManage;

import java.util.List;

public interface TypeManageService {
    //查询
    List<Type> get(Integer vid);

    //添加
    boolean add(TypeManage tm);

    //分类
    List<TypeManage> queryByType(Integer tid);
}
