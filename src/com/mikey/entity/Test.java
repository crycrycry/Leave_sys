package com.mikey.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Program: Leave_sys
 * @Author: 麦奇
 * @Email： 1625017540@qq.com
 * @Create: 2019-04-26 08:12
 * @Describe：
 **/
public class Test {
    public static void main(String[] args){

        Date date = new Date();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmsss");

        String leave_id = sdf.format(date) + Math.random()*(999-100+1);

        System.out.println(leave_id);

        System.out.println((int)(Math.random()*(999-100+1)));
    }
}
