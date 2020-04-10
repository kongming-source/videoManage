package com.service.impl;

import com.dao.FavoritesDao;
import com.entity.Favorites;
import com.service.FavoritesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoritesServiceImpl implements FavoritesService {

    @Autowired
    private FavoritesDao favoritesDao;

    @Override
    public boolean judge(Favorites f) {
        return favoritesDao.judge(f)==null ? true:false;
    }

    @Override
    public List<Favorites> get(Integer uid) {
        return favoritesDao.get(uid);
    }

    @Override
    public boolean add(Favorites f) {
        return favoritesDao.add(f)>0 ? true : false;
}

    @Override
    public boolean del(Favorites f) {
        return favoritesDao.del(f)>0 ? true : false;
    }
}
