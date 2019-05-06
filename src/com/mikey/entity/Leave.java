package com.mikey.entity;

import java.util.Date;

public class Leave {

    private String leaveId;

    private String courseId;

    private String leaveReason;

    private Integer leaveDaynum;

    private String stuId;

    private Date leaveApplytime;

    private String leaveStatus;

    private Date leaveAudittime;

    private String leaveOpinion;
    //对应学生
    private Student student;
    //课程
    private Course course;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(String leaveId) {
        this.leaveId = leaveId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getLeaveReason() {
        return leaveReason;
    }

    public void setLeaveReason(String leaveReason) {
        this.leaveReason = leaveReason;
    }

    public Integer getLeaveDaynum() {
        return leaveDaynum;
    }

    public void setLeaveDaynum(Integer leaveDaynum) {
        this.leaveDaynum = leaveDaynum;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public Date getLeaveApplytime() {
        return leaveApplytime;
    }

    public void setLeaveApplytime(Date leaveApplytime) {
        this.leaveApplytime = leaveApplytime;
    }

    public String getLeaveStatus() {
        return leaveStatus;
    }

    public void setLeaveStatus(String leaveStatus) {
        this.leaveStatus = leaveStatus;
    }

    public Date getLeaveAudittime() {
        return leaveAudittime;
    }

    public void setLeaveAudittime(Date leaveAudittime) {
        this.leaveAudittime = leaveAudittime;
    }

    public String getLeaveOpinion() {
        return leaveOpinion;
    }

    public void setLeaveOpinion(String leaveOpinion) {
        this.leaveOpinion = leaveOpinion;
    }

    @Override
    public String toString() {
        return "Leave{" +
                "leaveId='" + leaveId + '\'' +
                ", courseId='" + courseId + '\'' +
                ", leaveReason='" + leaveReason + '\'' +
                ", leaveDaynum=" + leaveDaynum +
                ", stuId='" + stuId + '\'' +
                ", leaveApplytime=" + leaveApplytime +
                ", leaveStatus='" + leaveStatus + '\'' +
                ", leaveAudittime=" + leaveAudittime +
                ", leaveOpinion='" + leaveOpinion + '\'' +
                '}';
    }
}