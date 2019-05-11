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

        java.util.Date dated=new java.util.Date();
//
//
//        String sql  =  "select * from sys_leave sl,sys_classes scl,sys_course sc" +
//                "where (leave_id like ? or sc.course_id like ? or leave_reason like ? or leave_dayNum like ? or stu_id like ? or leave_applyTime like ? or leave_status like ? or leave_auditTime like ? or leave_opinion like ?)\n" +
//                "  and sl.course_id = sc.course_id and sc.class_id=scl.class_id and dep_id = ?";
//
//        System.out.println(sql);
//        test();
    }

    public static void test(){

        Date date = new Date();

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");

        String format = sdf.format(date);

        System.out.println(format);

    }
}
