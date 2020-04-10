package com.test;

import com.dao.FavoritesDao;
import com.entity.Favorites;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class FavoritesTest {

    @Autowired
    private FavoritesDao favoritesDao;

    @Test
    public void queryTest(){

        List<Favorites> list = favoritesDao.query();
        for (Favorites f:list
             ) {
            System.out.println(f.toString());
        }

    }
    @Test
    public void getTest(){
        Integer uid = 1;
        List<Favorites> list = favoritesDao.get(uid);
        for (Favorites f:list
        ) {
            System.out.println(f.toString());
        }
    }

    @Test
    public void addTest(){
       Favorites f = new Favorites();
       f.setUid(1);
       f.setVid(2);
       f.setCreatetime("2020-01-03");
       int res = favoritesDao.add(f);
       if(res > 0){
           System.out.println("添加成功");
           System.out.println(favoritesDao.get(f.getUid()).toString());
       }else
           System.out.println("添加失败");
    }

    @Test
    public void delTest(){
        Favorites f = new Favorites();
        f.setUid(1);
        f.setVid(2);
        int res = favoritesDao.del(f);
        if(res > 0){
            System.out.println("取消收藏成功");
        }else
            System.out.println("取消收藏失败");
    }
}
