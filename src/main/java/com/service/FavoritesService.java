package com.service;

import com.entity.Favorites;

import java.util.List;

public interface FavoritesService {

    //判断是否已收藏
    boolean judge(Favorites f);

    //加载用户收藏夹
    List<Favorites>  get(Integer uid);

    //加入收藏夹
    boolean add(Favorites f);

    //取消收藏
    boolean del(Favorites f);
}
