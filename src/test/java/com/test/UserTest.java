package com.test;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import com.utils.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class UserTest {
    @Autowired
    private UserDao userDao;

    @Autowired
    private UserService userService;

    @Test
    public void get(){
        Integer uid = 1;
        User u = userService.get(uid);
        System.out.println(u.toString());
       /* System.out.println(DateUtil.getNowDate());*/
    }

    @Test
    public void queryTest(){
        User u1 = new User();
        u1.setUname("user1");
        List<User> list = userDao.query(u1);
        for (User u: list
             ) {
            System.out.println(u.toString());
        }
    }

    @Test
    public void getTest(){
        Integer uid = 1;
        User u = userDao.get(uid);
        System.out.println(u.toString());
    }

    @Test
    public void addTest(){
        User u = new User();
        u.setUname("user1");
        u.setPassword("user1");
        int res = userDao.add(u);
        if(res>0)
            System.out.println("添加成功！");
        else
            System.out.println("添加失败！");
    }

    @Test
    public void modTest(){
        User u = new User();
        u.setUid(3);
        u.setUname("modTest");
        u.setPassword("test");
        int res = userDao.mod(u);
        if(res>0)
            System.out.println("更新成功！");
        else
            System.out.println("更新失败！");
    }

    @Test
    public void forbiddenTest(){
        Integer uid = 3;
        int res = userDao.forbidden(uid);
        if(res>0)
            System.out.println("禁用成功！");
        else
            System.out.println("禁用失败！");
    }
}
