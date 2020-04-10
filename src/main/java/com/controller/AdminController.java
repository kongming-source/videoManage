package com.controller;

import com.entity.Power;
import com.entity.User;
import com.entity.UserPower;
import com.github.pagehelper.PageInfo;
import com.service.PowerService;
import com.service.UserPowerService;
import com.service.UserService;
import com.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private PowerService powerService;

    @Autowired
    private UserPowerService userPowerService;

    /*管理员登录*/
    @RequestMapping("/login")
    public ModelAndView login(User u , HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        if(u.getUname()!=null && u.getPassword()!=null){
            User user = userService.adminLogin(u);
            System.out.println(user.toString());
            if(user!=null){
                //登录成功，设置session
                /*u.setUid(user.getUid());
                request.getSession().setAttribute("admin",u);*/
                request.getSession().setAttribute("admin",user);
                mv.addObject("msg","登录成功！");
                mv.setViewName("forward:../backStage/mainManage.jsp");
            }else{
                //登录失败
                mv.addObject("msg","用户名或密码错误！");
                mv.setViewName("forward:../backStage/login.jsp");
            }
        }
        return mv;
    }

    /*管理员登出*/
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        if(request.getSession().getAttribute("admin")!=null){
            request.getSession().setAttribute("admin",null);
        }
        mv.setViewName("forward:../backStage/login.jsp");
        return mv;
    }

    /*分页查询用户权限*/
    @RequestMapping("/queryPower")
    public ModelAndView queryPower(User u,
                              @RequestParam(value = "checkName",required = true,defaultValue = "") String checkName,
                              @RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
                              @RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:../backStage/userPowerManage.jsp");
        PageInfo<User> p = null;
        if(checkName.equals(u.getUname())){
            p = userService.pageQuery(u,pageNum,pageSize);
        }else{
            p = userService.pageQuery(u,1,5);
        }
        mv.addObject("memoryName",u.getUname());
        mv.addObject("p",p);
        return mv;
    }

   /* 修改用户权限*/
    @RequestMapping("/powerMod")
    @ResponseBody
    public String powerMod(Power p){
        boolean res = powerService.mod(p);
        if(res) return "{\"msg\":\"修改成功！\"}";
        else return "{\"msg\":\"修改失败！\"}";
    }

    /*加载用户权限*/
    @RequestMapping("/powerGet/{uid}")
    public ModelAndView powerGet(@PathVariable Integer uid){
        ModelAndView mv = new ModelAndView();
        User u = userService.get(uid);
        List<UserPower> list = userPowerService.query();
        mv.setViewName("forward:/backStage/userPowerMod.jsp");
        mv.addObject("v",u);
        mv.addObject("powerlist",list);
        return mv;
    }


    /*分页查询用户*/
    @RequestMapping("/query")
    public ModelAndView query(User u,
                              @RequestParam(value = "checkName",required = true,defaultValue = "") String checkName,
                              @RequestParam(value = "pageNum",required = true,defaultValue = "1") Integer pageNum,
                              @RequestParam(value = "pageSize",required = true,defaultValue = "5") Integer pageSize){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("forward:../backStage/userManage.jsp");
        PageInfo<User> p = null;
        if(checkName.equals(u.getUname())){
            p = userService.pageQueryAll(u,pageNum,pageSize);
        }else{
            p = userService.pageQuery(u,1,5);
        }
        mv.addObject("memoryName",u.getUname());
        mv.addObject("p",p);
        return mv;
    }

    /*加载用户信息*/
    @RequestMapping("/get")
    @ResponseBody
    public User get(Integer uid){
        return userService.get(uid);
    }

    /*禁用用户*/
    @RequestMapping("/forbidden")
    @ResponseBody
    public String forbidden(Integer uid){
        boolean res = userService.forbidden(uid);
        if(res) return "{\"msg\":\"禁用成功！\"}";
        else return "{\"msg\":\"禁用失败！\"}";
    }

    /*解禁用户*/
    @RequestMapping("/unForbidden")
    @ResponseBody
    public String unForbidden(Integer uid){
        boolean res = userService.unForbidden(uid);
        if(res) return "{\"msg\":\"解禁成功！\"}";
        else return "{\"msg\":\"解禁失败！\"}";
    }

    /*添加用户*/
    @RequestMapping("/add")
    @ResponseBody
    public String add(User u){
        boolean res = userService.add(u);
        if(res){
            Power p = new Power(u.getUid(),2,null, DateUtil.getNowDate(),180,1,null);
            boolean flag = powerService.add(p);
            if(flag) return "{\"msg\":\"添加成功！\"}";
            else return "{\"msg\":\"添加失败！\"}";
        }else return "{\"msg\":\"添加失败！\"}";

    }
}
