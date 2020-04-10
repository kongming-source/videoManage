package com.test;

import com.dao.VideoDao;
import com.entity.Video;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class VideoTest {

    @Autowired
    private VideoDao videoDao;

    @Test
    public void queryTest(){
        List<Video> list = videoDao.query(null);
        for (Video v:list
             ) {
            System.out.println(v.toString());
        }
    }

    @Test
    public void getTest(){
        Integer vid = 1;
        Video v = videoDao.get(vid);
        System.out.println(v.toString());
    }

    @Test
    public void addTest(){
        Video v = new Video();
        v.setVname("testtest");
        v.setPower(1);
        v.setDuration(90);
        v.setState(1);
       /* v.setOnline(new Date().toString());*/
        int res = videoDao.add(v);
        if(res>0)
            System.out.println("添加成功！");
        else
            System.out.println("添加失败！");
    }

    @Test
    public void modTest(){
        Integer vid = 2;
        Video v = videoDao.get(vid);
        v.setAuthor("larry");
        int res = videoDao.mod(v);
        if(res>0){
            System.out.println("更新成功！");
            System.out.println(videoDao.get(vid).toString());
        }
        else
            System.out.println("更新失败！");
    }

    @Test
    public void delTest(){
        Integer vid = 4;
        int res = videoDao.del(vid);
        if(res>0)
            System.out.println("删除成功！");
        else
            System.out.println("删除失败！");
    }

}
