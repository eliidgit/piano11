package com.jfinalshiromh.module.school.classinfo.vo;


public class ClassInfoVO {

    
    private int id;

    
    private String gradeClass;

    
    private int nowLesson;
    
    private int allLesson;
    
    private long teacherNum;

    
    private long studentNum;

    

    private int score;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    private int schedule;

    public String getGradeClass() {
        return gradeClass;
    }

    public void setGradeClass(String gradeClass) {
        this.gradeClass = gradeClass;
    }

    public int getNowLesson() {
        return nowLesson;
    }

    public void setNowLesson(int nowLesson) {
        this.nowLesson = nowLesson;
    }

    public int getAllLesson() {
        return allLesson;
    }

    public void setAllLesson(int allLesson) {
        this.allLesson = allLesson;
    }

    public long getTeacherNum() {
        return teacherNum;
    }

    public void setTeacherNum(long teacherNum) {
        this.teacherNum = teacherNum;
    }

    public long getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(long studentNum) {
        this.studentNum = studentNum;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getSchedule() {
        return schedule;
    }

    public void setSchedule(int schedule) {
        this.schedule = schedule;
    }
}
