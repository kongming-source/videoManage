package com.dao;

import com.entity.Type;
import com.entity.TypeManage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeManageDao {

    //查询
    public List<Type> get(Integer vid);

    //分类
    List<TypeManage> queryByType(Integer tid);

    //添加
    int add1(TypeManage tm);





    //添加
    public int add(@Param("tm") List<TypeManage> list);

    //删除
    public int del(TypeManage tm);
}
