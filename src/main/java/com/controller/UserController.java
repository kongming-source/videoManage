package com.controller;

import com.entity.Power;
import com.entity.User;
import com.entity.UserPower;
import com.service.PowerService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class
UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PowerService powerService;

   /*
   用户登录
   */
   @RequestMapping("/login")
   public ModelAndView login(User u , HttpServletRequest request){
       ModelAndView mv = new ModelAndView();
       if(u.getUname()!=null && u.getPassword()!=null){
           User user = userService.login(u);

           if(user!=null){
               //登录成功，设置session
               request.getSession().setAttribute("user",user);
               mv.addObject("msg","登录成功！");
               mv.setViewName("forward:../index.jsp");
           }else{
               //登录失败
               mv.addObject("msg","用户名或密码错误！");
               mv.setViewName("forward:../login.jsp");
           }
       }else{
           mv.addObject("msg","用户名或密码不为空！");
           mv.setViewName("forward:../login");
       }
       return mv;
   }

   //用户登出
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        if(request.getSession().getAttribute("user")!=null){
            request.getSession().setAttribute("user",null);
        }
        mv.setViewName("forward:../index.jsp");
        return mv;
    }

   /*用户注册*/
    @RequestMapping("/register")
    public ModelAndView register(User u){
        ModelAndView mv = new ModelAndView();
        //默认注册失败，跳转回注册页面
        mv.setViewName("forward:../register.jsp");
        /*判断用户名是否可用*/
        if(userService.judgeUname(u.getUname())!=null){
            //用户名被占用
            mv.addObject("msg","该用户名已被使用！");
        }else{
            //用户名未被占用，用户注册
            boolean flag = userService.add(u);
            if(flag){
                Power p = new Power();
                p.setUid(u.getUid());
                //普通用户权限
                p.setUpid(2);
                boolean res = powerService.add(p);
                if(res){
                    //注册成功，前往登录
                    mv.setViewName("forward:../login.jsp");
                    mv.addObject("msg","注册成功，立即登录");
                }else{
                    //注册失败
                    mv.addObject("msg","注册失败！");
                }
            }
        }

        return mv;
    }

    /*后台加载用户信息*/
    @RequestMapping("/get/{uid}")
    public ModelAndView get(@PathVariable Integer uid){
        ModelAndView mv = new ModelAndView();
        User u = userService.get(uid);
        mv.setViewName("forward:/backStage/userDetail.jsp");
        mv.addObject("u",u);
        return mv;
    }

    /*前台加载用户信息*/
    @RequestMapping("/userget/{uid}")
    public ModelAndView get1(@PathVariable Integer uid){
        ModelAndView mv = new ModelAndView();
        User u = userService.get(uid);
        mv.setViewName("forward:/userDetail.jsp");
        mv.addObject("u",u);
        return mv;
    }

    /* 修改用户密码*/
    @RequestMapping("/modPassword")
    @ResponseBody
    public String modPassword(Integer uid,String password , String newpassword){
        User u = null;
        if(uid!=null){
            u = userService.get(uid);
            if(u!=null){
                if(password!=null&&password!=""&&newpassword!=null&&newpassword!=""){
                    if(password.equals(u.getPassword())){
                        u.setPassword(newpassword);
                        boolean res = userService.mod(u);
                        if(res) return "{\"msg\":\"修改成功！\"}";
                    }else{
                        return "{\"msg\":\"请输入正确的密码！\"}";
                    }
                }
                return "{\"msg\":\"密码不为空！\"}";
            }
        }
        return "{\"msg\":\"修改失败！\"}";
    }

    /* 修改用户信息*/
    @RequestMapping("/mod")
    @ResponseBody
    public String mod(User u){
        boolean res = userService.mod(u);
        if(res) return "{\"msg\":\"修改成功！\"}";
        else return "{\"msg\":\"修改失败！\"}";
    }

}
