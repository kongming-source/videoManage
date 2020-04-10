package com.dao;

import com.entity.Favorites;

import java.util.List;

public interface FavoritesDao {

    //查询所有收藏夹
    List<Favorites> query();

    //判断是否已收藏
    Favorites judge(Favorites f);
    //加载用户收藏夹
    List<Favorites>  get(Integer uid);

    //加入收藏夹
    int add(Favorites f);

    //取消收藏
    int del(Favorites f);


}
