package com.controller;

import com.entity.Favorites;
import com.entity.Type;
import com.service.FavoritesService;
import com.service.TypeService;
import com.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/favorites")
public class FavoritesController {
    @Autowired
    private FavoritesService favoritesService;

    @Autowired
    private TypeService typeService;

    @RequestMapping("/get/{uid}")
    public ModelAndView get(@PathVariable Integer uid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/favoritesList.jsp");
        //首页分类菜单
        List<Type> typelist = typeService.query();
        List<Favorites> list = favoritesService.get(uid);
        mv.addObject("list",list);
        mv.addObject("typelist",typelist);
        return mv;
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Favorites f){
        boolean res = false;
        if(f!=null){
            if(f.getUid()!=null&&f.getVid()!=null){
                //判断是否存在
                if(favoritesService.judge(f)){
                    //不存在
                    f.setCreatetime(DateUtil.getNowDate());
                    f.setFstate("有效");
                    res = favoritesService.add(f);
                }else{
                    return "{\"msg\":\"该视频已收藏！\"}";
                }

            }
        }
        if(res) return "{\"msg\":\"收藏成功！\"}";
        else return "{\"msg\":\"收藏失败！\"}";
    }

    @RequestMapping("/del")
    @ResponseBody
    public String del(Favorites f){
        boolean res = false;
        if(f!=null){
            if(f.getUid()!=null&&f.getVid()!=null){
                if(!favoritesService.judge(f))
                    res = favoritesService.del(f);
            }
        }
        if(res) return "{\"msg\":\"取消收藏成功！\"}";
        else return "{\"msg\":\"操作异常！\"}";
    }
}
