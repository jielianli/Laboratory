package com.gy.Bean;

/**
 * 类名：Teacher
 * 描述：人生苦短，及时行乐
 * 作者：劫恋李
 * 日期：2021/5/4 14:58
 * 版本：V1.0
 */
public class Teacher {
    private  int tid;
    private String tname;
    private String trueName;
    private String tpass;
    private String tdepartment;
    private String contact;


    public Teacher() {
    }

    public Teacher(int tid, String tname, String trueName, String tpass, String tdepartment, String contact) {
        this.tid = tid;
        this.tname = tname;
        this.trueName = trueName;
        this.tpass = tpass;
        this.tdepartment = tdepartment;
        this.contact = contact;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getTpass() {
        return tpass;
    }

    public void setTpass(String tpass) {
        this.tpass = tpass;
    }

    public String getTdepartment() {
        return tdepartment;
    }

    public void setTdepartment(String tdepartment) {
        this.tdepartment = tdepartment;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }
}
