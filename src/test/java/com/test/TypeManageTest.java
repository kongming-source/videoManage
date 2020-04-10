package com.test;

import com.dao.TypeManageDao;
import com.entity.Type;
import com.entity.TypeManage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class TypeManageTest {

    @Autowired
    private TypeManageDao typeManageDao;

    @Test
    public void getTest(){
        Integer vid = 1;
        List<Type> list = typeManageDao.get(vid);
        for (Type t: list
             ) {
            System.out.println(t.toString());
        }
    }

    @Test
    public void delTest(){
        TypeManage tm = new TypeManage();
        tm.setTid(2);
        tm.setVid(1);
        int res = typeManageDao.del(tm);
        if(res>0)
            System.out.println("删除成功！");
        else
            System.out.println("删除失败！");
    }

    @Test
    public void addTest(){
        TypeManage tm1 = new TypeManage(2,1,null);
        TypeManage tm2 = new TypeManage(3,1,null);
        List<TypeManage> list = new ArrayList<>();
        list.add(tm1);
        list.add(tm2);
        int res = typeManageDao.add(list);
        if(res>0)
            System.out.println("添加成功！");
        else
            System.out.println("添加失败！");

    }

}
