package com.mikey.entity;

public class Course {
    private String courseId;

    private String classId;

    private String courseName;

    private String courseYear;

    private String courseTerm;

    private Integer courseHour;

    private String courseMajor;

    private String courseGrade;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseYear() {
        return courseYear;
    }

    public void setCourseYear(String courseYear) {
        this.courseYear = courseYear;
    }

    public String getCourseTerm() {
        return courseTerm;
    }

    public void setCourseTerm(String courseTerm) {
        this.courseTerm = courseTerm;
    }

    public Integer getCourseHour() {
        return courseHour;
    }

    public void setCourseHour(Integer courseHour) {
        this.courseHour = courseHour;
    }

    public String getCourseMajor() {
        return courseMajor;
    }

    public void setCourseMajor(String courseMajor) {
        this.courseMajor = courseMajor;
    }

    public String getCourseGrade() {
        return courseGrade;
    }

    public void setCourseGrade(String courseGrade) {
        this.courseGrade = courseGrade;
    }

    @Override
    public String toString() {
        return "Course{" +
                "courseId='" + courseId + '\'' +
                ", classId='" + classId + '\'' +
                ", courseName='" + courseName + '\'' +
                ", courseYear='" + courseYear + '\'' +
                ", courseTerm='" + courseTerm + '\'' +
                ", courseHour=" + courseHour +
                ", courseMajor='" + courseMajor + '\'' +
                ", courseGrade='" + courseGrade + '\'' +
                '}';
    }
}