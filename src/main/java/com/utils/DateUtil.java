package com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String getNowDate(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String nowDate = df.format(new Date());// new Date()为获取当前系统时间
        return nowDate;
    }
}
