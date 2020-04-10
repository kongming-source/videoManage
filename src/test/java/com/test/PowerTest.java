package com.test;

import com.dao.PowerDao;
import com.entity.Power;
import com.service.PowerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class PowerTest {

    @Autowired
    private PowerService powerService;

    @Autowired
    private PowerDao powerDao;

    @Test
    public void addTest(){
        Power p = new Power();
        p.setUid(9);
        //普通用户权限
        p.setUpid(2);
        powerService.add(p);
    }
}
