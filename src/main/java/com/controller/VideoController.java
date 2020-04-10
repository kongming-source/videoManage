package com.controller;

import com.dao.TypeManageDao;
import com.entity.Type;
import com.entity.TypeManage;
import com.entity.Video;
import com.github.pagehelper.PageInfo;
import com.service.TypeManageService;
import com.service.TypeService;
import com.service.VideoService;
import com.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/video")
public class VideoController {
    @Autowired
    private VideoService videoService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private TypeManageService typeManageService;

    /* -----------------------------------后台使用--------------------------------------------------------*/
    @RequestMapping("/query")
    public ModelAndView query(Video v,
                              @RequestParam(value = "checkName",required = true,defaultValue = "") String checkName,
                              @RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
                              @RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/backStage/videoManage.jsp");

        PageInfo<Video> p = null;
        if(checkName.equals(v.getVname())){
            p = videoService.pageQuery(v,pageNum,pageSize);
        }else{
            p = videoService.pageQuery(v,1,5);
        }
        mv.addObject("memoryName",v.getVname());
        mv.addObject("p",p);
        return  mv;
    }

    /*封禁视频
    * 可能是由于违规，或内容不当
    */
    @RequestMapping("/forbidden")
    @ResponseBody
    public String forbidden(Integer vid){
        Video video = videoService.get(vid);
        if (video!=null){
            video.setState(3);
        }
        boolean res = videoService.mod(video);
        if(res) return "{\"msg\":\"已封禁！\"}";
        else return "{\"msg\":\"操作异常！\"}";
    }

    /*解除封禁*/
    @RequestMapping("/unForbidden")
    @ResponseBody
    public String unForbidden(Integer vid){
        Video video = videoService.get(vid);
        if (video!=null){
            video.setState(2);
        }
        boolean res = videoService.mod(video);
        if(res) return "{\"msg\":\"已封禁！\"}";
        else return "{\"msg\":\"操作异常！\"}";
    }

    /*审核通过*/
    @RequestMapping("/pass")
    @ResponseBody
    public String pass(Integer vid){
        Video video = videoService.get(vid);
        if (video!=null){
            video.setState(2);
        }
        boolean res = videoService.mod(video);
        if(res) return "{\"msg\":\"审核通过！\"}";
        else return "{\"msg\":\"操作异常！\"}";
    }

    /*加载视频信息*/
    @RequestMapping("/get/{vid}")
    public ModelAndView get(@PathVariable Integer vid){
        ModelAndView mv = new ModelAndView();
        Video v = videoService.get(vid);
        mv.setViewName("forward:/backStage/videoDetail.jsp");
        mv.addObject("v",v);
        return mv;
    }

    /* -----------------------------------前台使用--------------------------------------------------------*/
    /*首页推荐*/
    @RequestMapping("/indexQuery")
    public ModelAndView indexQuery(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/main.jsp");
        //首页分类菜单
        List<Type> typelist = typeService.query();
        //首页每日推荐（共8条）
        List<Video> recommendlist = videoService.recommend();
        //热门
        Video v = new Video();
        v.setState(2);
        PageInfo<Video> p = videoService.pageQuery(v,1,12);
        mv.addObject("hotlist",p.getList());
        mv.addObject("recommendlist",recommendlist);
        mv.addObject("typelist",typelist);
        return mv;
    }

    /*前台加载视频信息*/
    @RequestMapping("/frontGet/{vid}")
    public ModelAndView get1(@PathVariable Integer vid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/videoDetail.jsp");
        //首页分类菜单
        List<Type> typelist = typeService.query();
        //视频详情
        Video v = videoService.get(vid);
        mv.addObject("v",v);
        mv.addObject("typelist",typelist);
        return mv;
    }

    /*前台分类查询*/
    @RequestMapping("/queryByType/{tid}")
    public ModelAndView queryByType(@PathVariable Integer tid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/videoList.jsp");
        //首页分类菜单
        List<Type> typelist = typeService.query();
        List<Video> list = new ArrayList<>();
        //查询所有分类id
        List<TypeManage> tm = typeManageService.queryByType(tid);
        if(tm!=null){
            for (TypeManage t: tm) {
                Video v = videoService.get(t.getVid());
                if(v.getState()==2)
                    list.add(v);
            }
        }
        mv.addObject("videoList",list);
        mv.addObject("typelist",typelist);
        mv.addObject("type",tid);
        return mv;
    }

    /*前台搜索*/
    @RequestMapping("/seach")
    public ModelAndView seach(Video v){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/videoList.jsp");
        //首页分类菜单
        List<Type> typelist = typeService.query();
        //已通过审核
        v.setState(2);
        List<Video> list = videoService.query(v);
        mv.addObject("videoList",list);
        mv.addObject("typelist",typelist);
        return mv;
    }
    /*添加*/
    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:/videoAdd.jsp");
        //首页分类菜单
        List<Type> typelist = typeService.query();
        mv.addObject("typelist",typelist);
        return mv;
    }

    /*发布视频*/
    @ResponseBody
    @RequestMapping("/add")
    public String add(Video v,TypeManage tm, MultipartFile myfile, HttpServletRequest request){
        //上传图片并获得返回的文件名
        String filename = upload2(myfile,request);
        boolean flag = false;
        //设置图片
        v.setPic(filename);
        v.setState(1);
        v.setPower(1);
        v.setOnline(DateUtil.getNowDate());
        boolean res = videoService.add(v);
        if(res){
            tm.setVid(v.getVid());
            flag = typeManageService.add(tm);
        }
        if(flag) return "{\"msg\":\"发布成功！\"}";
        else return "{\"msg\":\"发布失败！\"}";
    }

    //上传图片公用方法
    public String upload2(MultipartFile myfile, HttpServletRequest request){
        //  获取文件名
        if(myfile != null && myfile.getSize()!=0){
            String filename =  myfile.getOriginalFilename();
            //  定义文件存储位置
            String pathFile = request.getSession().getServletContext().getRealPath("/");
            String filePath = pathFile+"images\\";
            File dirPath = new File(filePath);
            if (!dirPath.exists()) {
                dirPath.mkdirs();
            }
            //构建存储路径
            String files = filePath+filename;
            System.out.println("存储路径："+files);
            File file = new File(files);
            // 写入
            try {
                myfile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return filename;
        }
        return null;
    }

}
