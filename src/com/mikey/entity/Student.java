package com.mikey.entity;

public class Student {
    private String stuId;

    private String classId;

    private String stuName;

    private String stuSex;

    private String stuAddress;

    private String stuTelephone;

    private String stuContact;

    private String stuContacttel;

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId == null ? null : classId.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex == null ? null : stuSex.trim();
    }

    public String getStuAddress() {
        return stuAddress;
    }

    public void setStuAddress(String stuAddress) {
        this.stuAddress = stuAddress == null ? null : stuAddress.trim();
    }

    public String getStuTelephone() {
        return stuTelephone;
    }

    public void setStuTelephone(String stuTelephone) {
        this.stuTelephone = stuTelephone == null ? null : stuTelephone.trim();
    }

    public String getStuContact() {
        return stuContact;
    }

    public void setStuContact(String stuContact) {
        this.stuContact = stuContact == null ? null : stuContact.trim();
    }

    public String getStuContacttel() {
        return stuContacttel;
    }

    public void setStuContacttel(String stuContacttel) {
        this.stuContacttel = stuContacttel == null ? null : stuContacttel.trim();
    }
}