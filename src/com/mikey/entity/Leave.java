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

    public String getLeaveId() {
        return leaveId;
    }

    public void setLeaveId(String leaveId) {
        this.leaveId = leaveId == null ? null : leaveId.trim();
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId == null ? null : courseId.trim();
    }

    public String getLeaveReason() {
        return leaveReason;
    }

    public void setLeaveReason(String leaveReason) {
        this.leaveReason = leaveReason == null ? null : leaveReason.trim();
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
        this.stuId = stuId == null ? null : stuId.trim();
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
        this.leaveStatus = leaveStatus == null ? null : leaveStatus.trim();
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
        this.leaveOpinion = leaveOpinion == null ? null : leaveOpinion.trim();
    }
}